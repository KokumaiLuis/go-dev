//
//  CustomTableViewCell.swift
//  DesafioAula08_01
//
//  Created by SP11793 on 16/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageAlbum: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSinger: UILabel!
    
    static let identifier = "CustomTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupTableView(image: String, title: String, singer: String) {
        imageAlbum.image = UIImage(named: image)
        labelTitle.text = title
        labelSinger.text = singer
    }
    
}
