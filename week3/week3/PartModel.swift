//
//  PartModel.swift
//  week3
//
//  Created by 선민승 on 2020/10/31.
//

import UIKit
//모델 부분이다

struct Part {
    var imageName:String
    var partName: String
    
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
