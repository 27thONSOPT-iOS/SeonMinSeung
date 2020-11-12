//
//  ViewController.swift
//  serverStudy
//
//  Created by 선민승 on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.shared.getinfo { (response) in
            print(response)
        }
    }


}

