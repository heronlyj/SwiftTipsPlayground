//: [Previous](@previous)

import Foundation


let URLString = "file:///private/var/mobile/Containers/Data/Application/69306F61-2D85-491E-83E2-F49D1452EFD4/tmp/CFNetworkDownload_FJrkHn.tmp"


URLString.substringWithRange(Range<String.Index>(start: URLString.startIndex, end: URLString.endIndex.advancedBy(-4)))


extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startInt = startIndex.advancedBy(r.startIndex)
            let endInt = startIndex.advancedBy(r.endIndex - r.startIndex)
            return self[Range(start: startInt, end: endInt)]
        }
    }
}

URLString[0...(URLString.characters.count - 4)]




enum test: CustomStringConvertible {
	
    case good, bad
	
    var description: String {
        switch self{
        case .good : return "good people"
        case .bad : return "bad people"
        }
    }

}



test.good

print("B")
print("C", terminator: "")
print("D")



// 維持換行：
print("我依舊會換行")
print("B")
print("C")
print("D")
1
2
3
4
5
// 取消換行：
print("改一改參數就不會換行")
print("B")
print("C", terminator: "")
print("C", terminator: "")
print("D")

let result = 60

if case 0...59 = result {
    print("再上一次課!")
} else if case 60...100 = result {
    print("過關!")
}










