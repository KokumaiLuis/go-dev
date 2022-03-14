//
//  CustomTableViewCell.swift
//  Aula06_02
//
//  Created by SP11793 on 14/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(logo: String, name: String, description: String) {
        
        logoImageView.image = UIImage(named: logo)
        nameLabel.text = name
        descriptionLabel.text = description
    }

    
}
