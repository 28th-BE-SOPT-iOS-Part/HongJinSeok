//
//  SecondVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/03.
//

import UIKit

class SecondVC: BaseVC {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var completeBtn: UIButton!
    
    @IBOutlet weak var email_TextField: UITextField!
    @IBOutlet weak var pwd_TextField: UITextField!
    @IBOutlet weak var repwd_TextField: UITextField!
    
    var textfields : [UITextField]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        UISetting()
        
        textfields = [email_TextField,pwd_TextField,repwd_TextField]
        
        email_TextField.delegate = self
        pwd_TextField.delegate = self
        repwd_TextField.delegate = self
    }

    @IBAction func completBtnClicked(_ sender: Any) {
        if buttonCheck(textfields!){
            guard let nextVC = storyboard?.instantiateViewController(identifier: "ThirdVC") as? ThirdVC else{return}
            
            if let email = email_TextField.text{
                nextVC.email = email
            }
            nextVC.modalPresentationStyle = .fullScreen
            
            self.present(nextVC, animated: true, completion: nil)
            
            back()
            
        }
    }
    
    func UISetting(){
        mainLabel.text = "카카오톡을 시작합니다"
        
        settingButton(completeBtn, "새로운 카카오계정 만들기")
        
        settingTextField(email_TextField, "이메일 또는 전화번호")
        settingTextField(pwd_TextField, "비밀번호")
        settingTextField(repwd_TextField, "비밀번호 확인")
        
    }
}
