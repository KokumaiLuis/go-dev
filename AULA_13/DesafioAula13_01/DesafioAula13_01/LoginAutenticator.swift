//
//  LoginAutenticator.swift
//  DesafioAula13_01
//
//  Created by SP11793 on 24/03/22.
//

import Foundation

class LoginAutenticator {
    
    public func autenticator(login: String, pwd: String) -> [String]{
        var title: String = ""
        var message: String = ""
        
        if !(String().isValidEmail(login)) {
            title = "Formato de E-mail Inválido!"
            message = "Verifique o formato do e-mail digitado e tente novamente."
            return [title, message]
        }
        
        if login == LoginData().masterLogin {
            
            if pwd == LoginData().masterPwd {
                title = "Login Efetuado!"
                message = "Olá \(login), seja bem-vindo. Continue em sua jornada de Swift!"
                return [title, message]
            } else {
                title = "Senha Incorreta!"
                message = "Verifique a senha e tente novamente."
                return [title, message]
            }
            
        } else {
            title = "E-mail Incorreto!"
            message = "Verifique o e-mail e tente novamente."
            return [title, message]
        }
    }
}
