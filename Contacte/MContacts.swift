//
//  MContacts.swift
//  Contacte
//
//  Created by Buzoianu Stefan on 23/09/16.
//  Copyright © 2016 Buzoianu Stefan. All rights reserved.
//

import Foundation
import Contacts

class MContacts{
    
    //MARK - Get Contacts
//    func retrieveContactsWithStore(_ store: CNContactStore) {
//        do {
//        
//            // pentru full contacts -> container
//            let keys = CNContactFormatter.descriptorForRequiredKeys(for: .fullName)
//            let keysToFetch = [CNContactEmailAddressesKey, CNContactPhoneNumbersKey,keys] as [Any]
//            let containerId = CNContactStore().defaultContainerIdentifier()
//            let predicate: NSPredicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
//            let contacts:[CNContact] = try store.unifiedContacts( matching: predicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
//            
//            // pentru un singur contact
//            //      let keys = CNContactFormatter.descriptorForRequiredKeys(for: .fullName)
//            //      let predicate  = CNContact.predicateForContacts(matchingName: "Buzoianu")
//            //      let keysToFetch = [CNContactEmailAddressesKey, CNContactPhoneNumbersKey,keys] as [Any]
//            //      let contacts:[CNContact] = try store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch as! [CNKeyDescriptor] )
//            print("sunt \(contacts.count) contacte")
//            
//            for contact:CNContact in contacts {
//                let variabila = contact.phoneNumbers
//                for phoneNumber:CNLabeledValue in variabila
//                {
//                    let MobNumVar  = (phoneNumber.value ).value(forKey: "digits") as? String
//                    if phoneNumber.label != nil
//                    {
//                        let eticheta   =  CNLabeledValue<NSString>.localizedString(forLabel: phoneNumber.label!)
//                        print(contact.givenName, terminator:" ")
//                        print(contact.familyName, terminator:" ")
//                        print(" \(eticheta) \(MobNumVar!)")
//                    }
//                    
//                    else
//                    {
//                        print(contact.givenName, terminator:" ")
//                        print(contact.familyName, terminator:" ")
//                        print(MobNumVar!)
//
//                    }
//                }
//                
//                print("\n")
//                
//            }
//            
//        }
//        catch {
//            print(error)
//        }
//    }
    
    
       

    
}
