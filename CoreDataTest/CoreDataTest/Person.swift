//
//  Person.swift
//  CoreDataTest
//
//  Created by Phelipe de Sterlich on 17.01.16.
//  Copyright © 2016 Phelipe de Sterlich. All rights reserved.
//

import Foundation
import CoreData


class Person: NSManagedObject {

    func fromModel(source: PersonModel) {
        self.uuid = source.uuid
        self.firstName = source.firstName
        self.lastName = source.lastName
    }

}
