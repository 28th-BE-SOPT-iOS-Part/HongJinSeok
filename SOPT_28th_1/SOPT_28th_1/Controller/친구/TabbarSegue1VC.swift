//
//  TabbarSegue1VC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/15.
//

import UIKit

class TabbarSegue1VC: UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.font = UIFont.main
        profileImg.addTapNextVC("ProfileVC")
    }
}
