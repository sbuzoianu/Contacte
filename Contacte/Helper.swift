//
//  Helper.swift
//  Contacte
//
//  Created by Buzoianu Stefan on 26/09/16.
//  Copyright © 2016 Buzoianu Stefan. All rights reserved.
//

import Foundation
import Contacts
import UIKit


class Helper{

    var appDel:AppDelegate
    var store:CNContactStore
    var authorization:CNAuthorizationStatus
    static var instanceOfHelper:Helper?

    static func sharedInstance() -> Helper
    {
        if instanceOfHelper==nil
        {
            print("Sunt acum in \(#function) pe ramura de instanceOfHelper - nil")

            let authorizationStatus=CNContactStore.authorizationStatus(for:.contacts)
            instanceOfHelper=Helper(auth:authorizationStatus)
//            return instanceOfHelper!
        }
        else
        {
            print("Sunt acum in \(#function) pe ramura de instanceOfHelper - not nil")
//            return instanceOfHelper!
        }
        return instanceOfHelper!
  
    }

    
    
    private init(auth:CNAuthorizationStatus)
    {
        print("Sunt acum in \(#function)")
        authorization=auth
        appDel = UIApplication.shared.delegate! as! AppDelegate
        store = CNContactStore()
    }

        
    


func getAccessToContacts() {
        switch authorization
        {
        case .notDetermined:
            
            appDel.store.requestAccess(for: .contacts,
                                            completionHandler:
                {
                    (authorized: Bool, error: Error?) -> Void in
                    if authorized {
                        print("NotDetermined State!")
                    }
            })
        case .denied, .restricted:
            print("denied access")
            DispatchQueue.main.async(execute: { () -> Void in
                let title="Alert Title"
                let message = NSLocalizedString("Please allow `Contacte` to access your Contacts.", comment: "UIAlertController message")
                self.showAllowContactsAccessMessage(title, message)
            })
            
        case .authorized:
            print("authorized!")
            
            
        }
        
        
    }
    
    
    func retrieveContactsWithStore(_ store: CNContactStore) {
        do {

            // pentru full contacts -> container
            let keys = CNContactFormatter.descriptorForRequiredKeys(for: .fullName)
            let keysToFetch = [CNContactEmailAddressesKey, CNContactPhoneNumbersKey,keys] as [Any]
            let containerId = CNContactStore().defaultContainerIdentifier()
            let predicate: NSPredicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
            let contacts:[CNContact] = try store.unifiedContacts( matching: predicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])

            // pentru un singur contact
            //      let keys = CNContactFormatter.descriptorForRequiredKeys(for: .fullName)
            //      let predicate  = CNContact.predicateForContacts(matchingName: "Buzoianu")
            //      let keysToFetch = [CNContactEmailAddressesKey, CNContactPhoneNumbersKey,keys] as [Any]
            //      let contacts:[CNContact] = try store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch as! [CNKeyDescriptor] )
            print("sunt \(contacts.count) contacte")

            for contact:CNContact in contacts {
                let variabila = contact.phoneNumbers
                for phoneNumber:CNLabeledValue in variabila
                {
                    let MobNumVar  = (phoneNumber.value ).value(forKey: "digits") as? String
                    if phoneNumber.label != nil
                    {
                        let eticheta   =  CNLabeledValue<NSString>.localizedString(forLabel: phoneNumber.label!)
                        print(contact.givenName, terminator:" ")
                        print(contact.familyName, terminator:" ")
                        print(" \(eticheta) \(MobNumVar!)")
                    }

                    else
                    {
                        print(contact.givenName, terminator:" ")
                        print(contact.familyName, terminator:" ")
                        print(MobNumVar!)
                        
                    }
                }
                
                print("\n")
                
            }
            
        }
        catch {
            print(error)
        }
    }

    
    
   private  func showAllowContactsAccessMessage(_ title: String, _ message: String) {
        let okActionTitle = NSLocalizedString("Settings", comment: "Settings")
        let cancelActionTitle = NSLocalizedString("Cancel", comment: "Cancel")
        
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelActionTitle, style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: okActionTitle, style: .default) { (_) -> Void in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        self.appDel.window?.rootViewController?.present(alertViewController, animated: true, completion: nil)
        
    }
    
   
    
}
    
