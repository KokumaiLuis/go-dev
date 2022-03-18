//
//  ViewController.swift
//  Aula09_01
//
//  Created by SP11793 on 17/03/22.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    var person: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(){
        
        let person = Person(id: UUID(), name: "Luis", lastName: "Kokumai", age: 20)
        ManagedObjectContext.shared.save(person: person) { result in
            print(result)
        }
        
    }
    
    @IBAction func delete(){
        
        let id = "232C33F5-3F67-4D9D-9C40-E86F3DEB0A14"
        
        ManagedObjectContext.shared.delete(id: id) { res in
            print(res)
        }
        
    }
    
    @IBAction func get() {
        
        person = ManagedObjectContext.shared.getPersons()
        
        print(person)
        
    }


}

