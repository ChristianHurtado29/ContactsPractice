//
//  DetailViewController.swift
//  ContactsPractice
//
//  Created by Christian Hurtado on 12/14/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contact: Contact?
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        fullName.text = contact?.fullName ?? "no name"
        phoneNumber.text = contact?.id.description ?? "no phone number"
    }

}
