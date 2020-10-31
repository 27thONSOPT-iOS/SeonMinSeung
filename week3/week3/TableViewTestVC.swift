//
//  TableViewTestVC.swift
//  week3
//
//  Created by 선민승 on 2020/10/31.
//

import UIKit

class TableViewTestVC: UIViewController {
    @IBOutlet var musicRankTableView: UITableView!
    
    var musicRank: [Music] = [] //빈배열
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMusicData()
        musicRankTableView.dataSource=self
        musicRankTableView.delegate=self
        
    }
    
    func setMusicData() { //빈배열 채우기
        musicRank.append(contentsOf: [
        Music(title: "Lovesick Girls", singer: "BLACK PINK", albumImageName: "blackpink"),
        Music(title: "Dynamite", singer: "방탄소년단", albumImageName: "bts"),
        Music(title: "positions", singer: "Ariana Grande", albumImageName: "ariana"),
        Music(title: "놓아줘 (with 태연)", singer: "크러쉬", albumImageName: "crush"),
        Music(title: "I CAN'T STOP ME", singer: "TWICE", albumImageName: "twice"),
        Music(title: "Make A Wish (Birthday Song)", singer: "NCT U", albumImageName: "nctu"),
        Music(title: "ALIEN", singer: "이수현", albumImageName: "leesuhyeon"),
        Music(title: "DON'T TOUCH ME", singer: "환불원정대", albumImageName: "hwanbool"),
        Music(title: "Pretty Savage", singer: "BLACKPINK", albumImageName: "blackpink"),
        Music(title: "Bet You Wanna (feat. Cardi B)", singer: "BLACKPINK", albumImageName: "blackpink")
        ])
    }
}


extension TableViewTestVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //섹션 별 행의 개수!
        //우리가 필요한 것은 음악 순위에 대한 행의 개수만큼 필요함.
        return musicRank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicRankCell.identifier)as? MusicRankCell else {
            return UITableViewCell()
            
        }
        //indexPath -> 섹션마다 달라지게됨. 센션별로 다른 행들을 불러와야함 = row
        cell.setCell(rank: indexPath.row, music: musicRank[indexPath.row])
        
        return cell
    }
    
    
}

extension TableViewTestVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectMusic = musicRank[indexPath.row]
        
        //navigation 안에있으니까 push 를 해줘야함
        
        //새로운 스토리보드를 만들어줘서 참조를 만들어줘야함
        let storyboard = UIStoryboard(name: "MusicInfo", bundle: nil)
        
        //name은 스토리보드의 이름
        //bundle은 무엇이지
        
        
        if let destination = storyboard.instantiateViewController(identifier: "MusicInfoVC") as? MusicInfoVC {
            //위의 destination을 화면에 push 함
            
            destination.music = selectMusic
            
            self.navigationController?.pushViewController(destination, animated: true)
        }
        
    }
}
