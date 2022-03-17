//
//  ViewController.swift
//  DesafioAula08_01
//
//  Created by SP11793 on 16/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var musics: [DataSource] = []

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
        musics.append(DataSource(image: "system_album", title: "Toxicity", singer: "System of a Down"))
        
        musics.append(DataSource(image: "avenged_album", title: "Nightmare", singer: "Avenged Sevenfold"))
        
        
        musics.append(DataSource(image: "system_album", title: "Prison Song", singer: "System of a Down"))
        
        musics.append(DataSource(image: "acdc_album", title: "Highway to Hell", singer: "AC/DC"))
        
        musics.append(DataSource(image: "system_album", title: "Chop Suey!", singer: "System of a Down"))
        
        musics.append(DataSource(image: "acdc_album", title: "Walk All Over You", singer: "AC/DC"))
        
        musics.append(DataSource(image: "acdc_album", title: "Get It Hot", singer: "AC/DC"))
        
        musics.append(DataSource(image: "avenged_album", title: "Danger Line", singer: "Avenged Sevenfold"))
        
        musics.append(DataSource(image: "avenged_album", title: "So Far Away", singer: "Avenged Sevenfold"))
    }
    
    private func initTitle() {
        title = "Home"
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

