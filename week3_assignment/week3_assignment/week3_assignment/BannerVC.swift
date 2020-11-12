//
//  BannerVC.swift
//  week3_assignment
//
//  Created by 선민승 on 2020/11/09.
//

import UIKit

class BannerVC: UIViewController {

    @IBOutlet var bannerCollectionView: UICollectionView!
    
    @IBOutlet var partName: UILabel!
    @IBOutlet var bannerPageControl: UIPageControl!
    
    @IBOutlet var loginButton: UIButton!
    
    var banners: [String] = ["plan", "design","server","ios","android","web"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        pageControlInit()
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        loginVC?.modalTransitionStyle = .coverVertical
        self.present(loginVC!, animated: true, completion: nil)
        
    }
    
    func pageControlInit() {
        bannerPageControl.numberOfPages=banners.count
        bannerPageControl.currentPageIndicatorTintColor = .systemYellow
    }
}

extension BannerVC: UICollectionViewDelegate{
    
}

extension BannerVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:PartBannerCell.identifier, for: indexPath) as? PartBannerCell else {
        //indexpath 별 cell 지정
        return UICollectionViewCell()
        }
        cell.setImage(imageName: banners[indexPath.item])
        return cell
    }
    
    
}

extension BannerVC: UICollectionViewDelegateFlowLayout {
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

extension BannerVC {
func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
bannerPageControl.currentPage = Int(scrollView.contentOffset.x) /

Int(scrollView.frame.width)
}
}
