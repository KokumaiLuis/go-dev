import UIKit

// Programação Funcional

var estudantes = ["Samuel", "Matheus", "Ana", "Bernardo", "João"]

//print(estudantes.sorted())

/*
lhs = left hand side = lado esquerdo
rhs = right hand side = lado direito
*/


//estudantes.sort {(lhs: String, rhs: String) -> Bool in
//    lhs > rhs
//}

//print(estudantes)

//let descending = estudantes.sorted(by: >)
//let ascending = estudantes.sorted(by: <)

//print(descending)
//print(ascending)

//Merge de arrays

//let array1 = [1, 2, 5, 6, 9]
//let array2 = [10, 23, 45, 56, 91]

//let flattenArray = array1 + array2

//print(flattenArray)

//Map

//Exemplo sem Map
var alunosNotas = [4, 5, 7, 9, 3]

//var novasNotas = [Int] = []

//for nota in alunosNotas {
//    let novaNota = nota + 1
//    novasNotas.append(novaNota)
//}

//print(AlunosNotas)
//print(novasNotas)

//Utilizando o Map
//alunosNotas = alunosNotas.Map({ res in
//    return res + 1
//})

//Simplificando estrutura
//alunosNotas = alunosNotas.map {$0 * 2}
//print(alunosNotas)

//Filter


//Exemplo sem Filter
//var aprovadosNotas: [Int] = []

//for nota in alunosNotas {
//    if nota >= 6 {
//        aprovadosNotas.append(nota)
//    }
//}

//print(aprovadosNotas)

//Utilizando o Filter
//alunosNotas = alunosNotas.filter({ res in
//    res >= 6
//})

//Simplificando estrutura

//alunosNotas = alunosNotas.filter{$0 >= 6}

//print(alunosNotas)

//Reduce

//Exemplo sem Reduce
var soma = 0
var notas = [4, 5, 6, 8, 10]
//
//for nota in notas {
//    soma += nota
//}

//print(soma)

//Utilizando o Reduce
//soma = notas.reduce(0, {$0 + $1})
//print(soma)

//Simplificando estrutura
soma = notas.reduce(0, +)
print(soma)
