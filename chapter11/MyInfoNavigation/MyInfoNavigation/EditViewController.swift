//
//  EditViewController.swift
//  MyInfoNavigation
//
//  Created by 김주엽 on 2020/08/21.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

protocol EditProtocol {
    func edit(_ controller: EditViewController, name: String, age: String, group: String, phone: String)
}

class EditViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var groupField: UITextField!
    @IBOutlet var phoneField: UITextField!
    
    var name: String = ""
    var age: String = ""
    var group: String = ""
    var phone: String = ""
    var editProtocol: EditProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.text = name
        ageField.text = age
        groupField.text = group
        phoneField.text = phone
    }
    
    @IBAction func editEvent(_ sender: UIButton) {
        if (nameField.text!.isEmpty || ageField.text!.isEmpty || groupField.text!.isEmpty || phoneField.text!.isEmpty) {
            let alert = UIAlertController(title: "경고", message: "빈칸이 존재합니다.", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        } else {
            editProtocol.edit(self, name: nameField.text!, age: ageField.text!, group: groupField.text!, phone: phoneField.text!)
            navigationController?.popViewController(animated: true)
        }
    }
}
