import UIKit

//Incrementos, operadores logicos

let num1: Int = 21
let num2: Int = 20

let name: String = "Luis"
let lastName: String = "Kokumai"

let compair: Bool = num1 > num2

print(compair)

let res = name < lastName

print(res)

/*
= Atribuicao
== Comparacao
!= Diferente
< Menor
<= Menor igual a
>= Maior igual a
*/

// expressoes

//! Operador de inversão

let isHidden: Bool = true
let isEnable: Bool = true

print(!isHidden)

/*
|| ou
&& e
*/

let xpto = isHidden && isEnable || 10 < 50

print(xpto)

/*
incremento

+= Incremento
-= Decremento
*/

var numIncrement = 10

numIncrement -= 1

print(numIncrement)
