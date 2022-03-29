//
//  CallsViewController.swift
//  DesafioAula15_01
//
//  Created by SP11793 on 28/03/22.
//

import UIKit

class CallsViewController: UIViewController {
    
    
    // MARK: - Private Variables
    
    private let titleScreen = "Calls"
    
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfig()
    }
    
    
    // MARK: - Private Methods
    
    private func viewConfig() {
        title = titleScreen
        view.backgroundColor = UIColor.defaultBackgroundColor
    }
}
