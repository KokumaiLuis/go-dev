//
//  ViewController.swift
//  Aula18_01Demo
//
//  Created by SP11793 on 29/03/22.
//

import UIKit
import Aula18_01

class ViewController: UIViewController {

    lazy var button: Aula18_01Button = {
        let config = Aula18_01Button.Config.light()
        //let config = Aula18_01Button.Config.dark()
        let button = Aula18_01Button(config: config)
        button.setTitle("Favorite", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Demo"
        view.backgroundColor = .systemTeal
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

