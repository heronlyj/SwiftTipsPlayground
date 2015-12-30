//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

print("asdafad", separator: "\t", terminator: "\nasdfasdf")

Float(0xC.3p0)

1_000_000.000_000_1

let minusSix = -6
let alsoMinusSix = +minusSix

Int16("a".hash)

"a".hashValue

Int8(4)

0x12fc > 124


123 > 0x123

extension Character
{
    func unicodeScalarCodePoint() -> UInt32
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        _ = scalars.startIndex
        return scalars[scalars.startIndex].value
    }
}

"a".characters.first!.unicodeScalarCodePoint()


"😽".characters.first!.unicodeScalarCodePoint()

"🙀".utf8

struct Vector2D {
    var x = 0.0, y = 0.0
}

func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print("\([1,3,4,5,65,12,22,31])", terminator: "           ")
print("\([1,3,4,5,65,12,22,31])", terminator: "  ")


let setttt = [1, 12]
setttt.sort { (a, b) -> Bool in
    return a > b
}

let houseAnimals = ["🐶", "🐱"]
let farmAnimals = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals = ["🐦", "🐭"]

//houseAnimals.isSubsetOf(farmAnimals)
//// true
//farmAnimals.isSupersetOf(houseAnimals)
//// true
//farmAnimals.isDisjointWith(cityAnimals)
//// true

Set(houseAnimals).isSubsetOf(farmAnimals)

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}


func sumOfNumbers(str: String = "1", lotNumber numbers: Int...) -> Int {
    var total: Int = 0
    if let num = Int(str) {
        total += num
    }
    
    for number in numbers {
        total += number
    }
    
    return total
    
}

sumOfNumbers(lotNumber: 1,2,3)



