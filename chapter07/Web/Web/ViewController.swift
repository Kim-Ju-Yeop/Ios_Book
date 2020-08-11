//
//  ViewController.swift
//  Web
//
//  Created by 김주엽 on 2020/08/11.
//  Copyright © 2020 Juyeop Kim. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.navigationDelegate = self
        loadWebPage("https://bit.ly/3iu4eg1")
    }
    
    
    // 프로토콜 포함 여부 확인
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        
        if (!flag) {
            strUrl = "https://" + strUrl
        }
        return strUrl
    }
    
    
    // 웹 뷰에 특정 URL 표시
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        
        myWebView.load(myRequest)
    }
    
    
    // 웹 뷰의 상황에 따른 인디케이터 처리
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    
    // 사용자가 입력한 특정 웹 사이트로 이동
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    
    // 상단 바로가기 버튼
    @IBAction func btnGoGithub(_ sender: UIButton) {
        loadWebPage("https://bit.ly/2XRozEe")
    }
    @IBAction func btnGoInstagram(_ sender: UIButton) {
        loadWebPage("https://bit.ly/31DFRFP")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1>HTML String</h1> <p>String 변수를 이용한 웹 페이지</p> <p><a href=\"https://bit.ly/3iu4eg1\">기술 블로그</a></p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        
        myWebView.load(myRequest)
    }
    
    
    // 하단의 툴바 버튼
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

