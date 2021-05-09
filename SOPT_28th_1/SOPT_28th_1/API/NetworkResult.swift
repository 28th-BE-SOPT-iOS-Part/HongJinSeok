//
//  NetworkResult.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/05/10.
//

import Foundation

enum NetworkResult<T> {
    
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    
}
