//
//  LoginService.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/05/10.
//

import Foundation
import Alamofire

struct LoginService {
    
    static let shared = LoginService()
    
    private func loginParameter(_ email: String, _ password: String) -> Parameters {
        return ["email": email, "password": password]
    }
    
    private func signupParameter(_ user : User) -> Parameters {
        return ["email": user.email ?? "",
                "password": user.password ?? "",
                "sex" : user.sex ?? "0",
                "nickname" : user.nickname ?? "sopt_test",
                "phone" : user.phone ?? "010-1111-1111",
                "birth" : user.birth ?? "1997-03-30"]
    }
    
    func login(_ email : String, _ password : String , completion : @escaping(NetworkResult<Any>) -> Void ){
        let header : HTTPHeaders = [NetworkHeaderKey.CONTENT_TYPE.rawValue: APIConstants.APPLICATION_JSON]
        
        let dataRequest = AF.request(APIConstants.signinURL,
                                     method: .post,
                                     parameters: loginParameter(email, password),
                                     encoding: JSONEncoding.default,
                                     headers: header).validate(statusCode: 200...500)
        
        dataRequest.responseData { response in
            switch response.result{
           
            case .success :
                guard let statusCode =  response.response?.statusCode else { return }
                print(statusCode)
                guard let value =  response.value else{return}
                let networkResult = self.judgeStatus(by : statusCode, value, 0)
                
                completion(networkResult)
    
            case .failure: completion(.pathErr)
            }
        }
    }
    
    func signup(_ user : User , completion : @escaping(NetworkResult<Any>) -> Void ){
        let header : HTTPHeaders = [NetworkHeaderKey.CONTENT_TYPE.rawValue: APIConstants.APPLICATION_JSON]
        
        let dataRequest = AF.request(APIConstants.signupURL,
                                     method: .post,
                                     parameters: signupParameter(user),
                                     encoding: JSONEncoding.default,
                                     headers: header).validate(statusCode: 200...500)
        
        dataRequest.responseData { response in
            
            switch response.result{
   
            case .success :
                guard let statusCode =  response.response?.statusCode else { return }
                print(statusCode)
                guard let value =  response.value else{return}
                
                let networkResult = self.judgeStatus(by : statusCode, value, 1)
                
                completion(networkResult)
    
            case .failure: completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode : Int, _ data : Data, _ funcKey : Int) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        
        switch funcKey {
        case 0:
            guard let decodedData = try? decoder.decode(LoginResponse.self, from: data)
            else{return .pathErr}
            switch statusCode {
            case 200: return .success(decodedData)
            case 400: return .requestErr(decodedData.message)
            case 500: return .serverErr
            default: return .networkFail
            }
        case 1:
            guard let decodedData = try? decoder.decode(SignupResponse.self, from: data)
            else{return .pathErr}
            print("asd")
            switch statusCode {
            case 200:
                print(decodedData)
                return .success(decodedData)
            case 400:
                print(decodedData)
                return .requestErr(decodedData.message)
            case 500: return .serverErr
            default: return .networkFail
            }
        default: return .networkFail
        }
    }
}
