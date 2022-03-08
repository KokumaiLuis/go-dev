import UIKit

//Funcões

func myCar() {
    print("Meu carro")
}

//sobrescrita de função
func myCar(name: String) {
    print("Meu carro é: \(name)")
}

myCar(name: "Jettão")

//alias de parâmetro
func myName(name first: String) {
    print("Meu nome é: \(first)")
}

myName(name: "Luis")

//ocultar parâmetro
func myAge(_ age: Int) {
    print("Minha idadeé: \(age)")
}
//não há necessidade de escrever o nome do parâmetro
myAge(20)

/*
funcão com retorno
*/

//Se a função tiver apenas uma linha, não é necessário a palavra "return"
func getName(name: String) -> String {
    name
}


//typealias
typealias FullName = String

func getNameA(name: String) -> FullName {
    name
}

print(getNameA(name: "Luis"))


func getPerson(name: String, lastName: String, age: Int) -> (String, String, Int) {
    return(name, lastName, age)
}

let person = getPerson(name: "Luis", lastName: "Kokumai", age: 20)
print(person.2)

/*
Closure
*/

func makeBuy(values: Int, onCompletion: (Int) -> Void) {
    onCompletion(10)
}

makeBuy(values: 40) { res in
    print("res: \(res)")
}

//Utilizando typealias o código fica mais limpo e organizado

typealias onCompletion = (Int, String) -> Void

func makeBuyProduct(onCompletion: onCompletion) {
    onCompletion(20, "Luis")
}

makeBuyProduct { res, name in
    print(res)
    print(name)
}
