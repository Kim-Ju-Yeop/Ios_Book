//
//  EditViewController.swift
//  Navigation
//
//  Created by 김주엽 on 2020/08/18.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

// 자바에서의 인터페이스와 같은 역할을하며 protocol이라고 부릅니다.
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {

    // ViewController에서 아울렛 변수들을 접근하지 못하기 때문에 이를 대신합니다.
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    
    @IBOutlet var IblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swlsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IblWay.text = textWayValue
        txMessage.text = textMessage
        swlsOn.isOn = isOn
    }

    // 완료 버튼을 눌렀을 때 delegate 메서드를 호출하는 역할을 합니다.
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: swlsOn.isOn)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
}
