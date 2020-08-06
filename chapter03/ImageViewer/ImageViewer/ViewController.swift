//
//  ViewController.swift
//  ImageViewer
//
//  Created by 김주엽 on 2020/08/06.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let minImage: Int = 1
    let maxImage: Int = 6
    
    var numImage: Int?
    
    @IBOutlet var imageLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numImage = 1
        
        imageView.image = UIImage(named: String(numImage!) + ".png")
        imageLabel.text = "Image Viewer (" + String(numImage!) + ")"
    }
    
    @IBAction func btnPrevious(_ sender: UIButton) {
        numImage! -= 1
        
        if (numImage! < 1) {
            numImage = maxImage
        }
        
        imageView.image = UIImage(named: String(numImage!) + ".png")
        imageLabel.text = "Image Viewer (" + String(numImage!) + ")"
    }
    
    @IBAction func btnFollowing(_ sender: UIButton) {
        numImage! += 1
        
        if (numImage! > maxImage) {
            numImage = minImage
        }
        
        imageView.image = UIImage(named: String(numImage!) + ".png")
        imageLabel.text = "Image Viewer (" + String(numImage!) + ")"
    }
}

