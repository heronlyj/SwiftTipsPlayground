//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//    ========================================================================
//    println() 已經無法使用，只能使用print，別問我怎麼換行，先試試以下程式
// 維持換行：
print("我依舊會換行")
print("B")
print("C")
print("D")
// 取消換行：
print("改一改參數就不會換行")
print("B")
print("C", terminator: "")
print("D")
//    ========================================================================
//加入 if case 的寫法
// 原始寫法：
// Swift 2.0 寫法
let result = 60

if case 0...59 = result {
    print("再上一次課!")
} else if case 60...100 = result {
    print("過關!")
}
//========================================================================
//增加 if case 的寫法

let userInfo = (id: "swiftpass", name: "Xchobo", age: 18, email: "xchobo@gmail.com")

if case (_, _, 0..<18, _) = userInfo {
    print("不好意思，年齡不足喔")
} else if case (_, _, _, let email) = userInfo where email == "" {
    print("請填寫電子郵件")
} else if case (_, let name, _, _) = userInfo where name != "" {
    print("\(name)檢查通過，可以開始註冊")
}
//========================================================================
//for-in 利用 where 條件式可進行篩選

let numbers = [13, 118, 76, 452, 568, 873]
print("只會列印超過100的值")
for number in numbers where number > 100 {
    print(number)
}
//========================================================================
//do-while 目前改寫為 repeat-while
// 原始寫法：
//var i = 0
//print("使用 do-while")
//do {
//    i++
//    print(i)
//} while i < 10
// Swift 2.0 寫法
var i = 0
print("使用 repeat-while")
repeat {
    i++
    print(i)
} while i < 10
//    ========================================================================
//增加 do…catch 處理
// 原始寫法(Swift1.2)：
//let filePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as? String

//if let file = filePath {
//    println("抓到錯誤")
//}
// Swift 2.0 寫法
let filePath2 = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)

let contents: NSString?
do {
    contents = try String(contentsOfFile: filePath2[0], encoding: NSUTF8StringEncoding)
    print("contents=\(contents)")
} catch _ {
    print("抓到錯誤")
}
// 原始寫法(Swift1.2)：
//let createBool: Bool = NSFileManager.defaultManager().createDirectoryAtPath(dirName, withIntermediateDirectories: true, attributes: nil)
// Swift 2.0 寫法：
//let createBool: Bool!
//do{
//    try NSFileManager.defaultManager().createDirectoryAtPath(dirName, withIntermediateDirectories: true, attributes: nil)
//    createBool = true
//} catch _ {
//    createBool = false
//}
//========================================================================
//增加 Guard 關鍵字，用來處理多重 if 的流程
struct Article {
    var title:String?
    var description:String?
    var author:String?
    var totalWords:Int?
}
// Swift 1.2 依舊使用中的 if
func printInfo(article: Article) {
    if let totalWords = article.totalWords where totalWords > 1000 {
        if let title = article.title {
            print("Title: \(title)")
        } else {
            print("Error: Couldn't print the title of the article!")
        }
    } else {
        print("Error: Couldn't print the total word count!")
    }
}
// Swift 2.0 增加的 Guard
func printInfoGuard(article: Article) {
    guard let totalWords = article.totalWords where totalWords > 1000 else {
        print("Error: Couldn't print the total word count!")
        return
    }
    guard let title = article.title else {
        print("Error: Couldn't print the title of the article!")
        return
    }
    print("Title: \(title)")
}

let sampleArticle = Article(title: "Swift Guide", description: "A beginner's guide to Swift 2", author: "Simon Ng", totalWords: 1500)

printInfo(sampleArticle)
printInfoGuard(sampleArticle)
    ========================================================================
//協定擴展
//在 Swift 1.0 中，可以開始使用擴展，用來增加類別的新功能，在 Swift 2.0 中，可以擴展協定

protocol Container {
    var items:[String] {get set}
    func numberOfItems() -> Int
}
class ToolBox: Container {
    var items:[String] = ["Glue Stick", "Scissors", "Hammer", "Level", "Screwdriver", "Jigsaw"]
    func numberOfItems() -> Int {
        return items.count
    }
}
class Basket: Container {
    var items:[String] = ["Orange", "Apple", "Honeydew", "Watermelon", "Pineapple"]
    func numberOfItems() -> Int {
        return items.count
    }
}
var container:Container = ToolBox()
print(container.numberOfItems())

container = Basket()
print(container.numberOfItems())

// 擴充協定
extension Container {
    func numberOfItems() -> Int {
        return items.count
    }
    func randomItem() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(items.count)))
        return items[randomIndex]
    }
}
container.randomItem()
//    ========================================================================
//系統版本識別
//在 iOS8 前無法檢查系統版本時，需要額外處理
// 原始寫法：
if NSClassFromString("NSURLQueryItem") != nil {
    // iOS 8 or up
} else{
    // Earlier iOS versions
}
// Swift 2.0 寫法: 用來檢查API是否符合 iOS9版本
@available(iOS 9, *)
class SuperFancy {
    // implementation
}

// Swift 2.0 寫法: 用來檢查API是否符合 iOS8.4 或 OSX10.10版本
guard #available(iOS 8.4, OS X 10.10, *) else {
    // what to do if it doesn't meet the minimum OS requirement
    return
}