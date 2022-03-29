//
//  ViewController.swift
//  Aula17_02
//
//  Created by SP11793 on 28/03/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Call Safari", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(callSafari), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        buttonConfigure()
    }
    
    private func buttonConfigure() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
        
    }
    
    @objc func callSafari() {
        if let url = URL(string: "https://www.apple.com") {
            
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let viewController = SFSafariViewController(url: url, configuration: config)
            viewController.delegate = self
            viewController.preferredControlTintColor = .systemIndigo
            viewController.dismissButtonStyle = .close
            present(viewController, animated: true)
        }
    }


}

extension ViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true) {
            print("Fazer alguma coisa")
        }
    }
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("didLoadSuccessfully \(didLoadSuccessfully)")
    }
}

