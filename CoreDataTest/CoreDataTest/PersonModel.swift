//
//  PersonModel.swift
//  CoreDataTest
//
//  Created by Phelipe de Sterlich on 17.01.16.
//  Copyright © 2016 Phelipe de Sterlich. All rights reserved.
//

import UIKit
import CoreData

class PersonModel {
    
    var uuid: String
    var firstName: String
    var lastName: String
    var _saved: Bool
    
    init() {
        self.uuid = NSUUID().UUIDString
        self.firstName = ""
        self.lastName = ""
        self._saved = false
    }
    
    init(person: Person) {
        self.uuid = person.uuid!
        self.firstName = person.firstName!
        self.lastName = person.lastName!
        self._saved = true
    }
    
    func save() {
        // DoSomething(TM)
    }
    
    func insert() {
        // DoSomething(TM)
    }
    
    func delete() {
        // DoSomething(TM)
    }
    
    class func list() -> [PersonModel] {
        var list: [PersonModel] = []
        
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        do {
            let results = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Person]
            
            if results.count > 0 {
                for record in results {
                    list.append(PersonModel(person: record))
                }
            }
            
        } catch let error as NSError {
            print("Could not get: " + error.description)
        }
                
        return list
    }
}