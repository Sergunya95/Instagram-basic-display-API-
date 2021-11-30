//
//  ViewController.swift
//  Instagram basic display API
//
//  Created by apple on 29.11.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var instagramApi = InstagramApi.shared
    var testUserData = InstagramTestUser(access_token: "", user_id: 0)
    var instagramUser: InstagramUser?
    var signedIn = false
    
    var button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton()
    }
    
    func createButton() {
       // button.frame = CGRect(x: 140, y: 620, width: 150, height: 40)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            // make.bottom.equalToSuperview().inset(100)
        }
    }
    
    @objc func tapButton() {
        // presentWebViewController()
        if self.testUserData.user_id == 0 {
            presentWebViewController()
        } else {
            //get account user’s details
        }
    }
    
    
    func presentWebViewController() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let webVC = storyBoard.instantiateViewController(withIdentifier: "WebView") as! WebViewController
        webVC.instagramApi = self.instagramApi
        webVC.mainVC = self
        self.present(webVC, animated:true)
    }
    
}

