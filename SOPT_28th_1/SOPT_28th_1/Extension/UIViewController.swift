//
//  UIViewController.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/19.
//

import Foundation
import UIKit

extension UIViewController{
    
    func swipDownDismiss(){
        let dismissGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
        dismissGesture.direction = .down
    
        self.view.addGestureRecognizer(dismissGesture)
        self.view.isUserInteractionEnabled = true
    }
    
    @objc func swipeDown(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func presentNextVC(_ next : String){
        guard let nextVC = storyboard?.instantiateViewController(identifier: "\(next)") else{return}
        
        nextVC.modalPresentationStyle = .overFullScreen
        
        self.present(nextVC, animated: true, completion: nil)
    }
}
