//
//  BaseVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/03.
//

import UIKit

class BaseVC: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //텍스트필드 UI설정
    func settingTextField(_ textfield : UITextField, _ placeholder : String){
        textfield.borderStyle = .none
        textfield.returnKeyType = .done
        textfield.textColor = UIColor.lightGray
        textfield.font = UIFont.systemFont(ofSize: 18)
        textfield.placeholder = placeholder //placeholder 달기
        
        let border = CALayer()
        
        border.frame = CGRect(x: 0, y: textfield.frame.size.height+10, width: textfield.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
     
        textfield.layer.addSublayer((border))
    }
    
    //버튼 UI 설정
    func settingButton(_ button : UIButton, _ title : String){
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.systemGray6
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
   
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
    }
    
    //뒤로 가기
    func back(){
        if self.presentingViewController != nil {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    //조건 성립시에만 버튼 동작
    func buttonCheck(_ textfields : [UITextField]) -> Bool{
        for textfield in textfields{
            if textfield.text!.count == 0{
                return false
            }
        }
        return true
    }
}

extension BaseVC : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            if text.count > 0{
                textField.clearButtonMode = .always
                //텍스트가 있는 경우에는 항상 clear 버튼 노출
            }
            else{
                textField.clearButtonMode = .never
            }
        }
        return true
    }
}

