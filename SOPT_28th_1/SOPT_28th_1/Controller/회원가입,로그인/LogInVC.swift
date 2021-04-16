//
//  FirstVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/03.
//

import UIKit

class LogInVC: BaseVC {

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
    
    override func viewDidLayoutSubviews(){
        LayoutSetting()
    }
    
    func UISetting(){
        mainLabel.text = "카카오톡을 시작합니다"
       
        detailLabel.text = "사용하던 카카오 계정이있다면"
        detailLabel2.text = "이메일 또는 전화번호로 로그인해 주세요."
        detailLabel.textColor = UIColor.gray
        detailLabel2.textColor = UIColor.gray
        
        loginBtn.custumBtn("카카오계정 로그인")
        NloginBtn.custumBtn("새로운 카카오계정 만들기")
        email_TextField.placeholder = ""

        
    }
    func LayoutSetting(){
        if email_TextField.placeholder == nil{
            email_TextField.underline("이메일 또는 전화번호")
        }
        if pwd_textField.placeholder == nil{
            pwd_textField.underline("비밀번호")
        }
    }

     @IBAction func loginBtnClicked(_ sender: Any) {
        if buttonCheck(textfields!){

            let storyboard = UIStoryboard.init(name: "Tabbar", bundle : nil)
            guard let nextVC = storyboard.instantiateViewController(identifier: "TabbarVC") as? TabbarVC else{return}

            
            nextVC.modalPresentationStyle = .overFullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
     }
    
    @IBAction func newBtnClicked(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else{return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
