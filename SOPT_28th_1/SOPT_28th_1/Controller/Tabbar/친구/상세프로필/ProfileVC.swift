//
//  ProfileVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/15.
//

import UIKit

class ProfileVC: UIViewController, CellDelegate {
    
    @IBOutlet weak var menuStackView: UIStackView!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var editLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var storyView: UIView!
    
    var celldelegate : CellDelegate?
    var getName : String?
    var getImage : UIImage?
    var lineCheck : Bool = false
    var getHidden : Bool?
    
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
        
        if let name = getName, let image = getImage{
            nameLabel.text = name
            profileImage.image = image
        }
        

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
    
    // MARK: - CellDelgate
    func sendData(name: String, image: UIImage) {
        getName = name
        getImage = image
    }
    
    func showPreView(hidden: Bool) {
        
        if hidden{
            DispatchQueue.main.async {
                self.chatLabel.isHidden = true
                self.editLabel.isHidden = true
                self.storyLabel.isHidden = true
                self.closeBtn.isHidden = true
            }
        }
    }
}
    
