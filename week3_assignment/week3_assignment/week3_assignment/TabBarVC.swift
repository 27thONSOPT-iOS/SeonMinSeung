//
//  TabBarVC.swift
//  week3_assignment
//
//  Created by 선민승 on 2020/11/09.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabs()
        self.tabBar.tintColor = UIColor(red: 245/255, green: 205/255, blue: 71/255, alpha: 255.0/255)
    }
    
    func setTabs(){
        guard let bannerVC = self.storyboard?.instantiateViewController(identifier: "BannerVC") as? BannerVC,
              let soptVC = self.storyboard?.instantiateViewController(identifier: "SOPT") as? ViewController else{
            return
        }
        bannerVC.tabBarItem.image = UIImage(systemName: "house")
        bannerVC.tabBarItem.title = "home"
            
        soptVC.tabBarItem.image = UIImage(systemName: "person")
        soptVC.tabBarItem.title = "person"
        
        setViewControllers([bannerVC, soptVC], animated: true) //순서에 따라서도 달라짐
    }

}
