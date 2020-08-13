//
//  ViewController.swift
//  NumberOfPageControl
//
//  Created by 김주엽 on 2020/08/13.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberCount = [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" ]

    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = numberCount.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        
        numberLabel.text = numberCount[0]
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        numberLabel.text = numberCount[pageControl.currentPage]
    }
}

