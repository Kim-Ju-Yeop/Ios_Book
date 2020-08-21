//
//  ViewController.swift
//  Navigation
//
//  Created by 김주엽 on 2020/08/18.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {

    // On, Off 형식에 따라 해당하는 이미지 정보를 가지고 있습니다.
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    // 현재 스위치가 On, Off 중 어떤 것인지 판단합니다.
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
    }
    
    // 네비게이션이 변경될 때 호출되는 메소드입니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // EditViewController 클래스를 참조할 수 있는 인스턴스 객체입니다.
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use bar button"
        }
        
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    
    // EditViewController 클래스에서 완료 버튼을 눌렀을 때 메시지 정보를 가져옵니다.
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    // EditViewController 클래스에서 완료 버튼을 눌렀을 때 스위치의 정보에 따른 다른 결과를 도출해냅니다.
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
}

