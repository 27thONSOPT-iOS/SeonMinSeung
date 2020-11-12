//
//  API.swift
//  server_example
//
//  Created by 우민지 on 2020/11/11.
//

import Foundation
import Alamofire

struct API {
    private init() { }
    
    static let shared = API()
    
    func getinfo(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let URL = "https://skhuserver.herokuapp.com/study/getinfo"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(URL,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: headers).response { response in
                    
                    
                    switch response.result {
                                        
                                        case .success:
                                            // parameter 위치
                                            if let value = response.value {
                                                //response의 respones안에 있는 statusCode를 추출
                                                if let status = response.response?.statusCode {
                                                    switch status {
                                                    case 200:
                                                        do{
                                                            let decoder = JSONDecoder()
                                                            let result = try decoder.decode(Info.self,
                                                                                            from: value!)
                                                            completion(.success(result))
                                                        } catch {
                                                            completion(.pathErr)
                                                        }
                                                    case 400:
                                                        completion(.pathErr)
                                                    case 500:
                                                        completion(.serverErr)
                                                    default:
                                                        break
                                                    }
                                                }
                                            }
                                            break
                                        case .failure(let err):
                                            print(err.localizedDescription)
                                            completion(.networkFail)
                                        }
                                       }
                            

                    
                    
//                //data 처리
//                    switch response.result {
//                    case .success :
//                        print("success")
//
//
//
//
//                    case .failure :
//                        print("fail")
//                    }
//
//
//                   }
        
    }
}
