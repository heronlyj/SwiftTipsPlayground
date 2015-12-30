//: [Previous](@previous)

import Foundation

//: [Next](@next)

var o1:Int? = nil

var o1m = o1.map({$0 * 2})
o1m /* Int? with content nil */

o1 = 1

o1m = o1.map({$0 * 2})
o1m /* Int? with content 2 */

var os1m = o1.map({ (value) -> String in
    String(value * 2)
})
os1m /* String? with content 2 */

os1m = o1.map({ (value) -> String in
    String(value * 2)
}).map({"number "+$0})

os1m /* String? with content "number 2" */

var a1 = [1,2,3,4,5,6]

var a1m = a1.map({$0 * 2})
a1m /* [Int] with content [2, 4, 6, 8, 10, 12] */

let ao1:[Int?] = [1,2,3,4,5,6]

var ao1m = ao1.map({$0! * 2})
ao1m /* [Int] with content [1,2,3,4,5,6]  */

var a1ms = a1.map({ (value) -> String in
    String(value * 2)
}).map { (stringValue) -> Int? in
    Int(stringValue)
}
a1ms /* [Int?] with content [.Some(2),.Some(4),.Some(6),.Some(8),.Some(10),.Some(12)] */


var s1:String? = "1"
var i1 = s1.map {
    Int($0)
}
i1 /* Int?? with content 1 */

var ar1 = ["1","2","3","a"]
var ar1m = ar1.map {
    Int($0)
}
ar1m /* [Int?] with content [.Some(1),.Some(2),.Some(3),nil] */

ar1m = ar1.map {
    Int($0)
    }
    .filter({$0 != nil})
    .map {$0! * 2}
ar1m /* [Int?] with content [.Some(1),.Some(2),.Some(3)] */




var fo1:Int? = nil

var fo1m = fo1.flatMap({$0 * 2})
fo1m /* Int? with content nil */

fo1 = 1

fo1m = fo1.flatMap({$0 * 2})
fo1m /* Int? with content 2 */

var fos1m = fo1.flatMap({ (value) -> String? in
    String(value * 2)
})
fos1m /* String? with content "2" */

var fs1:String? = "14664"

var fi1 = fs1.flatMap {
    Int($0)
}
fi1 /* Int? with content "1" */

var fi2 = fs1.flatMap {
    Int($0)
    }.map {$0*2}

fi2 /* Int? with content "2" */

var fa1 = [1,2,3,4,5,6]

var fa1m = fa1.flatMap({$0 * 2})
fa1m /*[Int] with content [2, 4, 6, 8, 10, 12] */

var fao1:[Int?] = [1,2,3,4,nil,6]

var fao1m = fao1.flatMap({$0})
fao1m /*[Int] with content [1, 2, 3, 4, 6] */

var fa2 = [[1,2],[3],[4,5,6]]

var fa2m = fa2.flatMap({$0})
fa2m /*[Int] with content [1, 2, 3, 4, 5, 6] */




var far1 = ["1","2","3","a"]
var far1m = far1.flatMap {
    Int($0)
}
far1m /* [Int] with content [1, 2, 3] */

far1m = far1.flatMap {
    Int($0)
    }
    .map {$0 * 2}
far1m /* [Int] with content [2, 4, 6] */



enum CompassPoint: String {
    case North, South, East, West
}

let compassPoint = CompassPoint.North
compassPoint.rawValue


enum CompassPointWithInt: Int {
    case North, South, East, West
}

let compPoint = CompassPointWithInt.North
compPoint.rawValue



struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

class SubSomeClass: SomeClass {
    /*这里用class 与 static 修饰的效果一样 都是 store 类型*/  var storedTypeProperty = "asdegaeg"
    override class var overrideableComputedTypeProperty: Int {
        return 200
    }
}



SomeClass.overrideableComputedTypeProperty
SubSomeClass.overrideableComputedTypeProperty// 重写的类属性 ，不影响父类


SomeStructure.storedTypeProperty = "asdfasdfasdfads"

let itSomeStructure = SomeStructure()

/**
*  值类型编译
*/
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// 打印输出: "The point is now at (3.0, 4.0)"


struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
    
   subscript(index: Int) -> NSObject {
        // 返回与入参匹配的Int类型的值
        return 10
    }
}


/// 可变异的结构体 不能初始化成 let
var lt = LevelTracker()

lt[3]

lt.advanceToLevel(3)

var i = 1
let countRepeart = Array(count: 10, repeatedValue: i).map{$0*(i++)}
countRepeart

func testNumProp(a: Int , _ b: Int) {
	print(a+b)
}




class mutableFunc {
    func funccc(){}
    func funccc(a: Int){}
    func funccc(a: Int, b: Int){}
}


struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let dog = Animal(species: "")

class Product {
    let name: String!
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}


if let bowTie = Product(name: "") {
    // 不需要检查 bowTie.name == nil
    print("The product's name is \(bowTie.name)")
}else {
    print("The product's name is ")
}
//



struct Bank {
    static var coin = 100000
}

Bank.coin = 100

let otherBank = Bank()

(UINT64_MAX | 0) >> 1
UINT64_MAX >> 1

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var john: Customer?

john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)



john = nil




