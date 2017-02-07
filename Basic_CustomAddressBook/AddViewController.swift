//
//  AddViewController.swift
//  Basic_CustomAddressBook
//
//  Created by hhh on 2017-01-17.
//  Copyright © 2017 hhh. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!

    @IBAction func addButtonDidPress(_ sender: UIButton) {
//        print("The user entered \(nameField.text!)")
        if let person = Person(initFirstName: nameField.text!) {
            print("person \(person.firstName!) is created")
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Error creating person")
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
