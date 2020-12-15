//
//  ViewController.swift
//  ContactsPractice
//
//  Created by Christian Hurtado on 12/13/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts = [Contact]() {
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }
    
    func loadData() {
        contacts = Contact.loadContacts()
    }
    
    public func loadContacts(dict: [Int:(String, String)]) -> [Contact] {
        var contactsList = [Contact]()
        
        for contact in dict {
            let contact = Contact(firstName: contact.value.0, lastName: contact.value.1, id: contact.key, fullName: "\(contact.value.0) \(contact.value.1)")
            contactsList.append(contact)
        }
        return contactsList
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Could not find detail vc/ indexpath")
        }
        let contact = contacts[indexPath.row]
        detailVC.contact = contact
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") else {
            fatalError("could not dequeue cell")
        }
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.fullName
        cell.detailTextLabel?.text = contact.id.description
        return cell
    }
    
    
}
