//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)






func randomInRange(range: Range<Int>) -> Int {
    let count = UInt32(range.endIndex - range.startIndex)
    return  Int(arc4random_uniform(count)) + range.startIndex
}

//for _ in 0...100 {
    print(randomInRange(1...6))
//}







func randomHourMin(start start: Int, to: Int) -> String {
    let hour = randomInRange(start...to)
    let hourStr = hour < 10 ? "0\(hour)" : "\(hour)"
    let min = randomInRange(0..<60)
    let minStr = min < 10 ? "0\(min)" : "\(min)"
    return hourStr + ":" + minStr
}


struct Attendance {
    
    var date: NSDate
    var inTime: String
    var outTime: String
    var receiver: String
    var photo: String?
    
    
    static func testData(date: NSDate) -> Attendance {
        let names = ["张老师","Teacher Wang", "Teacher Li", "Teacher Yu"]
        func randomHourMin(start start: Int, to: Int) -> String {
            let hour = randomInRange(start...to)
            let hourStr = hour < 10 ? "0\(hour)" : "\(hour)"
            let min = randomInRange(0..<60)
            let minStr = min < 10 ? "0\(min)" : "\(min)"
            return hourStr + ":" + minStr
        }
        let inTime = randomHourMin(start: 9, to: 10)
        let outTime = randomHourMin(start: 16, to: 17)
        let receiver = names[randomInRange(0..<names.count)]
        let photo: String? = randomInRange(0...1) == 0 ? "dlam" : nil
        return Attendance(date: date, inTime: inTime, outTime: outTime, receiver: receiver, photo: photo)
    }
    
}




print(Attendance.testData(NSDate()))





























