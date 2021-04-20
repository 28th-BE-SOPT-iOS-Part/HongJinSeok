//
//  UIFont.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/15.
//

import Foundation
import UIKit

extension UIFont {
    class var main: UIFont {
        return UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22.0)!
    }
   
    class var profileName: UIFont {
       return UIFont(name: "AppleSDGothicNeo-Regular", size: 18.0)!
     }
    
    class var profileMenu: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: 10.0)!
    }
}
