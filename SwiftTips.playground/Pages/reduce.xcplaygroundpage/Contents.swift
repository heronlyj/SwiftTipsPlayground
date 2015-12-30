//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


let a = [0, 1, 2, 3, 4].map{$0 + 3}.filter{$0 % 2 == 0}.reduce(0, combine: +)

a


// 这里只需要遍历 1 次序列足矣
let b = [0, 1, 2, 3, 4].reduce(0, combine: { (ac: Int, r: Int) -> Int in
    if (r + 3) % 2 == 0 {
        return ac + r + 3
    } else {
        return ac
    }
})


b

//Array(0...100000).map({ $0 + 3}).reverse().prefix(3)


// 返回列表最小项
[1, 5, 2, 9, 4].minElement()



let c = [1,3,5,5,1,9,1]




