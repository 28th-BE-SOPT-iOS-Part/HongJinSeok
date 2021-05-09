//
//  AlertController.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/05/10.
//

import Foundation
import UIKit

class AlertController{
    
    static let shared = AlertController()
    var delegate : AlertDelegate?
    var message : String?
    
    func makeAlert(_ msg : String, _ currentView : UIViewController){
        let alert = UIAlertController(title: "알림", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: {
            (alert : UIAlertAction!) -> Void in
            self.delegate?.getOK(self)
        })
        alert.addAction(action)
        self.message = msg
        currentView.present(alert, animated: true, completion: nil)
    }
}
