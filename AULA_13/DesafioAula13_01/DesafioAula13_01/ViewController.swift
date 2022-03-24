//
//  ViewController.swift
//  DesafioAula13_01
//
//  Created by SP11793 on 23/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Public Properties
    lazy var loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        return loginLabel
    }()

    
    // MARK: - Life Cicles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    
    // MARK: - Private Methods
    
    private func configureView() {
        title = "Login"
        view.backgroundColor = UIColor.defaultBackgroundColor
    }


}

