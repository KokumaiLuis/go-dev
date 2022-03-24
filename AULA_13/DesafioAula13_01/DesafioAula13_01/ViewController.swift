//
//  ViewController.swift
//  DesafioAula13_01
//
//  Created by SP11793 on 23/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private Variables
    
    private var safeArea: UILayoutGuide!
    
    // MARK: - Public Properties
    
    lazy var swiftImage: UIImageView = {
        let swiftImage = UIImageView()
        swiftImage.image = UIImage(named: "swift")
        swiftImage.translatesAutoresizingMaskIntoConstraints = false
        return swiftImage
    }()
    
    lazy var loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Digite seu E-mail"
        loginLabel.textColor = UIColor.defaultTextColor
        loginLabel.font = .systemFont(ofSize: 17)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        return loginLabel
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "user@icloud.com"
        emailTextField.textColor = UIColor.defaultTextColor
        emailTextField.font = .systemFont(ofSize: 14)
        emailTextField.borderStyle = .roundedRect
        emailTextField.textContentType = .emailAddress
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    lazy var pwdLabel: UILabel = {
        let pwdLabel = UILabel()
        pwdLabel.text = "Digite sua senha"
        pwdLabel.textColor = UIColor.defaultTextColor
        pwdLabel.font = .systemFont(ofSize: 17)
        pwdLabel.translatesAutoresizingMaskIntoConstraints = false
        return pwdLabel
    }()
    
    lazy var pwdTextField: UITextField = {
        let pwdTextField = UITextField()
        pwdTextField.textColor = UIColor.defaultTextColor
        pwdTextField.font = .systemFont(ofSize: 14)
        pwdTextField.borderStyle = .roundedRect
        pwdTextField.textContentType = .password
        pwdTextField.isSecureTextEntry = true
        pwdTextField.translatesAutoresizingMaskIntoConstraints = false
        return pwdTextField
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.backgroundColor = UIColor.deafultButtonBackgroundColor
        loginButton.setTitleColor(UIColor.deafultButtonTextColor, for: .normal)
        loginButton.addTarget(self, action: #selector(autenticator), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    @objc func autenticator() {
        let message = LoginAutenticator().autenticator(login: emailTextField.text!, pwd: pwdTextField.text!)
        let alert = UIAlertController(title: message[0], message: message[1], preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Atenção", style: .default, handler: { msg in
        }))
        present(alert, animated: true, completion: nil)
    }

     
    // MARK: - Life Cicles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        
        addSubViews()
        configureView()
        configureSwiftImage()
        configureLoginLabel()
        configureEmailTextField()
        configurePwdLabel()
        configurePwdTextField()
        configureLoginButton()
    }
    
    
    // MARK: - Private Methods
    
    private func configureView() {
        title = "Login"
        view.backgroundColor = UIColor.defaultBackgroundColor
    }
    
    private func addSubViews() {
        view.addSubview(swiftImage)
        view.addSubview(loginLabel)
        view.addSubview(emailTextField)
        view.addSubview(pwdLabel)
        view.addSubview(pwdTextField)
        view.addSubview(loginButton)
    }
    
    private func configureSwiftImage() {
        NSLayoutConstraint.activate([
            swiftImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 72),
            swiftImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftImage.heightAnchor.constraint(equalToConstant: 120),
            swiftImage.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configureLoginLabel() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: swiftImage.bottomAnchor, constant: 86),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureEmailTextField() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10 ),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configurePwdLabel() {
        NSLayoutConstraint.activate([
            pwdLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 36),
            pwdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configurePwdTextField() {
        NSLayoutConstraint.activate([
            pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor, constant: 10 ),
            pwdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pwdTextField.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureLoginButton() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 55),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 31),
            loginButton.widthAnchor.constraint(equalToConstant: 127)
        ])
    }


}

extension String {
    
    // Create a function that validates the e-mail format
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
}

