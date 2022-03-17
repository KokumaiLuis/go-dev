//
//  SecondViewController.swift
//  DesafioAula08_01
//
//  Created by SP11793 on 16/03/22.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var categories: [Categories] = []
    
    override func viewDidLoad() {
        delegates()
        initTitle()
        registerCell()
        initCategories()
        collectionLayout()
    }
    
    private func delegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
    
    private func initCategories(){
        categories.append(Categories(image: "rock_image", title: "Rock"))
        
        categories.append(Categories(image: "pop_image", title: "Pop"))
        
        categories.append(Categories(image: "jazz_image", title: "Jazz"))
        
        categories.append(Categories(image: "gospel_image", title: "Gospel"))
        
        categories.append(Categories(image: "eletronic_image", title: "Eletrônica"))
        
        categories.append(Categories(image: "mpb_image", title: "MPB"))
        
        categories.append(Categories(image: "sertanejo_image", title: "Sertanejo"))
        
        categories.append(Categories(image: "pagode_image", title: "Pagode"))
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width / 2.2, height: 160)
        layout.minimumLineSpacing = 15
        collectionView.collectionViewLayout = layout
    }
    
    private func initTitle() {
        labelTitle.text = "Categorias"
    }
    
    
    
}

extension SecondViewController: UICollectionViewDelegate {
    
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell()}
        
        let category = categories[indexPath.row]
        
        cell.setupCollectionView(image: category.image, title: category.title)
        
        return cell
    }
}


