//
//  UserDetailViewController.swift
//  GitHubApiApp
//
//  Created by 滝浪翔太 on 2020/09/25.
//

import UIKit
import WebKit

class UserDetailViewController: UIViewController {
    
    //MARK: - Vars
    var webView: WKWebView!
    var userUrl: String!
    var titleText: String!

    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webView
        
        openUrl(urlString: userUrl)

        navigationItem.title = titleText
    }
    
    //MARK: - Functions
    func openUrl(urlString: String) {
        
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request as URLRequest)
    }
}
