//
//  PickerViewTestVC.swift
//  week3
//
//  Created by 선민승 on 2020/10/31.
//

import UIKit

class PickerViewTestVC: UIViewController {
    @IBOutlet var partImageView: UIImageView!
    
    @IBOutlet weak var partNameLabel: UILabel!
    
    
    @IBOutlet weak var partPickerView: UIPickerView!
    
    //멤버변수
    var parts : [Part] = [] //빈배열 만들기, 이 배열을 채워주는 메소드가 필요 --> setPartData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //view가 로드 되면서 메모리가 로드되도록 여기서 setPartData 를 여기서 호출한다.
        setPartData()
        partPickerView.dataSource = self //위임하는 것
        partPickerView.delegate = self
        
    }
    
    func initLayout() { //실행하자마자 바로 나오는 디폴트 이미지와 파트이름 설정
        let initPart = parts[0]
        partImageView.image = initPart.makeImage()
        partNameLabel.text = initPart.partName
    }
    
    func setPartData() {
        parts.append(contentsOf: [
            Part(imageName: "plan", partName: "Plan"),
            Part(imageName: "design", partName: "Design"),
            Part(imageName: "server", partName: "Server"),
            Part(imageName: "ios", partName: "iOS"),
            Part(imageName: "android", partName: "Android"),
            Part(imageName: "web", partName: "Web")

        
        ])
        
    }
}

extension PickerViewTestVC: UIPickerViewDataSource {
    //필수적으로 해야하는거 첫번째
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        //예를 들어 알람은 세가지 영역이니가 return 3, 우리는 그냥 파트만 선택하면 되니까 1 리턴!
    }
    
    //필수적으로 해야하는거 두번째
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return parts.count
        //컴포넌트의 행의 개수를 알려주는 것임
        //따라서 컴포넌트별로 몇개의 행을 가지고 있는지 지정하는 부분이라서, 파트의 개수로 행을 구성하면 되니까
        // return parts.count
    }
    
}

extension PickerViewTestVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return parts[row].partName
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //didSelectRow 의 파라미터 row 는 선택된 row number 가 들어오게 된다.
        
        let selectPart = parts[row] //선택된 파트의 row number. 몇번째 행이 선택되었는지 나타난다.
        self.partImageView.image = selectPart.makeImage()
        self.partNameLabel.text = selectPart.partName
    }
}


