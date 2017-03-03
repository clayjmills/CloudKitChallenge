//
//  CreateContactViewController.swift
//  CloudKitChallenge
//
//  Created by Clay Mills on 3/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit

// outlets and actions, create variable to edit, create a variable for contacts property, @Actionsavebutton functions for name, number, and email with cloudkitrecord data and popview to return, func for refreshing data

class CreateContactViewController: UIViewController {
    
    var contacts: Contacts?
    
    var editMode: Bool = false
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshViews()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if editMode == true {
        guard let name = nameTextField.text else {return}
        ContactsController.shared.createContact(withName: name, phoneNumber: phoneNumberTextField.text, email: emailTextField.text)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        self.editMode = false
        } else {
            guard let name = nameTextField.text else {return}
            ContactsController.shared.createContact(withName: name, phoneNumber: phoneNumberTextField.text, email: emailTextField.text)
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
    func refreshViews() {
        guard let contacts = contacts else {return}
        self.nameTextField.text = contacts.name
        self.phoneNumberTextField.text = contacts.phoneNumber
        self.emailTextField.text = contacts.email
    }
    
}
