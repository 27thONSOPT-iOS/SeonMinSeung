//
//  MusicRankCell.swift
//  week3
//
//  Created by 선민승 on 2020/10/31.
//

import UIKit

class MusicRankCell: UITableViewCell {

    //identifier라는 상수를 만들어준다. Static으로!
    //이유: identifier를 지정해야해서, 커스텀셀과 연결하기 위해 스태틱 함수로 만들어준다.
    
    static let identifier = "MusicRankCell"
    
    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var singerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(rank: Int, music: Music){
        albumImageView.image=music.makeAlbumImage()
        rankLabel.text = "\(rank + 1)"
        titleLabel.text = music.title
        singerLabel.text = music.singer
        
    }

}
