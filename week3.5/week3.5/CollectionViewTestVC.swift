//
//  CollectionViewTestVC.swift
//  week3.5
//
//  Created by 선민승 on 2020/11/12.
//

import UIKit

class CollectionViewTestVC: UIViewController {

    
    @IBOutlet var collectionView: UICollectionView!
    
    let horizonInset: CGFloat = 24.0
    let topInset: CGFloat = 41.0
    let bottomInset: CGFloat = 50
    
    let itemSpacing: CGFloat = 27.0
    let lineSpacing: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
}

extension CollectionViewTestVC : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath)
        
        return cell
    }
}

extension CollectionViewTestVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenHeight = UIScreen.main.bounds.height
        
        if indexPath.section == 0 {
            
            
            let cellHeight = 425 / 812 * screenHeight
            
            return CGSize(width: collectionView.frame.width,
                          height: cellHeight)
        }
        
        let cellWidth = (collectionView.frame.width - horizonInset * 2 - itemSpacing) / 2
        let cellHeight = 225 / 812 * screenHeight
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topInset, left: horizonInset, bottom: bottomInset, right: horizonInset)
    }
}
