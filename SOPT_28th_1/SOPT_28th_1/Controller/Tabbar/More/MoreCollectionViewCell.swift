//
//  MoreCollectionViewCell.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/05/05.
//

import UIKit

class MoreCollectionViewCell: UICollectionViewCell {

    static let identifier = "MoreCollectionViewCell"

    @IBOutlet weak var menuName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuName.font = UIFont.MoreMenu
        // Initialization code
    }

}
