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
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    
    override func viewDidLoad() {
        version()
        initTitle()
        textView()
        initSubttitle()
        
    }
    
    private func version() {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        
        labelVersion.text = "Version: \(appVersion)"
    }
    
    private func textView() {
        textViewDescription.text = "Integrantes do Grupo:\n" +
                                   "- Carlos Henrique Pires\n" +
                                   "- Izabela Mateus\n" +
                                   "- João Victor Pizetta\n" +
                                   "- Jony Samarelli\n" +
                                   "- Luis Gustavo de Andrade Kokumai\n"
    }
    
    private func initTitle() {
        labelTitle.text = "Sobre o App"
    }
    
    private func initSubttitle() {
        labelSubtitle.text = "Your Music!"
    }
    
}
