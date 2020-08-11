//
//  ViewController.swift
//  WebView
//
//  Created by 김주엽 on 2020/08/11.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadHtmlFile()
    }
    
    func loadHtmlFile() {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let url = URL(fileURLWithPath: filePath!)
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
}

