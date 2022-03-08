import UIKit

//Colecao de dados - Array

var cars: [String] = ["Fusca", "Ferrari", "Audi A3", "Celta"]

cars.append("Gol")

cars.insert("HB20", at: cars.count)

print(cars)
print(cars.count - 1)

cars.removeLast()

