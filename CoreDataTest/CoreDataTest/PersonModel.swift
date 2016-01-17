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
    
    let entityName: String = "Person"
    
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
    
    func getManagedObject(moc: NSManagedObjectContext) -> Person? {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "uuid == %@", self.uuid)
        
        do {
            let results = try moc.executeFetchRequest(fetchRequest) as! [Person]
            
            if results.count > 0 {
                let person = results[0]
                
                return person
            } else {
                print("Person not found")
                return nil
            }
        } catch let error as NSError {
            print("Could not get: " + error.description)
            return nil
        }
    }
    
    func save(moc: NSManagedObjectContext) -> Bool {
        if (!self._saved) {
            return insert(moc)
        } else {
            
            if let person: Person = getManagedObject(moc) {
                person.fromModel(self)

                do {
                    try moc.save()
                    
                    return true
                } catch let error as NSError {
                    print("Could not save: " + error.description)
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    func insert(moc: NSManagedObjectContext) -> Bool {
        let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: moc)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: moc) as! Person
        
        person.fromModel(self);
        
        do {
            try moc.save()
            
            self._saved = true
            
            return true
        } catch let error as NSError {
            print("Could not insert: " + error.description)
            return false
        }
    }
    
    func delete(moc: NSManagedObjectContext) -> Bool {
        if let person: Person = getManagedObject(moc) {
            moc.deleteObject(person)
            
            do {
                try moc.save()
                
                return true
            } catch let error as NSError {
                print("Could not delete: " + error.description)
                return false
            }
        } else {
            return false
        }
    }
    
    class func list(moc: NSManagedObjectContext) -> [PersonModel] {
        var list: [PersonModel] = []
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        do {
            let results = try moc.executeFetchRequest(fetchRequest) as! [Person]
            
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