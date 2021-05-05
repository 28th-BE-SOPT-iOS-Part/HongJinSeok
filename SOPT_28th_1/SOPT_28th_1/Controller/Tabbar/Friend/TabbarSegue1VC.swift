//
//  TabbarSegue1VC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/15.
//

import UIKit

class TabbarSegue1VC: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var tableHeaderView: UIView!
    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myStateLabel: UILabel!
    
    private var friendList : [FriendDataModel] = []
    
    var celldelegate : CellDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
        setList()
                
    }
    // MARK: - setting ,setList
    func setting(){
        mainLabel.font = UIFont.main
        myNameLabel.font = UIFont.MyName
        myStateLabel.font = UIFont.FriendState
        myStateLabel.textColor = UIColor.stateColor
        
        
        let tapGesture = TapGesture(target: self, action: #selector(sendMyProfile(_:)))
        tapGesture.nextIdentifier = "ProfileVC"
        myProfileImage.addGestureRecognizer(tapGesture)
        myProfileImage.isUserInteractionEnabled = true
        
        profileTableView.tableHeaderView = tableHeaderView
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.separatorStyle = .none
        profileTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: FriendsTableViewCell.identifier)
    }
    
    func setList(){
        
        friendList.append(contentsOf: [
            FriendDataModel(imageName: "profileImage1",
                            name: "안솝트",
                            state: "배고파요"),
            FriendDataModel(imageName: "profileImage2",
                            name: "최솝트",
                            state: "피곤해요"),
            FriendDataModel(imageName: "profileImage3",
                            name: "정솝트",
                            state: "살려줘요"),
            FriendDataModel(imageName: "profileImage4",
                            name: "이솝트",
                            state: "워우워~~"),
            FriendDataModel(imageName: "profileImage5",
                            name: "유솝트",
                            state: "나는야 상태메세지!"),
            FriendDataModel(imageName: "profileImage6",
                            name: "박솝트",
                            state: "배고파요"),
            FriendDataModel(imageName: "profileImage7",
                            name: "박솝트",
                            state: "배고파요"),
            FriendDataModel(imageName: "profileImage8",
                            name: "박솝트",
                            state: "배고파요"),
            FriendDataModel(imageName: "profileImage9",
                            name: "박솝트",
                            state: "배고파요"),
            FriendDataModel(imageName: "profileImage10",
                            name: "박솝트",
                            state: "배고파요")
        ])
    }
    
    
    // MARK: - IBAction
    @IBAction func settingBtnClicked(_ sender: UIButton) {
        let optionMenu = UIAlertController(title: nil , message: nil, preferredStyle: .actionSheet)
        
        let Action1 = UIAlertAction(title: "편집", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        let Action2 = UIAlertAction(title: "친구 관리", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        let Action3 = UIAlertAction(title: "전체 설정", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(Action1)
        optionMenu.addAction(Action2)
        optionMenu.addAction(Action3)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    // MARK: - Objc
    @objc func sendMyProfile(_ gesture : TapGesture){
        guard let nextVC = storyboard?.instantiateViewController(identifier: gesture.nextIdentifier) else{return}
        self.celldelegate = nextVC as? CellDelegate
        
        celldelegate?.sendData(name: myNameLabel.text!, image: myProfileImage.image!)
        nextVC.modalPresentationStyle = .overFullScreen
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
}

extension TabbarSegue1VC : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let nextVC = storyboard?.instantiateViewController(identifier: "ProfileVC") else{return}
        self.celldelegate = nextVC as? CellDelegate
        
        if let friend = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell{
            celldelegate?.sendData(name: friend.nameLabel.text!, image: friend.Friendimage.image!)
        }
        
        nextVC.modalPresentationStyle = .overFullScreen
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "차단") { (action, view, completion) in
            //self.friendList.remove(at: indexPath.row)
            //tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        let hideAction = UIContextualAction(style: .normal, title: "숨김") { (action, view, completion) in
            completion(true)
        }
        
        deleteAction.backgroundColor = .red
        hideAction.backgroundColor = .darkGray
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction,hideAction])
        
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
    }
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        let preView = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        
        let chatting = UIAction(title: "채팅하기") { _ in
            // Perform action
        }
        
        let voicetalk1 = UIAction(title: "보이스톡") { action in
            // Perform action
        }
        
        let voicetalk2 = UIAction(title: "보이스톡"){ action in
            // Perform action
        }
        
        let presenting = UIAction(title: "선물하기"){ action in
            // Perform action
        }
        //attributes: [.destructive],image: UIImage(systemName: "square.and.arrow.up.fill")
        
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: {() -> UIViewController in
                                            self.celldelegate = preView
                                            if let friend = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell{
                                                self.celldelegate?.sendData(name: friend.nameLabel.text!, image: friend.Friendimage.image!)
                                                self.celldelegate?.showPreView(hidden: true)
                                            }
                                            return preView}) { _ in
            UIMenu(children: [chatting, voicetalk1, voicetalk2, presenting])
        }
    }
}

extension TabbarSegue1VC : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as? FriendsTableViewCell else {return UITableViewCell()}
        
        cell.setData(imageName: friendList[indexPath.row].imageName, title: friendList[indexPath.row].name, subtitle: friendList[indexPath.row].state)
        
        return cell
    }
    
}

