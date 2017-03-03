//
//  ContactsTableViewController.swift
//  CloudKitChallenge
//
//  Created by Clay Mills on 3/3/17.
//  Copyright © 2017 PineAPPle LLC. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ContactsController.shared.contacts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath)
        
        let contacts = ContactsController.shared.contacts[indexPath.row]
        cell.textLabel?.text = contacts.name
        return cell
    }
    
    
    //Black Diamond
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEditContactDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            guard let detailVC = segue.destination as? CreateContactViewController else {return}
            let contacts = ContactsController.shared.contacts[indexPath.row]
            detailVC.contacts = contacts
            detailVC.editMode = true
        }
        
    }
    
    
}
