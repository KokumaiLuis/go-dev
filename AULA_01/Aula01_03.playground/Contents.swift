import UIKit

let isHidden: Bool = true
let isEnable: Bool = false

//if
if isHidden {
    print("Caso verdadeiro")
} else if isEnable {
    print("Caso verdadeiro: is Enable")
} else {
    print("Caso falso")
}

var system: String
let company: String = "Apple"

if company == "Apple" {
    system = "iOS"
} else {
    system = "Android"
}

//if ternário

system = company == "Apple" ? "iOS" : "Android"

print(system)

