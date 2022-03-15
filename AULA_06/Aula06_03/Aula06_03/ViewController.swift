//
//  ViewController.swift
//  Aula06_03
//
//  Created by SP11793 on 14/03/22.
//

import UIKit

struct Logos {
    var image: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var logos: [Logos] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        initLogos()
        registerCell()
        collectionLayout()
        
        collection.showsHorizontalScrollIndicator = false
    }
    
    private func delegates() {
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func initLogos() {
        logos = [Logos(image: "heartbeat-1024"), Logos(image: "swift.png")]
    }
    
    private func registerCell() {
        let nib = UINib(nibName: ItemCollectionViewCell.identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: view.frame.size.width, height: 150)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        collection.collectionViewLayout = layout
    }


}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return ItemCollectionViewCell()}
        
        let logo = logos[indexPath.row]
        
        cell.setup(image: logo.image)
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}

