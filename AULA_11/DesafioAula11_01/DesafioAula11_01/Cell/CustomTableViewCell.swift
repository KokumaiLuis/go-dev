//
//  CustomTableViewCell.swift
//  DesafioAula11_01
//
//  Created by SP11793 on 21/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCompany: UILabel!
    
    static let identifier = "CustomTableViewCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setup(name: String, company: String, photo: String) {
        labelName.text = name
        labelCompany.text = company
        imagePerson.loadImage(from: photo)
    }
    
}
