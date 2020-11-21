//
//  APIConstants.swift
//  week6_serverPractice
//
//  Created by 선민승 on 2020/11/21.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://15.164.83.210:3000"
    // 로그인 url
    static let usersSignInURL = baseURL + "/users/signin"
    // 회원가입 url
    static let usersSignUpURL = baseURL + "/users/signup"
    
}

