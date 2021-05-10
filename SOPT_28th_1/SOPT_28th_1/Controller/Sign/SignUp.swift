//
//  SecondVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/03.
//

import UIKit

class SignUpVC: BaseVC {
    
    //업데이트
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
        AlertController.shared.delegate = self
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
        guard let email = email_TextField.text,
              let pwd = pwd_TextField.text else{return}
        var newUser = User(email: email, pwd: pwd)
        if pwd != repwd_TextField.text{
            newUser.email = nil
        }
        
        
        LoginService.shared.signup(newUser) { data in
            
            switch data{
            case .success(let data) :
                guard let data = data as? SignupResponse else { return }
                
                AlertController.shared.makeAlert(data.message,self)
                
            case .requestErr(let message):
                if let msg = message as? String{
                    AlertController.shared.makeAlert(msg,self)
                }
                return
            case .pathErr :
                print("patherr")
                return
            case .serverErr:
                print("serverErr")
                return
            case .networkFail:
                print("networkFail")
                return
            }
            
            //            let storyboard = UIStoryboard.init(name: "Tabbar", bundle : nil)
            //            guard let nextVC = storyboard.instantiateViewController(identifier: "TabbarVC") as? TabbarVC else{return}
            //
            //
            //            nextVC.modalPresentationStyle = .fullScreen
            //
            //            self.present(nextVC, animated: true, completion: nil)
            //
            //back()
        }
    }
}
extension SignUpVC : AlertDelegate{
    func getOK(_ alertController: AlertController) {
        
        guard let msg = alertController.message else{return}
        
        if msg.contains("성공"){//로그인 성공
            let storyboard = UIStoryboard.init(name: "Tabbar", bundle : nil)
            guard let nextVC = storyboard.instantiateViewController(identifier: "TabbarVC") as? TabbarVC else{return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
            self.back()
        }
        else{//실패
            
        }
        
        
    }
    
    
}
