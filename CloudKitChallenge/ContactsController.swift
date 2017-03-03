//
//  ContactsController.swift
//  CloudKitChallenge
//
//  Created by Clay Mills on 3/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation
import CloudKit
// create CloudKitManger here
// import cloudkit, make it shared static(no singletons), create Array of Contacts, create funcs for creating, fetching, and editing contacts

class ContactsController {
    
    static let shared = ContactsController()
    
    var contacts: [Contacts] = []
    
    func createContact(withName: String, phoneNumber: String?, email: String?) {
       let contacts = Contacts(name: withName, phoneNumber: phoneNumber, email: email)
    }
    
}
