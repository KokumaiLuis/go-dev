//
//  ViewController.swift
//  Aula14_01
//
//  Created by SP11793 on 24/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var safeArea: UILayoutGuide!
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = .label
        appearance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBackground]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let addButton = UIBarButtonItem(image: UIImage.init(systemName: "play.circle"), style: .plain, target: self, action: #selector(callSecondView))
        
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    @objc func callSecondView() {
        let secondViewController = SecondViewController()
        
        secondViewController.idProduct = "12345"
        
        navigationController?.present(secondViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        
        title = "Home"
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
        ])
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }


}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let thirdViewController = ThirdViewController()
        
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }

        
        return cell
    }
    
    
    
}
