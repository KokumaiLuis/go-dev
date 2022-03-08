import UIKit

//Utilizacao do guard let

/*
if let é utilizado caso a variável em questão não seja obrigatória para a conclusão do método ou função
guard let é utilizado caso a variável em questão seja obrigatória para a conclusão do método ou função


func icon() -> UIImage {
    guard let image = UIImage(named: "Photo") else {
       return UIImage(named: "Default")!
    }

    return image
}
*/

func someFunc(parameter: String?) {
    guard let parameter = parameter else { return }
    print(parameter)
}

//someFunc(parameter: nil)
someFunc(parameter: "Luis")
