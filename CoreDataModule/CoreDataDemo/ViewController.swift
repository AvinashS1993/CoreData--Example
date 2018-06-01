//
//  ViewController.swift
//  CoreData
//
//  Created by Avinash Shirsath on 1/6/2018.
//  Copyright © 2018 Avinash Shirsath. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var age: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveClicked(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(self.username.text, forKey: "username")
        newUser.setValue(self.password.text, forKey: "password")
        newUser.setValue(self.age.text, forKey: "age")
        
        do {
            try context.save()
            
        } catch {
            print("Failed saving")
        }
    }
    
    @IBAction func featchclicked(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let name = data.value(forKey: "username")as! String
                print("Name : \(name)")
                
                let password = data.value(forKey: "password")as! String
                print("password : \(password)")
                
                let age = data.value(forKey: "age")as! String
                print("age : \(age)")
            }
            
        } catch {
            print("Failed")
        }
    }
    
}

