//
//  UserResponse.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/05/10.
//

import Foundation

struct LoginResponse : Codable{
    let success : Bool
    let message : String
    let data : UserData?
    
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
        data = (try? values.decode(UserData.self, forKey : .data)) ?? nil
    }
}

struct UserData : Codable{
    let UserId : Int
    let user_nickname : String
    let token : String
}
