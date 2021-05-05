//
//  MoreVC.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/05/05.
//

import UIKit

class MoreVC: UIViewController {

    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    private var menuList : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setting()
        setList()
        
    }
    
    func setting(){
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        mainLabel.font = UIFont.main
        nameLabel.font = UIFont.moreMyName
        idLabel.font = UIFont.moreMyID
        idLabel.textColor = UIColor.stateColor
        
        menuCollectionView.register(UINib(nibName: "MoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MoreCollectionViewCell.identifier)
    }
    func setList(){
        
        
        menuList.append(contentsOf: ["메일","캘린더","서랍","카카오콘","메이커스","선물하기","이모티콘","프렌즈","쇼핑하기","스타일","주문하기","멜론티켓","게임","멜론","헤어샵","전체서비스"])
    }
}

// MARK: - CollectionView
extension MoreVC : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (70/375)
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
    
}
extension MoreVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreCollectionViewCell.identifier, for: indexPath) as? MoreCollectionViewCell else {return UICollectionViewCell()}
        cell.menuName.text = self.menuList[indexPath.row]
        
        return cell
    }
}
