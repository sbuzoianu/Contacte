//
//  ViewController.swift
//  Contacte
//
//  Created by Buzoianu Stefan on 22/09/16.
//  Copyright © 2016 Buzoianu Stefan. All rights reserved.
//

import UIKit
import Foundation
import Contacts


class ViewController: UIViewController {

    let instance=Helper.sharedInstance()
    var i:Int=0

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidBecomeActive(notification:)),
            name: .UIApplicationDidBecomeActive ,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidEnterBackground(notification:)),
            name: .UIApplicationDidEnterBackground ,
            object: nil)
        
    }

    func appDidEnterBackground(notification: NSNotification) {
        
        print("am intrat in Background state")
    }

    
    func appDidBecomeActive(notification: NSNotification) {
        
        print("am intrat in Foreground state")
    }

    
    
    
    
    @IBAction func contactButton(_ sender: AnyObject) {
        print("s-a apasat pe buton!")
        
        if CNContactStore.authorizationStatus(for:.contacts) != .denied
        {
            Helper.sharedInstance().retrieveContactsWithStore(Helper.sharedInstance().appDel.store)
        }
        else{
            Helper.sharedInstance().getAccessToContacts()

        }

        
        i=i.advanced(by: 1)
        if i%2==0 {
         self.view.backgroundColor = UIColor.green
        }
        else {
            self.view.backgroundColor = UIColor.yellow
        }

    }
    
  
    
    
}

