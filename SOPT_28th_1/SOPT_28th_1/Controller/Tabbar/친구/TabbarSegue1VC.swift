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
    
    private var myProfile : [FriendDataModel] = []
    private var friendList : [FriendDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.font = UIFont.main
        //profileImg.addTapNextVC("ProfileVC")
        setList()
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        profileTableView.separatorStyle = .none
        profileTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: FriendsTableViewCell.identifier)
        
        profileTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: MyTableViewCell.identifier)

    }
    
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
    
    func setList(){
        
        myProfile.append(FriendDataModel(imageName: "friendtab_profileImg",
                                         name: "김솝트",
                                         state: "상태메세지는 여기에"))
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
}

extension TabbarSegue1VC : UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

extension TabbarSegue1VC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return self.myProfile.count
        case 1:
            return self.friendList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var usingArray : [FriendDataModel] = []
    
        switch indexPath.section{
        case 0 :
            usingArray = self.myProfile
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else {return UITableViewCell()}
            cell.setData(imageName: usingArray[indexPath.row].imageName, title: usingArray[indexPath.row].name, subtitle: usingArray[indexPath.row].state)
            print(cell.myImage.frame.height)
            return cell
        case 1 :
            usingArray = self.friendList
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as? FriendsTableViewCell else {return UITableViewCell()}
            cell.setData(imageName: usingArray[indexPath.row].imageName, title: usingArray[indexPath.row].name, subtitle: usingArray[indexPath.row].state)
            return cell
        default: break
        }
        
        return UITableViewCell()
    }
    
}
