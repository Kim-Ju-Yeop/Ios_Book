//
//  ViewController.swift
//  MultiPickerView
//
//  Created by 김주엽 on 2020/08/08.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let MAX_SIZE = 10
    let PICKER_COMPONENT = 2
    let PICKER_HEIGHT:CGFloat = 100
    let IMAGES_FILE_NAME = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
                             "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg" ]
    
    var imagesFile: [UIImage?] = []
    
    @IBOutlet var selectedItem: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< MAX_SIZE {
            let image = UIImage(named: IMAGES_FILE_NAME[i])
            imagesFile.append(image)
        }
        
        selectedItem.text = IMAGES_FILE_NAME[0]
        imageView.image = imagesFile[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_COMPONENT
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return IMAGES_FILE_NAME.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imagesFile[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            selectedItem.text = IMAGES_FILE_NAME[row]
        } else {
            imageView.image = imagesFile[row]
        }
    }
}

