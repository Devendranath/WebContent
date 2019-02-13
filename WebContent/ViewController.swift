//
//  ViewController.swift
//  WebContent
//
//  Created by apple on 13/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var urlField: UITextField!
    
    @IBAction func proceedAction(_ sender: Any) {
    }
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loading HTML String
//        let htmlString = " <h1> This is HTML String </h1>"
//        webView.loadHTMLString(htmlString, baseURL: nil)
        
        // Loading HTML File
//        let filePath = Bundle.main.path(forResource: "Sample", ofType: "html")!
//
//        let fileURL = URL(fileURLWithPath: filePath)
//
//        let request = URLRequest(url: fileURL)
//        webView.load(request)
         
        let url = URL(string: "https://www.google.com")!
        let request = URLRequest(url: url)
        webView.navigationDelegate = self
        webView.load(request)
        
        //Calling a method some delay
//        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (aTimer) in
//            self.loadExternalURL()
//        }
//        timer.fire()
        
        
    }
    
    func loadExternalURL() {
        let url = URL(string: "https://www.google.com")
            
        UIApplication.shared.open(url!, options: [:]) { (isCompelted) in
            print("Loaded")
        }
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        print("decidePolicyFor navigationAction")
        print(navigationAction.navigationType)
    }
    
    
   func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print("decidePolicyFor navigationResponse")
    decisionHandler(.allow)
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
    }
    
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("didReceiveServerRedirectForProvisionalNavi")
    }
    
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("didFailProvisionalNavigation: \(error)")
    }
    
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("didCommit navigation")
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish navigation")
    }
    
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("didFail navigation: \(error)")
    }
    
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        print("didReceive challenge:")
        
        let credentials = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                
        completionHandler(.useCredential, credentials)
        
    }
    
    
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print("webViewWebContentProcessDidTerminate")
    }
    
    
}
