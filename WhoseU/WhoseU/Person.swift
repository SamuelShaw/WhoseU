//
//  Person.swift
//  WhoseU
//
//  Created by Samuel Shaw on 2/2/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object
{
    dynamic var firstName = ""
    dynamic var lastName = ""
    dynamic var dob = ""
    dynamic var zipcode = ""
    dynamic var age = 0
}
