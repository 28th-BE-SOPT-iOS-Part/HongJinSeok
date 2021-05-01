//
//  FriendsTableViewCell.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/30.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var Friendimage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    static let identifier = "FriendsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.font = UIFont.FriendName
        stateLabel.font = UIFont.FriendState
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(imageName : String, title: String, subtitle : String){
        Friendimage.image = UIImage(named: imageName)
        nameLabel.text = title
        stateLabel.text = subtitle
    }
    
}
