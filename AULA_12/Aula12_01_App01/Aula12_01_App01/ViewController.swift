//
//  ViewController.swift
//  Aula12_01_App01
//
//  Created by SP11793 on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "App 1"
        view.backgroundColor = .blue
    }
    
    @IBAction func getViewController() {
        
        let customUrl = "NavigationSchemes://"
        
        if let url = URL(string: customUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        
    }


}

