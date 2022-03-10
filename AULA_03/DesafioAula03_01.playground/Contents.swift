//Criar uma funcão que verifique se uma palavra é palíndromo ou não

import UIKit

//Funcao com retorno
func isPalindrome1(word: String) -> Bool{
    let reversedWord: String = String(word.filter({$0 != " "}).reversed())
    let wordNoSpace: String = String(word.filter({$0 != " "}))
    
    if (reversedWord == wordNoSpace && reversedWord != "") {
        return true
    } else {
        return false
    }
}

print(isPalindrome1(word: "subi no onibus"))
print(isPalindrome1(word: "luis"))


//Funcao sem retorno
func isPalindrome2(word: String) {
    let reversedWord: String = String(word.filter({$0 != " "}).reversed())
    let wordNoSpace: String = String(word.filter({$0 != " "}))
    
    if (reversedWord == wordNoSpace && reversedWord != "") {
        print("\(wordNoSpace) = \(reversedWord)")
        print("A palavra '\(wordNoSpace)' é palíndromo.")
    } else {
        print("\(wordNoSpace) != \(reversedWord)")
        print("A palavra '\(wordNoSpace)' não é palíndromo.")
    }
}

isPalindrome2(word: "subi no onibus")
isPalindrome2(word: "luis")
