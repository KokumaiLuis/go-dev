//
//  ViewController.swift
//  DesafioAula06_01
//
//  Created by SP11793 on 15/03/22.
//

import UIKit

struct Houses {
    var image: String
    var name: String
}

struct Witchers {
    var image: String
    var name: String
    var description: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var houseCollection: UICollectionView!
    @IBOutlet weak var labelProperties: UILabel!
    @IBOutlet weak var imagePropertie1: UIImageView!
    @IBOutlet weak var imagePropertie2: UIImageView!
    @IBOutlet weak var labelPropertie1: UILabel!
    @IBOutlet weak var labelPropertie2: UILabel!
    @IBOutlet weak var stackProperties: UIStackView!
    @IBOutlet weak var labelBruxos: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    
    var houses: [Houses] = []
    var witchers: [Witchers] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        initHouses()
        registerCell()
        collectionLayout()
        
    }
    
    private func initHouses() {
        houses = [Houses(image: "gryffindor_house", name: "Grifinória"),
                  Houses(image: "slytherin_house", name: "Sonserina"),
                  Houses(image: "hufflepuff_house", name: "Lufa-Lufa"),
                  Houses(image: "ravenclaw_house", name: "Ravenclaw")]
    }
    
    private func delegates() {
        houseCollection.delegate = self
        houseCollection.dataSource = self
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: ItemCollectionViewCell.identifier, bundle: nil)
        houseCollection.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width / 2, height: 170)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        houseCollection.collectionViewLayout = layout
        houseCollection.showsHorizontalScrollIndicator = false
    }
    
    private func initProperties(houseName: String, imageName1: String, labelText1: String, imageName2: String, labelText2: String) {
        
        labelProperties.text = "Características da casa \(houseName)"
        labelBruxos.text = "Bruxos da casa \(houseName)"
        imagePropertie1.image = UIImage(named: imageName1)
        labelPropertie1.text = labelText1
        imagePropertie2.image = UIImage(named: imageName2)
        labelPropertie2.text = labelText2
        
    }
    


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch houses[indexPath.row].name {
        case "Grifinória":
            initProperties(houseName: houses[indexPath.row].name, imageName1: "coragem", labelText1: "Coragem", imageName2: "lealdade", labelText2: "Lealdade")
            stackProperties.isHidden = false
            
            witchers = [Witchers(image: "harry_potter", name: "Harry Potter", description: "Nascido em 31 de julho de 1980, Harry é um bruxo, filho único de James Potter e Lílian Evans Potter, considerado um dos mais famosos feiticeiros dos tempos modernos."),
                        Witchers(image: "hermione_granger", name: "Hermione Granger", description: "Hermione Jean Granger nascida em 19 de setembro de 1979, foi uma bruxa nascida-trouxa é a filha única dos trouxas Sr. e Sra. Granger, ambos dentistas em Londres, descritos calmos, inteligentes e pacíficos.")]
            
            tableview.reloadData()
        
            
        case "Sonserina":
            initProperties(houseName: houses[indexPath.row].name, imageName1: "ambicao", labelText1: "Ambição", imageName2: "egoismo", labelText2: "Egoísmo")
            stackProperties.isHidden = false
            
            witchers = [Witchers(image: "draco_malfoy", name: "Draco Malfoy", description: "Draco Lúcio Malfoy é um bruxo sangue puro[1] britânico nascido em 5 de junho de 1980[1] e o único filho de Lúcio e Narcisa Malfoy."),
                        Witchers(image: "severo_snape", name: "Severo Snape", description: "O Professor Severo Snape (9 de janeiro de 1960 – 2 de maio de 1998) foi um bruxo mestiço, filho da bruxa Eileen Snape (nascida Prince) e o trouxa Tobias Snape.")]
            
            tableview.reloadData()
            
        default:
            print("b")
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return houses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let houseCell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        
        let house = houses[indexPath.row]
        
        houseCell.setup(houseImage: house.image, houseName: house.name)
        
        return houseCell
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return witchers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellWitchers = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let witchers = witchers[indexPath.row]
        
        cellWitchers.setup(image: witchers.image, name: witchers.name, description: witchers.description)
        
        return cellWitchers
    }
    
}

