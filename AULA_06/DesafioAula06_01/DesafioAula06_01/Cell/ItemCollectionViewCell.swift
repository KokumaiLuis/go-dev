//
//  ItemCollectionViewCell.swift
//  DesafioAula06_01
//
//  Created by SP11793 on 15/03/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageHouse: UIImageView!
    @IBOutlet weak var labelHouse: UILabel!
    
    static let identifier: String = "ItemCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(houseImage: String, houseName: String) {

        imageHouse.image = UIImage(named: houseImage)
        labelHouse.text = houseName
        
    }

}
