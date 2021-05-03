//
//  cellDelegate.swift
//  SOPT_28th_1
//
//  Created by 홍진석 on 2021/05/03.
//

import Foundation
import UIKit

protocol CellDelegate{
    func sendData(name: String, image : UIImage)
    func showPreView(hidden : Bool)
}
