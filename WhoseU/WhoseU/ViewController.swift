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
        
//        let person = Person()
//        person.firstName = "Sam"
//        person.lastName = "Shaw"
//        person.age = 21
//        person.zipcode = "32806"
//        person.dob = "10/18/1994"
//        
//        do {
//        let realm = try Realm()
//        try realm.write{
//            realm.add(person)
//        }
//            
//            self.persons = realm.objects(Person)
//        } catch {}
    }
    
    override func viewWillAppear(animated: Bool)
    {
        updateUI()
    }
    
    func updateUI()
    {
        do {
            let realm = try Realm()
            try realm.write{
            }
            
            self.persons = realm.objects(Person)
        } catch {}
        
        self.tableView.reloadData()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (persons?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : PersonTableViewCell = tableView.dequeueReusableCellWithIdentifier("PersonCell") as! PersonTableViewCell
        let person = self.persons![indexPath.row]
        cell.infoLabel1.text = "\(person.firstName) \(person.lastName) is \(person.age) years old. Their date of birth is \(person.dob) and current zipcode is \(person.zipcode)!"
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            let person = self.persons![indexPath.row]
            do {
                let realm = try Realm()
                try realm.write{
                    realm.delete(person)
                }
                
            } catch {}
            updateUI()
        }
    }


}

