//
//  ViewController.swift
//  Aula_05
//
//  Created by SP11793 on 11/03/22.
//

import UIKit

class HomeController: UIViewController {

    // UIFields connection
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var autenticationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Master credentials
    let masterLogin: String = "swift@learner.com"
    let masterPwd: String = "OneStepByDay"
    
    
    // Enter button action
    @IBAction func autenticar(_ sender: UIButton) {
        
        // Get fields text
        let email: String = emailTextField.text!
        let password: String = passwordTextField.text!
        
        // Receive the title of the UIAlert
        var title: String
        // Receive the message of the UIAlert
        var message: String

        
        // Verify the e-mail text format
        if !(String().isValidEmail(email)) {
            title = "Formato de E-mail Inválido!"
            message = "Verifique o formato do e-mail digitado e tente novamente."
            let invalidEmail = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            
            invalidEmail.addAction(UIAlertAction(title: "OK", style: .default, handler: { msg in
                print("O e-mail inserido: \(email) é inválido")
            }))
            
            // Shows the warning
            present(invalidEmail, animated: true, completion: nil)
        }
        
        
        // Validate the e-mail
        if email == masterLogin {
            
            // Validate the password
            if password == masterPwd {
                title = "Login Efetuado!"
                message = "Olá \(email), seja bem-vindo. Continue em sua jornada de Swift!"
                let welcomeMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                welcomeMessage.addAction(UIAlertAction(title: "Continuar Jornada!", style: .default, handler: { msg in
                    print("Usuário \(email) logado")
                }))
                
                // Shows the welcome message
                present(welcomeMessage, animated: true, completion: nil)
            }
            
            // Wrong password
            else {
                title = "Senha Incorreta!"
                message = "Verifique a senha e tente novamente."
                let wrongPasswordMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                wrongPasswordMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: { msg in
                    print("Senha incorreta")
                }))
                
                // Shows the error message
                present(wrongPasswordMessage, animated: true, completion: nil)
            }
        }
        
        // Wrong e-mail
        else {
            title = "E-mail Incorreto!"
            message = "Verifique o e-mail e tente novamente."
            let wrongEmailMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            wrongEmailMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: { msg in
                print("E-mail incorreto")
            }))
            
            // Shows the error message
            present(wrongEmailMessage, animated: true, completion: nil)
        }
        
    }
    

}

// Extends the String built-in class
extension String {
    
    // Create a function that validates the e-mail format
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
}
