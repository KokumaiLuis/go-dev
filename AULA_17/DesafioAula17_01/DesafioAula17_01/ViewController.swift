//
//  ViewController.swift
//  DesafioAula17_01
//
//  Created by SP11793 on 28/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webview = WKWebView(frame: .zero, configuration: webConfiguration)
        webview.navigationDelegate = self
        webview.translatesAutoresizingMaskIntoConstraints = false
        return webview
    }()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var searchText: String = "https://www.apple.com" {
        didSet {
            setupWebView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavBar()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureUI()
        setupWebView()
        navigationControllerSetup()
        title = "🍊BusCaqui🍊"
    }
    
    private func searchBarControllerSetup() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.loadViewIfNeeded()
        searchController.searchBar.text = searchText
        searchController.searchBar.searchTextField.tintColor = .orange
        searchController.searchBar.autocapitalizationType = .none
        
        searchController.searchBar.delegate = self
        
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        
    }
    
    private func navigationControllerSetup() {
        navigationItem.searchController = searchController
        self.definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        self.searchBarControllerSetup()
    }
    
    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = UIColor.orange
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let forwardBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.right"), style: .plain, target: self, action: #selector(forwardAction))
        
        let backBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backwardAction))
        
        let reloadBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.counterclockwise"), style: .plain, target: self, action: #selector(reloadAction))
        
        navigationItem.leftBarButtonItem = reloadBarItem
        navigationItem.rightBarButtonItems = [forwardBarItem, backBarItem]
    }
    
    private func setupWebView() {
        var newSearchText = searchText
        if !searchText.starts(with: "https://") && !searchText.starts(with: "http://"){
            newSearchText = "https://\(searchText)"
        }
        
        guard let url = URL(string: newSearchText) else { return }
        print(newSearchText)
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    private func configureUI() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}

extension ViewController {
    @objc func forwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func backwardAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func reloadAction() {
        webView.reload()
    }
    
}

extension ViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let newSearch = searchBar.text {
            searchText = newSearch
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchText = "https://www.apple.com"
    }
    
}

extension ViewController: WKNavigationDelegate {
    
}

