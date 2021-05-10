//
//  SignupResponse.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/05/10.
//

import Foundation

struct SignupResponse : Codable{
    let success : Bool
    let message : String
    let data : User?
    
    enum CodingKeys : String, CodingKey{
        case success
        case message
        case data
    }
    
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey : .success)) ?? false
        message = (try? values.decode(String.self, forKey : .message)) ?? ""
        data = (try? values.decode(User.self, forKey : .data)) ?? nil
    }
}

struct User : Codable{
    var email : String?
    var password : String?
    var sex : String?
    var nickname : String?
    var phone : String?
    var birth : String?
    
    init(email : String, pwd : String){
        self.email = email
        self.password = pwd
    }
}
