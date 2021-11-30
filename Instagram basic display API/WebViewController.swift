//
//  WebViewController.swift
//  Instagram basic display API
//
//  Created by apple on 30.11.2021.
//

import Foundation
import WebKit
class WebViewController: UIViewController, WKNavigationDelegate {
    
    var instagramApi: InstagramApi?
    var testUserData: InstagramTestUser?
    var mainVC: ViewController?
    
    @IBOutlet var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instagramApi?.authorizeApp { (url) in
            DispatchQueue.main.async {
                self.webView.load(URLRequest(url: url!))
            }
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        //Get user id and token
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
    func dismissViewController() {
        DispatchQueue.main.async {
            self.dismiss(animated: true) {
                self.mainVC?.testUserData = self.testUserData!
            }
        }
    }
}
