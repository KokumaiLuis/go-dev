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
    
    var albuns: [Albuns] = []
    
    override func viewDidLoad() {
        delegates()
        initTitle()
        registerCell()
        initAlbuns()
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
    
    private func initAlbuns(){
        albuns.append(Albuns(image: "system_album", title: "Toxicity"))
        
        albuns.append(Albuns(image: "acdc_album", title: "Highway to Hell"))
        
        albuns.append(Albuns(image: "avenged_album", title: "Nightmare"))
        
        albuns.append(Albuns(image: "redhot_album", title: "Californication"))
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width / 2.2, height: 200)
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
    }
    
    private func initTitle() {
        title = "Categorias"
    }
    
    
    
}

extension SecondViewController: UICollectionViewDelegate {
    
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albuns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell()}
        
        let album = albuns[indexPath.row]
        
        cell.setupCollectionView(image: album.image, title: album.title)
        
        return cell
    }
}


