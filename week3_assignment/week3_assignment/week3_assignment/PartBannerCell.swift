//
//  PartBannerCell.swift
//  week3_assignment
//
//  Created by 선민승 on 2020/11/09.
//

import UIKit

class PartBannerCell: UICollectionViewCell {
    
    static let identifier = "PartBannerCell"
    
    @IBOutlet var bannerImage: UIImageView!
    
    func setImage(imageName: String) {
        bannerImage.image=UIImage(named: imageName)
    }
}

