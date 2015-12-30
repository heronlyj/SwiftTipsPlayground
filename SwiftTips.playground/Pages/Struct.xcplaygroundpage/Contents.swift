//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


struct People {
    var name: String!
    var age: Int!
    var abc = 100000
    mutating func fixAge(newAge: Int){
        guard  age != nil else { age = newAge; return }
    	age! += newAge
    }
}

var people = People()

//people.name = "good people"
//people.name

people.fixAge(100)

people.age

people.fixAge(100)

people.age
//
//people.abc
//
//people.abc += 100
//
//people.abc
