//: [Previous](@previous)

import Foundation


var str = "Hello, playground"

//: [Next](@next)

var value = "green red blue"

value.replaceRange(value.startIndex.advancedBy(6)..<value.startIndex.advancedBy(6 + 3), with: "yellow")


var text = "cats and dogs"
let replaceString = "A"
text.replaceRange(text.endIndex.advancedBy(-0)..<text.endIndex, with: replaceString)


// Replace cats with birds.
// ... Use Foundation method.
let result = text.stringByReplacingOccurrencesOfString("cats",
    withString: "birds",
    options: NSStringCompareOptions.LiteralSearch,
    range: text.startIndex..<text.endIndex)

// Print result.
print(result)


var a = "1231421"
a.replaceRange(a.endIndex.advancedBy(-1)..<a.endIndex, with: "3")



//var xxxxx = "1253"
//let range = NSRange(location: 4, length: 0)
//range.length
//xxxxx.replaceRange(xxxxx.endIndex.advancedBy(-range.length)..<xxxxx.endIndex, with: "3")


var good = "adskjl"
//good.textFieldTextChangeResult(NSRange(location: 3, length: 1), replaceString: "123124")
//good.substringWithRange(Range(start: good.endIndex.advancedBy(-1), end: good.endIndex))
good.endIndex.predecessor()
good.substringToIndex(good.endIndex.advancedBy(-3)) + "aaaa"

//good.replaceRange(Range(start: Index(3), <#T##Int32#>), end: <#T##Element#>), with: <#T##CollectionType#>)



extension String {
    
    func safeStringReplaceWithRange(start: Int, end: Int, replaceString string: String) {
    	let startIndex = self.startIndex.advancedBy(start)
        let endIndex = self.startIndex.advancedBy(end)
        
    }
    
}

let emoji = "👍"




