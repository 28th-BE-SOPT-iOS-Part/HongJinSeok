//
//  APIConstants.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/05/10.
//

import Foundation

struct APIConstants{
    
    static let APPLICATION_JSON =  "application/json"
    static let BASE_URL = "http://cherishserver.com"
    
    static let signinURL = APIConstants.BASE_URL + "/login/signin"
    static let signupURL = APIConstants.BASE_URL + "/login/signup"
}
