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
    
    lazy var organizationalVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.contentMode = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var organizationalHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var broadcastsListButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle( "Broadcasts Lists", for: .normal)
        button.backgroundColor = UIColor.defaultBackgroundColor
        button.setTitleColor(UIColor.defatultSecondaryColor, for: .normal)
        button.contentHorizontalAlignment = .left
        //button.addTarget(self, action: #selector(goToBroadcasts), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var newGroupButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle( "New Group", for: .normal)
        button.backgroundColor = UIColor.defaultBackgroundColor
        button.setTitleColor(UIColor.defatultSecondaryColor, for: .normal)
        button.contentHorizontalAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        view.addSubViews(organizationalVerticalStack)
//        organizationalVerticalStack.addArrangedSubview(organizationalHorizontalStack)
        organizationalVerticalStack.addArrangedSubview(chatsTableView)
//        organizationalHorizontalStack.addArrangedSubview(broadcastsListButton)
//        organizationalHorizontalStack.addArrangedSubview(newGroupButton)
    }
    
    private func componentsConfigure() {
        organizationalVerticalStackConfig()
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
    
    private func organizationalVerticalStackConfig() {
        NSLayoutConstraint.activate([
            organizationalVerticalStack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            organizationalVerticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            organizationalVerticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            organizationalVerticalStack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 10)
        ])
    }
    
    private func delegates() {
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
    }
    
    private func registerCell() {
        chatsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
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

