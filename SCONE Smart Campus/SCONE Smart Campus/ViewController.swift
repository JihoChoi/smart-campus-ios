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
import Contacts


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var tableView: UITableView!
    
    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // let url = URL(string: "http://popeye.snu.ac.kr")
        // let url = URL(string: "http://147.46.242.235") // Temporal web page for the smart campus project
        // webView.loadRequest(URLRequest(url: url!))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Access Permission
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("Authorization Successful!")
            }
        }
        fetchContacts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contactToDisplay = contacts[indexPath.row]
        cell.textLabel?.text = contactToDisplay.givenName + " " + contactToDisplay.familyName
        cell.detailTextLabel?.text = contactToDisplay.phoneNumber
        
        return cell
    }
        
    func fetchContacts() {
        
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        
        // TODOs: Error handling required for the empty entries - e.g. Empty phone number
        try! contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
            
            let givenName = contact.givenName
            let familyName = contact.familyName
            let phoneNumber = contact.phoneNumbers.first?.value.stringValue
            
            let contactToAppend = ContactStruct(phoneNumber: phoneNumber!, givenName: givenName, familyName: familyName)
            
            self.contacts.append(contactToAppend)
        }
        tableView.reloadData()
        print(contacts.first?.givenName ?? "Default")
        print(contacts.first?.familyName ?? "Default")
        print(contacts.first?.phoneNumber ?? "000-000-0000")
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // let url:URL = URL(string: "http://popeye.snu.ac.kr")!
        let url:URL = URL(string: "http://147.46.242.235")!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        print("WebView Loaded")
    }
}

