//
//  ThirdViewController.swift
//  DesafioAula08_01
//
//  Created by SP11793 on 16/03/22.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var labelVersion: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    
    override func viewDidLoad() {
        version()
        
    }
    
    private func version() {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        
        labelVersion.text = "Version: \(appVersion)"
    }
    
    private func textView() {
        textViewDescription.text = "Aplicativo de música projetado pelo Grupo 6 do programa go!dev."
    }
    
}
