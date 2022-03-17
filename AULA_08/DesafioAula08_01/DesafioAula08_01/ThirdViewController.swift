//
//  ThirdViewController.swift
//  DesafioAula08_01
//
//  Created by SP11793 on 16/03/22.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var labelVersion: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    
    override func viewDidLoad() {
        version()
        initTitle()
        textView()
        
    }
    
    private func version() {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        
        labelVersion.text = "Version: \(appVersion)"
    }
    
    private func textView() {
        textViewDescription.text = "Aplicativo projetado pelo Grupo 6 do programa go!dev de acordo com o desafio do professor Doug:\n" +
                                   "Criar um app com navegação em 3 abas.\n" +
                                   "1 - Home -> Com uma TableView\n" +
                                   "2 - Categoria -> Com uma CollectionView -> 2 Colunas \n" +
                                   "3 - Sobre -> Com uma explicação sobre o App\n\n" +
                                   "Nosso App foi inspirado em um aplicativos de música e possui a seguinte estrutura:\n" +
                                   "1 - Home -> TableView com as músicas adicionadas pelo usuário\n" +
                                   "2 - Categoria -> CollectionView com as categorias das músicas\n" +
                                   "3 - Sobre -> A página atual, explicando sobre o app\n\n" +
                                   "Integrantes do Grupo:\n" +
                                   "- Carlos Henrique Pires\n" +
                                   "- Izabela Mateus\n" +
                                   "- João Victor Pizetta\n" +
                                   "- Jony Samarelli\n" +
                                   "- Luis Gustavo de Andrade Kokumai\n" 
    }
    
    private func initTitle() {
        labelTitle.text = "Sobre o App"
    }
    
}
