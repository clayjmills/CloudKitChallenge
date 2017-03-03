//
//  Contacts.swift
//  CloudKitChallenge
//
//  Created by Clay Mills on 3/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import Foundation
import CloudKit

// import cloudkit, give properties to contacts, give keys to property names, initialize, adapt cloudkit records, create failable for cloudkitrecords

class Contacts {
    
    private let nameKey = "name"
    private let phoneNumberKey = "phoneNumber"
    private let emailKey = "email"
    
    let name: String
    let phoneNumber: String?
    let email: String?
    let CKRecordID: CKRecordID?
    
    init(name: String, phoneNumber: String?, email: String?) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.CKRecordID = nil
    }
    
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: "Contacts")
        record.setValue(name, forKey: nameKey)
        record.setValue(phoneNumber, forKey: phoneNumberKey)
        record.setValue(email, forKey: emailKey)
        return record
    }
    init?(CKRecord: CKRecord) {
        guard let name = CKRecord[nameKey] as? String else {return nil}
        self.name = name
        self.email = CKRecord[emailKey] as? String
        self.phoneNumber = CKRecord[phoneNumberKey] as? String
        self.CKRecordID = CKRecord.recordID
        
    }
    
}
