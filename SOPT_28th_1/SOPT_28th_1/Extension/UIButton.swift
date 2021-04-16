//
//  UIButton.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/15.
//

import Foundation
import UIKit

extension UIButton{
    
    //버튼 UI 설정
    func custumBtn(_ title : String){
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.black, for: .normal)
        self.backgroundColor = UIColor.systemGray6
        
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: -20).isActive = true
   
        self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: 20).isActive = true
    }
}
