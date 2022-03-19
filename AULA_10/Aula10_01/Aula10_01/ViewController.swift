//
//  ViewController.swift
//  Aula10_01
//
//  Created by SP11793 on 18/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    lazy var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        getUsers()
        showLoading()
    }
    
    private func delegates(){
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    
    private func getUsers() {
        Service.shared.getUsers { result in
            
            switch result {
            case .success(let res):
                self.users = res
            case .failure(let error):
                print(error)

            }
            
            self.hideLoading()
        }
    }
    
    private func showLoading() {
        loading.startAnimating()
        loading.isHidden = false
    }
    
    private func hideLoading() {
        DispatchQueue.main.async {
            self.loading.stopAnimating()
            self.loading.isHidden = true
        }
    }


}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.username
        
        return cell
    }
    
}

