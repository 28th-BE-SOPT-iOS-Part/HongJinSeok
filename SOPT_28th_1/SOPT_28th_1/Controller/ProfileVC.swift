//
//  ProfileVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/15.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var menuStackView: UIStackView!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var editLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blueGrey
        chatLabel.font = UIFont.profileMenu
        editLabel.font = UIFont.profileMenu
        storyLabel.font = UIFont.profileMenu
        nameLabel.font = UIFont.profileName
        
        let dismissGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
        dismissGesture.direction = .down
        view.addGestureRecognizer(dismissGesture)
        view.isUserInteractionEnabled = true
    
    }
    
    override func viewWillLayoutSubviews() {
        let border = CALayer()
        
        border.frame = CGRect(x: 0, y: menuStackView.frame.origin.y - 11, width: self.view.frame.width, height: 1)
        border.backgroundColor = UIColor.coolGrey.cgColor
        view.layer.addSublayer(border)
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func swipeDown(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
