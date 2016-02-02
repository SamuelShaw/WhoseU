//
//  AddPersonViewController.swift
//  WhoseU
//
//  Created by Samuel Shaw on 2/2/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class AddPersonViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var firstNmaeTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var dobTextfield: UITextField!
    @IBOutlet weak var zipcodeTextfield: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.picker.dataSource = self
        self.picker.delegate = self
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 80
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row) years old"
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject)
    {
        let personAge = self.picker.selectedRowInComponent(0)
        let personFirstName = self.firstNmaeTextfield.text!
        let personLastName = self.lastNameTextfield.text!
        let personDOB = dobTextfield.text!
        let personZipcode = zipcodeTextfield.text!
        
        let person = Person()
        person.firstName = personFirstName
        person.lastName = personLastName
        person.age = personAge
        person.zipcode = personZipcode
        person.dob = personDOB
        
        do {
            let realm = try Realm()
            try realm.write{
                realm.add(person)
            }
            
                } catch {}
        self.navigationController?.popViewControllerAnimated(true)
    }


}
