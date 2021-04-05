//
//  FirstVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/03.
//

import UIKit

class FirstVC: BaseVC {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailLabel2: UILabel!
    
    @IBOutlet weak var email_TextField: UITextField!
    @IBOutlet weak var pwd_textField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var NloginBtn: UIButton!
    
    var textfields : [UITextField]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UISetting()
        
        textfields = [email_TextField,pwd_textField]
        
        email_TextField.delegate = self
        pwd_textField.delegate = self
    }
    
    func UISetting(){
        mainLabel.text = "카카오톡을 시작합니다"
       
        detailLabel.text = "사용하던 카카오 계정이있다면"
        detailLabel2.text = "이메일 또는 전화번호로 로그인해 주세요."
        detailLabel.textColor = UIColor.gray
        detailLabel2.textColor = UIColor.gray
        
        settingTextField(email_TextField, "이메일 또는 전화번호")
        settingTextField(pwd_textField, "비밀번호")
        
        settingButton(loginBtn, "카카오계정 로그인")
        settingButton(NloginBtn, "새로운 카카오계정 만들기")
        
    }

     @IBAction func loginBtnClicked(_ sender: Any) {
        if buttonCheck(textfields!){

            guard let nextVC = storyboard?.instantiateViewController(identifier: "ThirdVC") as? ThirdVC else{return}
            
            if let email = email_TextField.text{
                nextVC.email = email
            }
            
            nextVC.modalPresentationStyle = .overFullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
     }
    
    @IBAction func newBtnClicked(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "SecondVC") as? SecondVC else{return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
