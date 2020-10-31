//
//  MusicModel.swift
//  week3
//
//  Created by 선민승 on 2020/10/31.
//

import UIKit

struct Music {
    var title: String
    var singer : String
    
    var albumImageName: String
    
    func makeAlbumImage() -> UIImage?{
        return UIImage(named: albumImageName)
    }
}
