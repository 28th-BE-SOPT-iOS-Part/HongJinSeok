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
        return UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22.0)! //뷰 메인 글씨 폰트
    }
   
    class var FriendName: UIFont {
       return UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12.0)! //친구 이름 폰트
     }
        
    class var FriendState: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: 11.0)!// 친구 상태메세지 폰트
      }
            
    class var profileName: UIFont {
       return UIFont(name: "AppleSDGothicNeo-Regular", size: 18.0)! //프로필 내 이름 폰트
     }
    
    class var profileMenu: UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: 10.0)! //프로필 내 메뉴 이름 폰트
    }
    
    class var MyName : UIFont {
        return UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16.0)! //내 이름 폰트
      }
}

