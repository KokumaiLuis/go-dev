//Desafio: Desenvolver o conceito de pilha em swift (Nesta logica foi utilizada orientacao a objeto)

import UIKit

//Classe pilha
class pilha {
    
    //Atributos da classe
    var array: [Int] = []
    
    //Funcao construtora
    init(vetor: [Int]){
        array = vetor
    }
    
    //Funcao para empilhar um número
    func push(num: Int){
        self.array.append(num)
        print("Número \(num) adicionado a pilha.")
        print("Veja o novo array formado: \(self.array)")
        print("--------------------------------------------------")
    }
    
    //Funcao para desempilhar um número
    func pop() {
        self.array.removeLast()
        print("Número \(self.array[self.array.count - 1]) retirado da pilha.")
        print("Veja o novo array formado: \(self.array)")
        print("--------------------------------------------------")
        
    }
}

//Variavel do tipo vetor
var v: [Int] = [1, 2, 3]

//Criacao do objeto
var pilha1 = pilha(vetor: v)

//Empilha um número
pilha1.push(num: 40)

//Empilha um número
pilha1.push(num: 50)

//Empilha um número
pilha1.push(num: 60)

//Desempilha um número
pilha1.pop()

//Desempilha um número
pilha1.pop()
