//
//  ViewController.swift
//  Aula06_02
//
//  Created by SP11793 on 14/03/22.
//

import UIKit

struct Logos {
    var image: String
    var title: String
    var description: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var logos: [Logos] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTitle()
        delegates()
        initLogos()
        
        
    }
    
    private func initTitle() {
        title = "Logos"
    }
    
    private func initLogos() {
        logos = [Logos(image: "heartbeat-1024", title: "Coracao", description: "Descricao 1"), Logos(image: "swift.png", title: "Swift", description: "Descricao 2")]
    }
    
    
    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }


}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Eu cliquei no logo: \(logos[indexPath.row].image)")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let logo = logos[indexPath.row]
        
        cell.setup(logo: logo.image, name: logo.title, description: logo.description)
        
        return cell
    }
    
}

