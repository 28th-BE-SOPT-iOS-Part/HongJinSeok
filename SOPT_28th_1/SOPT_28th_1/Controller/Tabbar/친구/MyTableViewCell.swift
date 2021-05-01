//
//  MyTableViewCell.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/04/30.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    static let identifier = "MyTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.font = UIFont.MyName
        stateLabel.font = UIFont.FriendState
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(imageName : String, title: String, subtitle : String){
        myImage.image = UIImage(named: imageName)
        nameLabel.text = title
        stateLabel.text = subtitle
    }
    
}
