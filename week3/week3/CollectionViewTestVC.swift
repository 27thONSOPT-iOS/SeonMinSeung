//
//  CollectionViewTestVC.swift
//  week3
//
//  Created by 선민승 on 2020/10/31.
//

import UIKit

class CollectionViewTestVC: UIViewController {

   
    @IBOutlet var bannerCollectionView: UICollectionView!
    
    //bannerPageControl
    
    var banners : [String] = ["plan", "design", "server", "ios", "android", "web"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        
        
        //bannerPageControl.numberOfPages = banners.count
    }
    
    
    


}

extension CollectionViewTestVC: UICollectionViewDataSource {
    
func collectionView(_ collectionView: UICollectionView,

numberOfItemsInSection section: Int) -> Int {

return banners.count
}
    func collectionView(_ collectionView: UICollectionView,

    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:

    PartBannerCell.identifier, for: indexPath) as? PartBannerCell else {

    return UICollectionViewCell()
    }
    cell.setImage(imageName: banners[indexPath.item])
    return cell
    }

}

extension CollectionViewTestVC: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

return CGSize(width: collectionView.frame.width,
height: collectionView.frame.height)

}
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

return 0
}
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

return 0
}
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}
}

//page control 추가하기


