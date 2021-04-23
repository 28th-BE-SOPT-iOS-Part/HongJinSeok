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
    
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var storyView: UIView!
    
    var lineCheck : Bool = false
    
    // MARK: - ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UISetting()
    }
    
    override func viewDidLayoutSubviews(){
        LayoutSetting()
    }
    
    // MARK: - Setting
    func UISetting(){
        
        self.swipDownDismiss()
        
        view.backgroundColor = UIColor.blueGrey
        
        chatLabel.font = UIFont.profileMenu
        editLabel.font = UIFont.profileMenu
        storyLabel.font = UIFont.profileMenu
        nameLabel.font = UIFont.profileName

        chatView.addTapNextVC("ChatVC")
        editView.addTapNextVC("EditVC")
        storyView.addTapNextVC("StoryVC")
    }
    
    func LayoutSetting(){
        
        for i in view.subviews{
            if lineCheck {break;}
            
            if i == menuStackView{
                let border = CALayer()
                
                border.frame = CGRect(x: 0, y: menuStackView.frame.origin.y - 11, width: self.view.frame.width, height: 1)
                border.backgroundColor = UIColor.coolGrey.cgColor
                view.layer.addSublayer(border)
        
                lineCheck = true
            }
        }
    }
    
    // MARK: - IBAction
    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
