//
//  ViewController.swift
//  AlarmAlert
//
//  Created by 김주엽 on 2020/08/10.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var selectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        currentTime.text = formatter.string(from: date as Date)
        compareTime()
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        selectTime.text = formatter.string(from: sender.date)
    }
    
    func compareTime() {
        if (currentTime.text == selectTime.text) {
            let alarmAlert = UIAlertController(title: "알림", message: "설정한 시간이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            alarmAlert.addAction(onAction)
            present(alarmAlert, animated: true, completion: nil)
        }
    }
}

