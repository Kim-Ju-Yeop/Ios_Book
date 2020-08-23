//
//  AddViewController.swift
//  DiaryTable
//
//  Created by 김주엽 on 2020/08/23.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 4
    let PICKER_VIEW_COLUMN = 1
    
    var imagesArray = [UIImage?]()
    var imagesFile = [ "1.png", "2.png", "3.png", "4.png" ]
    var imagesFileName = "1.png"

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imagesFile[i])
            imagesArray.append(image)
        }
        
        imageView.image = imagesArray[0]
    }
}

extension AddViewController {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imagesFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imagesFile[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imagesFileName = imagesFile[row]
        imageView.image = imagesArray[row]
    }

    @IBAction func btnAdd(_ sender: UIButton) {
        items.append(titleField.text!)
        itemsImage.append(imagesFileName)
        
        titleField.text = ""
        navigationController?.popViewController(animated: true)
    }
}
