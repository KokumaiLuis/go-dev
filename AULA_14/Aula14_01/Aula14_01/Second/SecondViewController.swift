//
//  SecondViewController.swift
//  Aula14_01
//
//  Created by SP11793 on 25/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.tintColor = UIColor.red
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var idProduct: String?
    
    @objc func closeModal() {
        dismiss(animated: true) {
            print("Dismiss")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let idProduct = idProduct {
            print(idProduct)
        }
        
        view.backgroundColor = UIColor.systemBlue
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
