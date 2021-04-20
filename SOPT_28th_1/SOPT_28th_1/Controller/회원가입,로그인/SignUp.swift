//
//  SecondVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/03.
//

import UIKit

class SignUpVC: BaseVC {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var completeBtn: UIButton!
    
    @IBOutlet weak var email_TextField: UITextField!
    @IBOutlet weak var pwd_TextField: UITextField!
    @IBOutlet weak var repwd_TextField: UITextField!
    
    var textfields : [UITextField]?
    
    // MARK: - ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        UISetting()
        
        textfields = [email_TextField,pwd_TextField,repwd_TextField]
        
        email_TextField.delegate = self
        pwd_TextField.delegate = self
        repwd_TextField.delegate = self
    }
    
    override func viewDidLayoutSubviews(){
        LayoutSetting()
    }
    
    // MARK: - Setting
    func UISetting(){
        mainLabel.text = "카카오톡을 시작합니다"
        completeBtn.custumBtn("새로운 카카오계정 만들기")
    }
    
    func LayoutSetting(){
        if email_TextField.placeholder == nil{
            email_TextField.underline("이메일 또는 전화번호")
        }
        
        if pwd_TextField.placeholder == nil{
            pwd_TextField.underline("비밀번호")
        }
        
        if repwd_TextField.placeholder == nil{
            repwd_TextField.underline("비밀번호 확인")
        }
    }
    
    // MARK: - IBAction
    @IBAction func completBtnClicked(_ sender: Any) {
        if buttonCheck(textfields!){
            let storyboard = UIStoryboard.init(name: "Tabbar", bundle : nil)
            guard let nextVC = storyboard.instantiateViewController(identifier: "TabbarVC") as? TabbarVC else{return}
            
    
            nextVC.modalPresentationStyle = .fullScreen
            
            self.present(nextVC, animated: true, completion: nil)
            
            back()
        }
    }
}
