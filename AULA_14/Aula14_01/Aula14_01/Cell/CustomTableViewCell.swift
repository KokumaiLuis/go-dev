//
//  CustomTableViewCell.swift
//  Aula14_01
//
//  Created by SP11793 on 24/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "globe.americas")
        image.contentMode = .scaleAspectFit
        image.tintColor = .label
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.contentMode = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting."
        label.textColor = UIColor.label
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(iconImageView)
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


