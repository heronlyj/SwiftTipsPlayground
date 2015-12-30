//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)




let a = UIButton()
a.selected = false
let b = UIButton()
b.selected = true
let c = UIButton()
c.selected = false


let arr = [a,b,c]


let brr = arr.map { (btn) -> Bool in
    btn.selected = (btn == b && b.selected == false)
    return btn.selected
}



print(brr)




