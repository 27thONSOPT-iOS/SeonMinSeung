//
//  CustomTabBarController.swift
//  week4
//
//  Created by 선민승 on 2020/11/07.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
        
    }
    
    func setTabs(){
        guard let greenVC = self.storyboard?.instantiateViewController(identifier: "GreenVC") as? GreenVC,
              let blueVC = self.storyboard?.instantiateViewController(identifier: "BlueVC") as? BlueVC else{
            return
        }
        greenVC.tabBarItem.image = UIImage(systemName: "house")
        greenVC.tabBarItem.title = "house"
        
        blueVC.tabBarItem.image = UIImage(systemName: "person")
        blueVC.tabBarItem.title = "person"
        
        setViewControllers([greenVC, blueVC], animated: true) //순서에 따라서도 달라짐
    }
    

}
