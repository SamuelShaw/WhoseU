//
//  ViewController.swift
//  WhoseU
//
//  Created by Samuel Shaw on 2/2/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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
            
            let persons = realm.objects(Person)
            print(persons)
        } catch {}
    }


}

