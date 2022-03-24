//
//  ViewController.swift
//  Aula12_02
//
//  Created by SP11793 on 22/03/22.
//

import UIKit

class ViewController: UIViewController {
    

    private enum Defaults {
        
        static let textInfo = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        static let textButton = "Call View"
        static let textLabel = "Label centralizada"
    } 
    
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
        label.text = Defaults.textInfo
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Defaults.textButton, for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(getView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var content: UIView = {
       let view = UIView()
        view.backgroundColor = .systemIndigo
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.text = Defaults.textLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    @objc func getView() {
        print("Botão clicado")
    }
    
    // MARK: - Private Methods
    
    private func addSubViews() {
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        view.addSubview(callButton)
        view.addSubview(content)
        content.addSubview(descriptionLabel)
    }
    
    private func configureIconImageView() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 70),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureTitleLabel() {
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: Metrics.Margin.default).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default).isActive = true
    }
    
    private func configureCallButton() {
        NSLayoutConstraint.activate([
            callButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.Margin.default),
            callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default),
            callButton.heightAnchor.constraint(equalToConstant: Metrics.Margin.input),
            callButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default)
        ])
    }
    
    private func configureContentView() {
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: Metrics.Margin.default),
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.Margin.default),
            content.heightAnchor.constraint(equalToConstant: 200),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.Margin.default)
        ])
    }
    
    private func configureDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: content.centerYAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        
//        button.setTitle("Button view", for: .normal)
//        button.frame = CGRect(x: 16, y: 100, width: 130, height: 45)
//        button.backgroundColor = .darkGray
//
//        view.addSubview(button)
        
        addSubViews()
        configureIconImageView()
        configureTitleLabel()
        configureCallButton()
        configureContentView()
        configureDescriptionLabel()
        
        
        title = "Using View Code"
        view.backgroundColor = .white
    }


}

