//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    public init() {}
}



TrackedString().numberOfEdits

