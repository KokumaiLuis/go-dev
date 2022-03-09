//Desafio: Desenvolver o conceito de pilha em swift

import UIKit

//Variavel tipo vetor
var pilha: [Int] = [1, 2, 3]

//Funcao para empilhar um número
func push(num: Int){
    pilha.append(num)
    print("Número \(num) adicionado a pilha.")
    print("Veja o novo array formado: \(pilha)")
    print("--------------------------------------------------")
}

//Funcao para desempilhar um número
func pop() {
    pilha.removeLast()
    print("Número \(pilha[pilha.count - 1]) retirado da pilha.")
    print("Veja o novo array formado: \(pilha)")
    print("--------------------------------------------------")
}

//Empilha um número
push(num: 40)

//Empilha um número
push(num: 50)

//Empilha um número
push(num: 60)

//Desempilha um número
pop()

//Desempilha um número
pop()




