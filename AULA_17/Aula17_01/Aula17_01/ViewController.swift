//
//  ViewController.swift
//  Aula17_01
//
//  Created by SP11793 on 28/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfiguration)
        web.navigationDelegate = self
        web.translatesAutoresizingMaskIntoConstraints = false
        return web
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Navigation"
        
        view.backgroundColor = .systemBlue
        configureUI()
        setupWebView()
        
    }
    
    private func setupWebView() {
        let url = URL(string: "https://www.apple.com")
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
    }
    
    private func configureUI() {
        
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = UIColor.systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let forwardBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.right"), style: .plain, target: self, action: #selector(forwardAction))
        
        let backBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backwardAction))
        
        let reloadBarItem = UIBarButtonItem(image: UIImage.init(systemName: "arrow.counterclockwise"), style: .plain, target: self, action: #selector(reloadAction))
        
        navigationItem.leftBarButtonItem = reloadBarItem
        navigationItem.rightBarButtonItems = [forwardBarItem, backBarItem]
    }

}

extension ViewController {
    @objc private func forwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc private func backwardAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc private func reloadAction() {
        webView.reload()
    }
}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Iniciando...")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Terminou!!!")
    }
}
