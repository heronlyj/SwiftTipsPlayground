//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

struct People {
    
    var name: String!
    
    var age: Int {
        didSet{
            //value did change , do somethind
            des = "\(name)'s  age is \(age)"
        }
        willSet{
		// value will change, do something
            print("\(name)'s age is change to \(age)")
        }
    }
    
    var des: String!
    
}

var p = People(name: "Jack", age: 13, des: "")

p.age = 12

p.des


func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition: lessThanTen)

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})



print(numbers)

let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)



enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

ace.simpleDescription()

let three = Rank.Three
three.simpleDescription()


enum Suit {
    case Spades, Hearts, Diamonds, Clubs, Mytest
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        default:
            return String(self.hashValue)
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

let suitTest = Suit.Mytest
print(suitTest)


enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...  \(error)"
}



protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


b.simpleDescription = "agjalkjdoaisjdgalksjdflkasj"

b.simpleDescription

a.simpleDescription = "askdhfaksdjfioajsdflkajs kl"




var protocolValue: ExampleProtocol = a //泛型
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Uncomment to see the erro

protocolValue = b// 泛型







func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

repeatItem("knock", numberOfTimes:4)



// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped, Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100,99)



func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem { // 类型相同才可以比较
                return true
            }
        }
    }
    return false
}

struct Lily {
    var name = "Lily"
}
anyCommonElements([1, 2, 3], ["3"]) //可是这不是同类型啊
//anyCommonElements([1, 2, 3], [Lily()]) // 报错




print("alkdjgalkdjgadadsfads")//这样打印没有换行符

print("asdfasdfasd")






