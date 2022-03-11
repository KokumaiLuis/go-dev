import UIKit

//Extensions

class Aluno {
    var name: String?

    func getName() -> String {
        guard let name = name else { return ""}
        return name
    }
}

//Estende a classe Aluno
extension Aluno {
    func setAluno(name: String) {
        self.name = name
    }
}

let fullName = "luis gustavo de andrade kokumai"

//print(fullName.capitalized)


//Exemplo de extension para criar funções específicas
//Nova função String para tornar primeira letra da frase em maiúscula

let str = "treinamento de iOS"

extension String {
    func capitalizingFirst() -> String {
        return String(prefix(1).capitalized + dropFirst())
    }
}

print(str.capitalizingFirst())


//Exemplo de extension para criar cores específicas
extension UIColor {
    static let surfaceGray = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)

    static let lightBlue = UIColor(red: 0.32, green: 0.66, blue: 1.00, alpha: 1.0)
}

let color1: UIColor = .surfaceGray
let color2: UIColor = .lightBlue

//É possível realizar extension de imagens

extension UIImage {
    static let iconApple = UIImage(named: "application")
}

func icon() -> UIImage {
    guard let image: UIImage = .iconApple else { return UIImage(systemName: "airplane")! }
    return image
}

let image = icon()
