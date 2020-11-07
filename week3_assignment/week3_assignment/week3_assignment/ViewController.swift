//
//  ViewController.swift
//  week3_assignment
//
//  Created by 선민승 on 2020/11/05.
//

import UIKit

final class ViewController: UIViewController {
    let width = UIScreen.main.bounds.width

    private var person_image: [UIImage] {
        var person_image:[UIImage] = []
        for i in 0...6 {
//            let index = i + 1
            let index = 1
            let image = UIImage(named: "person\(index)")!
            person_image.append(image)
        }
        return person_image
    }
    
    private var person_name = ["이주혁","이주혁","이주혁","이주혁","이주혁","이주혁"]
    private var detail = [
        "#hereis#아요#내꿈은 #사과농장#ENFP",
        "#hereis#아요#내꿈은 #사과농장#ENFP",
        "#hereis#아요#내꿈은 #사과농장#ENFP",
        "#hereis#아요#내꿈은 #사과농장#ENFP",
        "#hereis#아요#내꿈은 #사과농장#ENFP",
        "#hereis#아요#내꿈은 #사과농장#ENFP"
    ]

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.collectionView.delegate=self
        self.collectionView.dataSource=self
        
//        let layout = UICollectionViewFlowLayout()
//               layout.scrollDirection = .vertical
//               layout.sectionInset = UIEdgeInsets(top: 0, left: (view.frame.width - 300)/3, bottom: 0, right: (view.frame.width - 300)/3)
//               layout.itemSize = CGSize(width: 150, height: 225)
               

//        collectionView.collectionViewLayout = layout
        

    }
    

}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return .init(width: 174, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let value = (width * 0.2) * 0.4
        return .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 420
        return CGSize(width: width, height: height)
        
    }


extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.person_name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroCell", for: indexPath) as? IntroCollectionViewCell {
            cell.name.text = self.person_name[indexPath.row]
            cell.person_image.image = person_image[indexPath.row]
            cell.detail.text = self.detail[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
   
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "IntroHeaderCollectionReusableView", for: indexPath)
            
        
            
            return headerView
        default:
            return UICollectionReusableView()

        }
    
    }
}
