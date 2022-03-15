//
//  ItemCollectionViewCell.swift
//  Aula06_03
//
//  Created by SP11793 on 14/03/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    static let identifier = "ItemCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(image: String) {
        if let image = UIImage(named: image) {
            imageLogo.image = image
        }
    }

}
