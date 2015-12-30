//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

var value = "green red blue"

value.replaceRange(value.startIndex.advancedBy(
    6)..<value.startIndex.advancedBy(6 + 3),
    with: "yellow")


var text = "cats and dogs"
let replaceString = "AAAAAAAA"
text.replaceRange(text.endIndex.advancedBy(-1)..<text.endIndex, with: replaceString)





// Replace cats with birds.
// ... Use Foundation method.
let result = text.stringByReplacingOccurrencesOfString("cats",
    withString: "birds",
    options: NSStringCompareOptions.LiteralSearch,
    range: text.startIndex..<text.endIndex)

// Print result.
print(result)


var a = "1231421"
a.replaceRange(a.endIndex.advancedBy(-1)..<a.endIndex.advancedBy(0), with: "3")
print(a)



