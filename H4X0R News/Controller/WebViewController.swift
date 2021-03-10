//
//  WebViewController.swift
//  H4X0R News
//
//  Created by DOUG UNO on 3/8/21.
//

import UIKit
import WebKit
 
class WebViewController: UIViewController {
 
    var links: String = ""
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let url = URL (string: links)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
 
 
}
