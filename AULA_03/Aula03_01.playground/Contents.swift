import UIKit

//Switch Case

let notaMedia = 6

switch notaMedia {
case 5:
    print("Você está abaixo da média")
case 6:
    print("Você está na média")
case 10:
    print("Parabéns, você atingiu a nota máxima")
default:
    print("Você não informou uma nota")
}

switch notaMedia {
case 0:
    print("Você precisa estudar")
case 1...3:
    print("Você está abaixo da media")
case 4:
    print("Você está abaixo da media -4")
default:
    print("Você não informou uma nota")
}

//enum

enum Aluno {
    case Joao
    case Pedro
    case Maria
}

let aluno = Aluno.Joao

print(aluno)

switch aluno {
case .Joao:
    print("Nota 6")
case .Pedro:
    print("Nota 8")
case .Maria:
    print("Nota 10")
}

//Exemplo: É necessário consultar uma API e retornar o estado em que o processo está

enum State {
    case Sucess
    case Error
    case Loading
}

let state = State.Loading

switch state {
case .Sucess:
    print("Sucesso")
case.Error:
    print("Erro")
case.Loading:
    print("Carregando")
}


//Utilizando o enum tipado

/*
enum State: String {
    case sucess = "Efetuado com sucesso"
    case failure = "Falha, tente novamente"
}

print(State.sucess.rawValue)
*/

//Utilização no dia a dia

enum Strings: String {
    case titleButton = "Nome do Botão"
    case titleLabel = "O texto referente"
}

let button = UIButton()
button.setTitle(Strings.titleButton.rawValue, for: .normal)

let label = UILabel()
label.text = Strings.titleLabel.rawValue

//enum de páginas

enum Page: Int {
    case one = 1, two, three, four

    //Atribuição implicita
    func getPage() -> Int {
        return self.rawValue
    }
}

var numberPage = Page.four

print(numberPage.getPage())


//enum com parâmetros

enum BankDeposit {
    case inValue(Int)
    case inCheck(Bool)
}

func makeDeposit(values: BankDeposit) {
    switch values {
    case .inValue(let value):
        print("O valor passado é: \(value)")
    case .inCheck(let isCheck):
        print("In Check: \(isCheck)")
    }
}

let deposit = BankDeposit.inValue(400)

makeDeposit(values: deposit)
