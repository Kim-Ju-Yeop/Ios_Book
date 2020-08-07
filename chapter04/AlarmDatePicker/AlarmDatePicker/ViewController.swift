//
//  ViewController.swift
//  AlarmDatePicker
//
//  Created by 김주엽 on 2020/08/07.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    
    var currentTime: String?
    var alarmSetTime: String?
    
    @IBOutlet var IblCurrentTime: UILabel!
    @IBOutlet var IblAlarmSetTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        
        alarmSetTime = formatter.string(from: datePickerView.date)
        IblAlarmSetTime.text = "알람 설정 시간 : " + alarmSetTime!
    }
    
    @objc func updateTime() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        
        currentTime = formatter.string(from: date as Date)
        IblCurrentTime.text = "현재 시간 : " + currentTime!
        
        compareTime()
    }
    
    @objc func compareTime() {
        if (currentTime == alarmSetTime) {
            view.backgroundColor = UIColor.systemBlue
        } else {
            view.backgroundColor = UIColor.white
        }
    }
}

