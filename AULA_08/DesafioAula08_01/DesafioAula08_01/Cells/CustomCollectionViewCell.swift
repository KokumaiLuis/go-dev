//
//  CustomCollectionViewCell.swift
//  DesafioAula08_01
//
//  Created by SP11793 on 16/03/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageAlbum: UIImageView!
    @IBOutlet weak var labelAlbumName: UILabel!
    
    static let identifier = "CustomCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCollectionView(image: String, title: String) {
        imageAlbum.image = UIImage(named: image)
        labelAlbumName.text = title
    }

}
