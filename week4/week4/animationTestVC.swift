//
//  animationTestVC.swift
//  week4
//
//  Created by 선민승 on 2020/11/07.
//

import UIKit

class animationTestVC: UIViewController {

    @IBOutlet var animationImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func initPosition() {
        //87 162
        animationImage.frame = CGRect(x: 87, y: 162, width: 240, height: 216)
    }

    @IBAction func startButton(_ sender: Any) {
    
        
    //01
//        UIView.animate(withDuration: 2.0, animations: {
//            self.animationImage.alpha = 0
//        })
        
//        UIView.animate(withDuration: 2.0,  animations: {
//            self.animationImage.alpha = 0
//            self.animationImage.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
//        }, completion: {(finish) in
//            UIView.animate(withDuration: 1.0, animations: {
//                self.initPosition() //다시 돌아오게 해준다.
//                self.animationImage.alpha = 1
//
//            })
//        })
        
    
    //02
//        UIView.animate(withDuration: 2.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
//            self.animationImage.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
//        }, completion: {(finish )in
//            self.initPosition()
//        })
        
    //03
//        UIView.animate(withDuration: 2.0, animations: {
//            self.animationImage.transform = CGAffineTransform(scaleX: 2.0, y: 0.5)
//        })
        
    
    //04 여러가지 동작 한번에 실행해보기
        let scale = CGAffineTransform(translationX: 0.5, y: 0.5)
        let rotate = CGAffineTransform(rotationAngle: .pi)
        let move = CGAffineTransform(translationX: 20, y: 300)
        
        let combine = scale.concatenating(rotate).concatenating(move)
        //세가지 동작 합치기
        
        UIView.animate(withDuration: 2.0, animations: {
                    self.animationImage.transform = combine
        }, completion: {(finish) in
            self.animationImage.transform = .identity //원래로 돌리겠다라는 의미 
        })
        
    }
}
