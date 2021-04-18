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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchImage(_:)))
        profileImg.addGestureRecognizer(tapGesture)
        profileImg.isUserInteractionEnabled = true
    }
    
    @objc func touchImage(_ gesture: UITapGestureRecognizer) {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC else{return}
        
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
