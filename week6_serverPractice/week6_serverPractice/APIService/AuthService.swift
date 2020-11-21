//
//  AuthService.swift
//  week6_serverPractice
//
//  Created by 선민승 on 2020/11/21.
//

import Foundation
import Alamofire

struct AuthService {
    //싱글톤
    //특정 용도로 객체를 하나 생성하여 공용으로 사용하고 싶을 때 사용하는 방법!
    //여러 객체에서 접근 가능하도록 데이터를 사용하게 된다.
    //즉, 프로그램 내에서 단 하나의 인스턴스로만 클래스를 관리하고 사용할 수 있다!
    
    static let shared = AuthService()
    
    //escaping closure! 말 그대로 탈출하는 클로져라는 뜻이다.
    //non-escaping 인 경우에는 해당 함수 내에서의 호출만 가능하다!
    //하지만 이러한 제약을 무시하기 위해 escaping closure 를 사용함
    func signIn(email: String, password: String, completion: @escaping(NetworkResult<Any>) -> ()) {
        let url = APIConstants.usersSignInURL
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        //header 의 키, 밸류 지정
        
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        //response 로 통신결과가 받아진다
        dataRequest.responseData { (response) in
            //통신결과에 대한 분기 처리 !
            
            switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode
                        else {
                        return
                        
                    }
                    guard let data = response.value else {
                        return
                    }
                    
                    completion(judgeSignInData(status: statusCode, data: data))
                    
                case .failure(let err):
                    print(err)
                    completion(.networkFail)
            }
        }
        
        
    }
    private func judgeSignInData(status: Int, data:Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        //data 로 들어온 것을 swift struct 로 decode 한다.
        
        guard let decodedData = try?decoder.decode(GenericResponse<SigninData>.self, from: data)else{
            return .pathErr
        }
        switch status {
            case 200:
            return .success(decodedData.data)
            
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        
        }
    }
}
