//
//  UIView.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/20.
//

import Foundation
import UIKit

extension UIView{
    var parentViewController: UIViewController? {
            var parentResponder: UIResponder? = self
            while parentResponder != nil {
                parentResponder = parentResponder!.next
                if let viewController = parentResponder as? UIViewController {
                    return viewController
                }
            }
            return nil
        }
    
    func addTapNextVC(_ next : String){
        let tapGesture = TapGesture(target: self, action: #selector(touchInside(_:)))
        tapGesture.nextIdentifier = next
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    
    }
    
    @objc func touchInside(_ gesture : TapGesture){
        parentViewController?.presentNextVC(gesture.nextIdentifier)
    }
}
