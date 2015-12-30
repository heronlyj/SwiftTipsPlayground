//: [Previous](@previous)

import Foundation

//var str = "Hello, playground"

//extension String{
//    
//    func escapeSpaceTillCahractor() -> String {
//        return self.stringEscapeHeadTail(strs:["\r", " ", "\n"])
//    }
//    
//    func escapeHeadStr(str: String) -> (String, Bool) {
//        var result = self as NSString
//        var findAtleastOne = false
//        while( true ){
//            let range = result.rangeOfString(str)
//            if range.location == 0 && range.length == 1 {
//                result = result.substringFromIndex(range.length)
//                findAtleastOne = true
//            }else{
//                break
//            }
//        }
//        return (result as String, findAtleastOne)
//    }
//    
//    func escapeSpaceTillCahractor(strs strs:[String]) -> String {
//        var result = self
//        while true {
//            var findAtleastOne = false
//            for str in strs {
//                var found:Bool = false
//                (result, found) = result.escapeHeadStr(str)
//                if found {
//                    findAtleastOne = true
//                    break  //for循环
//                }
//            }
//            if findAtleastOne == false {
//                break
//            }
//        }
//        return result as String
//    }
//    
//    func reverse() -> String {
//        
//        var inReverse = ""
//        for letter in self.characters {
//            print(letter)
//            inReverse = "\(letter)" + inReverse 
//        } 
//        return inReverse 
//    } 
//    
//    func escapeHeadTailSpace() -> String {
//        return self.escapeSpaceTillCahractor().reverse().escapeSpaceTillCahractor().reverse() 
//    } 
//    
//    func stringEscapeHeadTail(strs strs:[String]) -> String {
//        return self.escapeSpaceTillCahractor(strs:strs).reverse().escapeSpaceTillCahractor(strs:strs).reverse() 
//    }
//    
//    
//    func filterSpace() -> [Character] {
//        var once = true
//        let result = characters.filter{
//            if once {
//                if !["\r", " ", "\n"].contains($0) {
//                    once = false
//                }
//            }
//            return once
//        }
//		return result
//    }
//}


var str = "       \n   \r \r\n \t Hello, \n playground  \n  \t \t \n \n\r   \n    "
//let length = (str as NSString).length
//let a = str.escapeHeadTailSpace()
//let b = str.stringEscapeHeadTail(strs:["\r", "\n", "\t", "\r\n", " "])


//let result = str.characters.filter {
//    return !["\r", " ", "\n"].contains($0)
//}
//
//str.filterSpace()
//
//let aa = "w,x,y,z".characters.split { $0 == "," }.map(String.init)
//
//print(aa)
//

let bbb = str.characters.split{["\r", "\n", "\t", "\r\n", " "].contains($0)}.map(String.init)


bbb


extension String {
    func condenseWhitespace() -> String {
        return self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).filter({!$0.isEmpty}).joinWithSeparator(" ")
    }
    
    func onlyHaveSpace() -> Bool {
        return self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).filter({!$0.isEmpty}).count == 0
    }
}

var string = "  Lorem   \r  ipsum dolar   sit  amet. "
print(string.condenseWhitespace())

print(str.condenseWhitespace())

"    \n\r\r    ".onlyHaveSpace()


"#￥%……￥%￥%￥~~~  哈哈哈哈   乃们造在唱甚么~".stringByRemovingPercentEncoding





