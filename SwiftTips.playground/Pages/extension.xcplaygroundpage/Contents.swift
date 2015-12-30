//: [Previous](@previous)

import Foundation

protocol BaseDelegate {
    var value1: Int { get }
    var value2: String { get}
    func func1()
    func func2()
}

extension BaseDelegate {
    
    var value1: Int {
		return 1
    }
    func func1(){
        print("func1")
    }
}


class BaseClass: BaseDelegate {
    var value2: String { return "5"}
    func func2() {
         print("\(value2)")
    }
}


var bc = BaseClass()

bc.value1
bc.value1


struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


square.center




















