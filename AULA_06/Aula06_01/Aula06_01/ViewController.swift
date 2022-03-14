//
//  ViewController.swift
//  Aula06_01
//
//  Created by SP11793 on 14/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        
    }
    
    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }


}
        
extension ViewController: UITableViewDelegate {
            
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "Titulo da Célula"
        cell.detailTextLabel?.text = "Lorem Ipsum is simply dummy text of printing"
        
        return cell
    }
    
}

