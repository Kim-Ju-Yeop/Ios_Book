//
//  ViewController.swift
//  MyInfoNavigation
//
//  Created by 김주엽 on 2020/08/21.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditProtocol {

    var images = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.png"]
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var groupLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as!EditViewController
        
        editViewController.name = nameLabel.text!
        editViewController.age = ageLabel.text!
        editViewController.group = groupLabel.text!
        editViewController.phone = phoneLabel.text!
        
        editViewController.editProtocol = self
    }
    
    func edit(_ controller: EditViewController, name: String, age: String, group: String, phone: String) {
        
        nameLabel.text = name
        ageLabel.text = age
        groupLabel.text = group
        phoneLabel.text = phone
        
        switch name {
        case "김종우":
            imageView.image = UIImage(named: images[0])
            break
        case "정성훈":
            imageView.image = UIImage(named: images[1])
            break
        case "김경훈":
            imageView.image = UIImage(named: images[2])
            break
        case "최진우":
            imageView.image = UIImage(named: images[3])
            break
        default:
            imageView.image = UIImage(named: images[4])
        }
    }
}

