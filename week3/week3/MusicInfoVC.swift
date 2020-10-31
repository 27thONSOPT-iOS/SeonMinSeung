//
//  MusicInfoVC.swift
//  week3
//
//  Created by 선민승 on 2020/10/31.
//

import UIKit

class MusicInfoVC: UIViewController {

    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var singerLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var music: Music?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        

    }
    
    
    func setLayout() {
        if let music = self.music{
            titleLabel.text = music.title
            singerLabel.text = music.singer
            imageView.image = music.makeAlbumImage()
        }
        
        titleLabel.sizeToFit()
        singerLabel.sizeToFit()
    }


}
