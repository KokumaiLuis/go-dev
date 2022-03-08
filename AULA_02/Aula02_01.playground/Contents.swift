import UIKit

//Variável Opcional

var message: String?
message = "Minha mensagem"
print(message ?? "a")

//Se a variável não for nula, ele printa a mensagem (ou realiza o bloco de função)
if let message = message {
    print(message)
}

/*Equivalente a:
if message != null {
    print(message)
} else {
    print("Null")
}
*/
