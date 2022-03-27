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
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var organizationalStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.alignment = .fill
        stack.contentMode = .top
        stack.spacing = 8
        stack.axis = .vertical
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
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.defaultTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - Life Cycles

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        
        addSubViews()
        componentsConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods

    private func addSubViews(){
        addSubview(contactImageView)
        organizationalStack.addArrangedSubview(contactNameLabel)
        organizationalStack.addArrangedSubview(contactChatLabel)
        addSubview(organizationalStack)
    }
    
    private func componentsConfigure() {
        contactImageViewConfig()
        organizationalStackConfig()
    }
    
    private func contactImageViewConfig() {
        contactImageView.layer.cornerRadius = contactImageView.layer.frame.width / 2
        
        NSLayoutConstraint.activate([
            contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contactImageView.heightAnchor.constraint(equalToConstant: 45),
            contactImageView.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func organizationalStackConfig() {
        NSLayoutConstraint.activate([
            organizationalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            organizationalStack.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            organizationalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            organizationalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
    }
    
    
    // MARK: - Private Methods
    
    public func setup(name: String, picture: String, lastChat: String) {
        contactImageView.loadImage(from: picture)
        contactNameLabel.text = name
        contactChatLabel.text = lastChat
    }
    
}
