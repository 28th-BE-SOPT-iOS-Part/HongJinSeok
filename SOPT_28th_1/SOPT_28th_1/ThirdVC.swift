//
//  ThirdVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/03.
//

import UIKit

class ThirdVC: BaseVC {

    var email : String?
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var MainLabel2: UILabel!
    
    @IBOutlet weak var completeBtn: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        UISetting()
    }
    
    @IBAction func completeBtnClicked(_ sender: Any) {
        back()
    }
    
    func UISetting(){
    
        MainLabel.text = "\(email ?? "")님"
        MainLabel2.text = "가입이 완료되었습니다"
        
        completeBtn.custumBtn("확인")
        completeBtn.backgroundColor = UIColor.yellow
    }
}
