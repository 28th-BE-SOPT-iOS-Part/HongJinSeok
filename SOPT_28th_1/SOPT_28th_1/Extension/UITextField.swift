//
//  UITextField.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/15.
//

import Foundation
import UIKit

extension UITextField{
    
    //텍스트 필드 밑줄
    func underline(_ placeholder : String){
        self.borderStyle = .none
        self.returnKeyType = .done
        self.textColor = UIColor.lightGray
        self.font = UIFont.systemFont(ofSize: 18)
        self.placeholder = placeholder //placeholder 달기
        
        let border = CALayer()
        
        border.frame = CGRect(x: 0, y: self.frame.size.height+7, width: self.frame.width, height: 1)

        border.backgroundColor = UIColor.lightGray.cgColor
     
        self.layer.addSublayer((border))
    }
}
