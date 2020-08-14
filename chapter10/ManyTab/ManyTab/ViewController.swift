//
//  ViewController.swift
//  ManyTab
//
//  Created by 김주엽 on 2020/08/14.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnMoveImage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnMoveDate(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func btnMovePicker(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
}

