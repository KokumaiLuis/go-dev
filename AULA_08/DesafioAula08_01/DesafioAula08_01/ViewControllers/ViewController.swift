//
//  ViewController.swift
//  DesafioAula08_01
//
//  Created by SP11793 on 16/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var musics: [Musics] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCell()
        initMusics()
        initTitle()
        
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func initMusics() {
        musics.append(Musics(image: "system_album", title: "Toxicity", singer: "System of a Down"))
        
        musics.append(Musics(image: "foofighters_album", title: "Best of You", singer: "Foo Fighters"))
        
        musics.append(Musics(image: "metallica_album", title: "Nothing Else Matters", singer: "Metallica"))
        
        musics.append(Musics(image: "avenged_album", title: "Nightmare", singer: "Avenged Sevenfold"))
        
        musics.append(Musics(image: "guns_album", title: "Patience", singer: "Guns and Roses"))
        
        musics.append(Musics(image: "acdc_album", title: "Highway to Hell", singer: "AC/DC"))
        
        musics.append(Musics(image: "redhot_album", title: "Californication", singer: "Red Hot Chili Peppers"))
        
        musics.append(Musics(image: "white_stripes_album", title: "Seven Nation Army", singer: "The White Stripes"))
        
        musics.append(Musics(image: "cramberries_album", title: "Zombie", singer: "The Cramberries"))
        
        musics.append(Musics(image: "pearl_album", title: "Black", singer: "Pearl Jam"))
         
    }
    
    private func initTitle() {
        labelTitle.text = "Suas Músicas"
    }


}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let music = musics[indexPath.row]
        cell.setupTableView(image: music.image, title: music.title, singer: music.singer)
        
        return cell
    }
}

