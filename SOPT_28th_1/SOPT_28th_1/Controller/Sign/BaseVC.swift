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


