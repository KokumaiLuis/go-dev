//
//  ManageObjectContext.swift
//  Aula09_01
//
//  Created by SP11793 on 17/03/22.
//

import Foundation
import UIKit
import CoreData

typealias onCompletionHandler = (String) -> Void

protocol managedReadProtocol {
    func getPersons() -> [Person]
}

protocol managedSaveProtocol {
    func save(person: Person, onCompletionHandler: onCompletionHandler)
}

protocol managedDeleteProtocol {
    func delete(id: String, onCompletionHandler: onCompletionHandler)
}


class ManagedObjectContext: managedReadProtocol, managedSaveProtocol, managedDeleteProtocol {
    
    private let entity = "Users"
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    
    func getPersons() -> [Person] {
        var listPerson: [Person] = []
        
        do {
            
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
            
            guard let persons = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return listPerson}
            
            for item in persons {
                
                if let id = item.value(forKey: "id") as? UUID,
                   let name = item.value(forKey: "name") as? String,
                   let lastName = item.value(forKey: "lastName") as? String,
                   let age = item.value(forKey: "age") as? Int {
                    
                    let person = Person(id: id, name: name, lastName: lastName, age: age)
                    listPerson.append(person)
                }
            }
        
        } catch let error as NSError {
            print("Error in request: \(error.localizedDescription)")
        }
        
        return listPerson
    }
    
    
    func save(person: Person, onCompletionHandler: (String) -> Void) {
        
    }
    
    
    func delete(id: String, onCompletionHandler: (String) -> Void) {
        
    }
    

}
