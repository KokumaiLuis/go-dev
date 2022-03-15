//
//  CustomTableViewCell.swift
//  DesafioAula06_01
//
//  Created by SP11793 on 15/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var imagePerson: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(image: String, name: String, description: String) {
        
        imagePerson.image = UIImage(named: image)
        labelName.text = name
        labelDescription.text = description
    }


}
