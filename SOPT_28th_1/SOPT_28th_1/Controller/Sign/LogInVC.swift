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
    
    // MARK: - ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UISetting()
        
        textfields = [email_TextField,pwd_textField]
        
        email_TextField.delegate = self
        pwd_textField.delegate = self
        AlertController.shared.delegate = self
    }
    
    override func viewDidLayoutSubviews(){
        LayoutSetting()
    }
    
    // MARK: - Setting
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

    // MARK: - IBAction
     @IBAction func loginBtnClicked(_ sender: Any) {
        if buttonCheck(textfields!){
            guard let email = email_TextField.text,
                  let pwd = pwd_textField.text else{return}
            
            LoginService.shared.login(email, pwd) { data in

                switch data{
                case .success(let data) :
                    guard let data = data as? LoginResponse else { return }
                    if let user = data.data{
                        print(user.token)
                    }
                    AlertController.shared.makeAlert(data.message,self)
                    
                    
//                  UserDefaults.standard.setValue(tokenData.jwt, forKey: UserKey.TOKEN)
//                  UserDefaults.standard.setValue(tokenData.nickname, forKey: UserKey.NICKNAME)
//                  UserDefaults.standard.setValue(self.idTextField.text, forKey: UserKey.ID)
                
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
            }
        }
     }
    
    @IBAction func newBtnClicked(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else{return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

extension LogInVC : AlertDelegate{
    func getOK(_ alertController: AlertController) {
        
        guard let msg = alertController.message else{return}
        
        if msg[msg.startIndex] == "로"{//로그인 성공
            let storyboard = UIStoryboard.init(name: "Tabbar", bundle : nil)
            guard let nextVC = storyboard.instantiateViewController(identifier: "TabbarVC") as? TabbarVC else{return}
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else{//실패
            
        }
        
    }
}
