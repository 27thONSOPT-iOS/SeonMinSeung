//
//  LoginVC.swift
//  week6_serverPractice
//
//  Created by 선민승 on 2020/11/21.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func touchUpLogin(_ sender: Any) {
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text else {
            return
        }
        //싱글톤 객체로 만들어 놓은 것을 호출!
        AuthService.shared.signIn(
            email: emailText,
            password: passwordText) { (networkResult) in
            switch networkResult{
            case .success(let data):
                print("success")
                if let data = data as? SigninData {
                    self.simpleAlert(title: "로그인 성공!", message: "\(data.userName)님 로그인 성공!")
                    
                    UserDefaults.standard.set(data.userName, forKey: "userName")
                }
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleAlert(title: "로그인 실패!", message: message)
                }
                
                print("requestErr")
            case .pathErr:
                print("printErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func simpleAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message,
    preferredStyle: .alert)
    let okAction = UIAlertAction(title: "확인"

    ,style: .default)

    alert.addAction(okAction)
    present(alert, animated: true)
    }

}
