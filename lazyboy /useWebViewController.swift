//
//  useWebViewController.swift
//  GitLab_CL
//
//  Created by cs on 2018/8/29.
//  Copyright © 2018年 cs. All rights reserved.
//

import UIKit
import WebKit

class useWebViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate{

    let fullScreenSize = UIScreen.main.bounds.size
    
    var myTextField :UITextField!
    var myWebView :WKWebView!
    var myActivityIndicator:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 預設尺寸
        let goWidth = 100.0
        let actionWidth = ( Double(fullScreenSize.width) - goWidth ) / 4
        
        
       
        
        // 建立一個 UITextField 用來輸入網址
        myTextField = UITextField(frame: CGRect(x: 0, y: 20.0 + CGFloat(actionWidth), width: fullScreenSize.width, height: 40))
        myTextField.text = "http://www.muji.com/tw/products/cmdty/detail/4550002748838"
        myTextField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        myTextField.clearButtonMode = .whileEditing
        myTextField.returnKeyType = .go
        myTextField.delegate = self
        self.view.addSubview(myTextField)
        
        // 建立 WKWebView
        myWebView = WKWebView(frame: CGRect(x: 0, y: 60.0 + CGFloat(actionWidth), width: fullScreenSize.width, height: fullScreenSize.height - 60 - CGFloat(actionWidth)))
        
        // 設置委任對象
        myWebView.navigationDelegate = self
        
        // 加入到畫面中
        self.view.addSubview(myWebView)
        
        // 建立環狀進度條
        myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle:.gray)
        myActivityIndicator.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.5)
        self.view.addSubview(myActivityIndicator);
        
        // 先讀取一次網址
        self.go()
    }
    
    @objc func back() {
        // 上一頁
        myWebView.goBack()
    }
    
    @objc func forward() {
        // 下一頁
        myWebView.goForward()
    }
    
    @objc func reload() {
        // 重新讀取
        myWebView.reload()
    }
    
    @objc func stop() {
        // 取消讀取
        myWebView.stopLoading()
        
        // 隱藏環狀進度條
        myActivityIndicator.stopAnimating()
    }
    
    @objc func go() {
        // 隱藏鍵盤
        self.view.endEditing(true)
        
        // 前往網址
        let url = URL(string:myTextField.text!)
        let urlRequest = URLRequest(url: url!)
        myWebView.load(urlRequest)
        
        // 你也可以設置 HTML 內容到一個常數
        // 用來載入一個靜態的網頁內容
        // let content = "<html><body><h1>Hello World !</h1></body></html>"
        // myWebView.loadHTMLString(content, baseURL: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.go()
        
        return true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // 顯示進度條
        myActivityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 隱藏進度條
        myActivityIndicator.stopAnimating()
        
        // 更新網址列的內容
        if let currentURL = myWebView.url {
            myTextField.text = currentURL.absoluteString
        }
    }
    
}

