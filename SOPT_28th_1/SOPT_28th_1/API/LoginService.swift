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
    
    private func makeParameter(_ email: String, _ password: String) -> Parameters {
        return ["email": email, "password": password]
    }
    
    func login(_ email : String, _ password : String , completion : @escaping(NetworkResult<Any>) -> Void ){
        let header : HTTPHeaders = [NetworkHeaderKey.CONTENT_TYPE.rawValue: APIConstants.APPLICATION_JSON]
        
        let dataRequest = AF.request(APIConstants.signinURL,
                                     method: .post,
                                     parameters: makeParameter(email, password),
                                     encoding: JSONEncoding.default,
                                     headers: header).validate(statusCode: 200...500)
        
        dataRequest.responseData { response in
            switch response.result{
   
            case .success :
                guard let statusCode =  response.response?.statusCode else { return }
                print(statusCode)
                guard let value =  response.value else{return}
                let networkResult = self.judgeStatus(by : statusCode, value)
                
                completion(networkResult)
    
            case .failure: completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode : Int, _ data : Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(LoginResponse.self, from: data)
        else{return .pathErr}
        
        switch statusCode {
        case 200: return .success(decodedData)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
