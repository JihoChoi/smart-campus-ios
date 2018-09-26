//
//  ViewController.swift
//  SCONE Smart Campus
//
//  Created by Jiho Choi on 2018. 9. 25..
//  Copyright © 2018년 iosteam. All rights reserved.
//

/*
 
 Swift Tutorials
    - Simple Web View
        https://youtu.be/xQmZSKxOYvs
        https://youtu.be/C0Z6tJdeQ_E
    - Access Contacts
        https://youtu.be/83U9SxibsFk
 */

import UIKit
import WebKit

class ViewController: UIViewController {

    // @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // let url = URL(string: "https://www.google.com")
        // let url = URL(string: "http://popeye.snu.ac.kr")
        // let url = URL(string: "http://147.46.242.235") // Temporal web page for the smart campus project
        // webView.loadRequest(URLRequest(url: url!))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url:URL = URL(string: "http://147.46.242.235")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }


}

