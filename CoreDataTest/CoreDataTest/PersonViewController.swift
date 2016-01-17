//
//  PersonViewController.swift
//  CoreDataTest
//
//  Created by Phelipe de Sterlich on 17.01.16.
//  Copyright © 2016 Phelipe de Sterlich. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    var person: PersonModel = PersonModel()
    
    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFirstName.text = person.firstName
        textLastName.text = person.lastName
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        person.firstName = textFirstName.text!
        person.lastName = textLastName.text!

        let destController: TableViewController = segue.destinationViewController as! TableViewController
        destController.savePerson(person)
    }

}
