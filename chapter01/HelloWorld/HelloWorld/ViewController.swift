//
//  ViewController.swift
//  HelloWorld
//
//  Created by 김주엽 on 2020/08/05.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var IblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        IblHello.text = "Hello, " + txtName.text!
    }
}

