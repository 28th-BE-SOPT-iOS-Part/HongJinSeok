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

extension UIButton{
    
    //버튼 UI 설정
    func custumBtn(_ title : String){
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.black, for: .normal)
        self.backgroundColor = UIColor.systemGray6
        
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: -20).isActive = true
   
        self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: 20).isActive = true
    }
}

extension UITextField{
    
    //텍스트 필드 밑줄
    func underline(_ placeholder : String){
        self.borderStyle = .none
        self.returnKeyType = .done
        self.textColor = UIColor.lightGray
        self.font = UIFont.systemFont(ofSize: 18)
        self.placeholder = placeholder //placeholder 달기
        
        let border = CALayer()
        
        border.frame = CGRect(x: 0, y: self.frame.size.height+10, width: self.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
     
        self.layer.addSublayer((border))
    }
}

