//Criar uma funcão que verifique se uma palavra é palíndromo ou não

import UIKit

//Funcao com retorno
func isPalindrome1(word: String) -> Bool{
    let reversedWord: String = String(word.reversed())
    
    if (reversedWord == word && reversedWord != "") {
        return true
    } else {
        return false
    }
}

print(isPalindrome1(word: "subinoonibus"))
print(isPalindrome1(word: "luis"))


//Funcao sem retorno
func isPalindrome2(word: String) {
    let reversedWord: String = String(word.reversed())
    
    if (reversedWord == word && reversedWord != "") {
        print("\(word) = \(reversedWord)")
        print("A palavra '\(word)' é palíndromo.")
    } else {
        print("\(word) != \(reversedWord)")
        print("A palavra '\(word)' não é palíndromo.")
    }
}

isPalindrome2(word: "subinoonibus")
isPalindrome2(word: "luis")
