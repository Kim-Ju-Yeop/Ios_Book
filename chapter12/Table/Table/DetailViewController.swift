//
//  DetailViewController.swift
//  Table
//
//  Created by 김주엽 on 2020/08/22.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var receiveItem = ""
    
    @IBOutlet var IblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IblItem.text = receiveItem
    }
    
    func receiveItem(_ item: String) {
        receiveItem = item
    }
}
