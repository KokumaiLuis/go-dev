//
//  CustomTableViewCell.swift
//  DesafioAula15_01
//
//  Created by SP11793 on 25/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Public Variables
    
    static let identifier = "CustomTableViewCell"
    
    lazy var contactImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var organizationalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.contentMode = .top
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var contactNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.defaultTitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contactChatLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.defaultTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Private Variables
    
    //MARK: - Life Cycles

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        componentsConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods

    private func addSubViews(){
        addSubViews(contactImageView, organizationalStack)
        organizationalStack.addArrangedSubview(contactNameLabel)
        organizationalStack.addArrangedSubview(contactChatLabel)
    }
    
    private func componentsConfigure() {
        contactImageViewConfig()
        organizationalStackConfig()
        contactNameLabelConfig()
        contactChatLabelConfig()
    }
    
    private func contactImageViewConfig() {
        NSLayoutConstraint.activate([
            contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            contactImageView.heightAnchor.constraint(equalToConstant: 40),
            contactImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func organizationalStackConfig() {
        NSLayoutConstraint.activate([
            organizationalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            organizationalStack.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            organizationalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            organizationalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
    }
    
    private func contactNameLabelConfig() {
        NSLayoutConstraint.activate([
            contactNameLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    private func contactChatLabelConfig() {
        NSLayoutConstraint.activate([
            contactChatLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Private Methods
    
    public func setup(name: String, picture: String, lastChat: String) {
        contactImageView.loadImage(from: picture)
        contactNameLabel.text = name
        contactChatLabel.text = lastChat
    }
    
}
