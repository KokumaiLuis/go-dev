//
//  ViewController.swift
//  Aula12_02
//
//  Created by SP11793 on 22/03/22.
//

import UIKit

class ViewController: UIViewController {
    
//    var button: UIButton = UIButton()
    var safeArea: UILayoutGuide!
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "gamecontroller")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        
//        button.setTitle("Button view", for: .normal)
//        button.frame = CGRect(x: 16, y: 100, width: 130, height: 45)
//        button.backgroundColor = .darkGray
//
//        view.addSubview(button)
        
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 70),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        
        title = "Using View Code"
        view.backgroundColor = .lightGray
    }


}

