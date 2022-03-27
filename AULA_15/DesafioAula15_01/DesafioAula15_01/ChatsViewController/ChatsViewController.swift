//
//  ViewController.swift
//  DesafioAula15_01
//
//  Created by SP11793 on 25/03/22.
//

import UIKit

class ChatsViewController: UIViewController {
    
    lazy var contactList = [Contacts]() {
        didSet {
            DispatchQueue.main.async {
                self.chatsTableView.reloadData()
            }
        }
    }
    
    // MARK: - Public Variables
    
    var safeArea: UILayoutGuide!
    
    lazy var chatsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Private Variables
    
    private let titleScreen = "Chats"
    
    
    //MARK: - Life Cycles
    
    override func viewWillAppear(_ animated: Bool) {
        navigationControllerConfig()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        viewConfig()
        addSubViews()
        componentsConfigure()
        delegates()
        registerCell()
        registerHeader()
        getContacts()
    }
    
    
    // MARK: - Private Methods
    
    private func viewConfig() {
        title = titleScreen
        view.backgroundColor = UIColor.defaultBackgroundColor
    }
    
    private func navigationControllerConfig() {
        navigationControllerAppearance()
    }
    
    private func addSubViews() {
        view.addSubViews(chatsTableView)
    }
    
    private func componentsConfigure() {
        chatsTableViewConfig()
    }
    
    private func navigationControllerAppearance() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.defaultBackgroundColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.defaultTitleColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.defaultTitleColor]
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = UIColor.defatultSecondaryColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let newChatButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(callSecondView))
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItem = newChatButton
        navigationItem.leftBarButtonItem = editButton

    }
    
    @objc func callSecondView() {
        let secondViewController = SecondViewController()
        navigationController?.present(secondViewController, animated: true)
    }
    
    private func chatsTableViewConfig() {
        NSLayoutConstraint.activate([
            chatsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            chatsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            chatsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            chatsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 10)
        ])
    }
    
    private func delegates() {
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
    }
    
    private func registerCell() {
        chatsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    private func registerHeader() {
        chatsTableView.register(CustomTableViewHeader.self, forHeaderFooterViewReuseIdentifier: CustomTableViewHeader.identifier)
    }
    
    private func getContacts() {
        ApiService.shared.getContacts() { result in
            
            switch result {
            case .success(let res):
                self.contactList = res
            case .failure(let error):
                print(error)

            }
        }
    }


}

extension ChatsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomTableViewHeader.identifier) as? CustomTableViewHeader else { return UIView()}
        
        return header
    }
    
}

extension ChatsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let contact = contactList[indexPath.row]
        
        cell.setup(name: contact.name, picture: contact.picture, lastChat: contact.lastChat)
        
        return cell
    }
    
    
}

