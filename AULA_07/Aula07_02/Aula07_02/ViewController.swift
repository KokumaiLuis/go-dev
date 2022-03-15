//
//  ViewController.swift
//  Aula07_02
//
//  Created by SP11793 on 15/03/22.
//

import UIKit

struct Data {
    var age: Int
    var name: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "View Controller"
    }
    
    @IBAction func secondView(_ sender: Any) {
        let sender = Data(age: 20, name: "Luis")
        
        performSegue(withIdentifier: "secondViewController", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondViewController" {
             if let secondViewController = segue.destination as? SecondViewController {
                 secondViewController.property = sender as? Data
                 print("Estou dentro da viewcontroller \(secondViewController)")
                 
             }
            
        }
    }


}

