//
//  DetailViewController.swift
//  DiaryTable
//
//  Created by 김주엽 on 2020/08/23.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var img: String = ""
    var text: String = ""
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: img)
        titleLabel.text = text
    }

    func receiveItem(_ img: String, _ text: String) {
        self.img = img
        self.text = text
    }
}
