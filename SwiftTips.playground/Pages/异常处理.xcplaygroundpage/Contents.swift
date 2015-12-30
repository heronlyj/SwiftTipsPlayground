//: [Previous](@previous)

import Foundation


enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(required: Double)
    case OutOfStock
}

struct Item {
    var price: Double
    var count: Int
}

var inventory = [
    "Candy Bar": Item(price: 1.25, count: 7),
    "Chips": Item(price: 1.00, count: 4),
    "Pretzels": Item(price: 0.75, count: 11)
]
var amountDeposited = 1.00

func vend(itemNamed name: String) throws {
    guard var item = inventory[name] else {
        throw VendingMachineError.InvalidSelection
    }
    
    guard item.count > 0 else {
        throw VendingMachineError.OutOfStock
    }
    
    if amountDeposited >= item.price {
        // Dispense the snack
        amountDeposited -= item.price
        --item.count
        inventory[name] = item
    } else {
        let amountRequired = item.price - amountDeposited
        throw VendingMachineError.InsufficientFunds(required:   amountRequired)
    }
}


let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vend(itemNamed: snackName)
}

do {
    try vend(itemNamed: "Candy Bar")
    // Enjoy delicious snack
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let   amountRequired) {
    print("Insufficient funds. Please insert an additional $\(amountRequired).")
}





struct ExtensionsExample {
	var num = 10
}


extension ExtensionsExample {
    var km: Int { return self.num * 1_000 }
//    var m : Double { return self }
//    var cm: Double { return self / 100.0 }
//    var mm: Double { return self / 1_000.0 }
//    var ft: Double { return self / 3.28084 }
}

typealias KM = Double

extension KM {
    var km: KM { return self * 1_000 }
    var m : KM { return self }
    var cm: KM { return self / 100.0 }
    var mm: KM { return self / 1_000.0 }
    var ft: KM { return self / 3.28084 }
}

1234.ft

214123.000.mm

class ExtensionsExampleClass {
    var goodDay: Int!
}

extension ExtensionsExampleClass{
    var km: Int { return 100 * 100 }
}


extension Int {
    
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        return (self / decimalBase) % 10
    }
    
    func repeatPlay(play :(index: Int) -> ()) {
        for i in 0..<self {
        	play(index: i)
        }
    }
}

6.repeatPlay {
    print("good \($0)")
}

let items = [1,3,412,12,5,1,3,5]
items.count.repeatPlay{
	print(items[$0])
}

12323412312[3]

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off








