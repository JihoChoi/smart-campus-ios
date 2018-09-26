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
        https://youtu.be/C0Z6tJdeQ_E
    - Access Contacts
        https://youtu.be/83U9SxibsFk
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // let url = URL(string: "https://www.google.com")
        // let url = URL(string: "http://popeye.snu.ac.kr")
        
        // Temporal web page for the smart campus project
        let url = URL(string: "http://147.46.242.235")
        
        webView.loadRequest(URLRequest(url: url!))
    }


}

