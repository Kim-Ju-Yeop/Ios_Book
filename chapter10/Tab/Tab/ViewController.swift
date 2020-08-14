//
//  ViewController.swift
//  Tab
//
//  Created by 김주엽 on 2020/08/14.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

