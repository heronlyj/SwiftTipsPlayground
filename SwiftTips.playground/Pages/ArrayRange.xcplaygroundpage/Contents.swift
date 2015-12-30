//: [Previous](@previous)

import Foundation




extension Array{
    
    public mutating func replaceOutOfRange<C : CollectionType where C.Generator.Element == Element>(bigRange: Range<Int>, with newElements: C) {
        let startIdx = Int(bigRange.startIndex.toIntMax())
        guard startIdx >= 0 && startIdx <= count else { return }
        let endIdx = startIdx + Int(newElements.count.toIntMax()) > count ? count : startIdx + Int(newElements.count.toIntMax())
        replaceRange(Range(start: startIdx, end: endIdx), with: newElements)
    }
    
}

var i = 0
var one = Array(count: 10, repeatedValue: 1).map { $0 + i++ }
one
let subOne = [1,3,12,5,2]
let startIdx = 8
one.replaceOutOfRange(Range(start: startIdx, end: startIdx + subOne.count), with: subOne)

one



























