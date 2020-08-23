//
//  AddViewController.swift
//  Table
//
//  Created by 김주엽 on 2020/08/22.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImage.append("clock.png")
        
        tfAddItem.text = ""
        navigationController?.popViewController(animated: true)
    }
}
