//
//  ViewController.swift
//  WhoseU
//
//  Created by Samuel Shaw on 2/2/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var tableView: UITableView!
    
    var persons: Results<Person>?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let person = Person()
        person.firstName = "Sam"
        person.lastName = "Shaw"
        person.age = 21
        person.zipcode = "32806"
        person.dob = "10/18/1994"
        
        do {
        let realm = try Realm()
        try realm.write{
            realm.add(person)
        }
            
            self.persons = realm.objects(Person)
        } catch {}
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (persons?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let person = self.persons![indexPath.row]
        cell.textLabel!.text = "Check out \(person.firstName)'s info!"
        return cell
    }


}

