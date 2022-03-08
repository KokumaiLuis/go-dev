import UIKit

//Dicionários

var dict: [String: String] = ["Name": "Luis", "Email": "lgkokumai@gmail.com"]

print(dict["Name"] ?? "default")

var dict1: [[String: Any]] = [["Cor": "Vermelho", "Num": 18], ["Cor": "Azul", "Num": 21]]

print(dict1[1]["Cor"]!)
