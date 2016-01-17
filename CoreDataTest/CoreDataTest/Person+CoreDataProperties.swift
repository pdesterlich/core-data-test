//
//  Person+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Phelipe de Sterlich on 17.01.16.
//  Copyright © 2016 Phelipe de Sterlich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var uuid: String?

}
