//
//  ViewController.swift
//  ImageView
//
//  Created by 김주엽 on 2020/08/06.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imageView.image = imgOn
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if isZoom {
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale
            
            btnResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
            
            btnResize.setTitle("축소", for: .normal)
        }
        
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imageView.image = imgOn
        } else {
            imageView.image = imgOff
        }
    }
}

