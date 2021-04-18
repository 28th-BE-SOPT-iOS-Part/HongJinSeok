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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UISetting()
                    
    }
    
    override func viewDidLayoutSubviews(){
        LayoutSetting()
    }
    
    func UISetting(){
        
        view.backgroundColor = UIColor.blueGrey
        chatLabel.font = UIFont.profileMenu
        editLabel.font = UIFont.profileMenu
        storyLabel.font = UIFont.profileMenu
        nameLabel.font = UIFont.profileName
    
        let dismissGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
        dismissGesture.direction = .down
        view.addGestureRecognizer(dismissGesture)
        view.isUserInteractionEnabled = true
        
        chatView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchChat(_:))))
        editView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchEdit(_:))))
        storyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchStory(_:))))
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
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func swipeDown(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func touchChat(_ gesture: UITapGestureRecognizer) {
        goNextView("ChatVC")
    }
    @objc func touchEdit(_ gesture: UITapGestureRecognizer) {
        goNextView("EditVC")
    }
    @objc func touchStory(_ gesture: UITapGestureRecognizer) {
        goNextView("StoryVC")
    }
    
    func goNextView(_ next : String){
        guard let nextVC = storyboard?.instantiateViewController(identifier: "\(next)") else{return}
        
        nextVC.modalPresentationStyle = .automatic
        self.present(nextVC, animated: true, completion: nil)
    }
}
