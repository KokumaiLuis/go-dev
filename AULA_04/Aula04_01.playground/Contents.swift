import UIKit

//Classes x Struct

//Class
//class Person {
//    var name: String
//    var lastName: String
//    var age:Int
//
//    init(name: String, lastName: String, age: Int) {
//        self.name = name
//        self.lastName = lastName
//        self.age = age
//    }
//
//    func welcome() {
//        print("Seja bem vindo, \(name) \(lastName)")
//    }
//}
//Em classe, os atributos são passados como herança, é reference type
//var person1 = Person(name: "Luis", lastName: "Kokumai", age: 20)
//var person2 = person1
//
//person1.name = "Fernando"
//
//print(person1.name)
//print(person2.name)
//
//person1.welcome()

//Struct

struct Person {
    var name: String
    var lastName: String
    var age: Int

    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }

    func welcome() {
        print("Seja bem vindo, \(name) \(lastName)")
    }
}

//Em struct, os atributos não são passados como herança, é value type
var person1 = Person(name: "Luis", lastName: "Kokumai", age: 20)
var person2 = person1

person1.name = "Fernando"

print(person1.name)
print(person2.name)
