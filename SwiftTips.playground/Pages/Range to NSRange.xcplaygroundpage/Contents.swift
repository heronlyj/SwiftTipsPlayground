//: [Previous](@previous)

import UIKit
//import Foundation
//import CoreText


let text = "😄😄😄Long paragraph saying!"
let nsText = text as NSString
let textRange = NSMakeRange(0, nsText.length)
let attributedString = NSMutableAttributedString(string: text)

nsText.enumerateSubstringsInRange(textRange, options: .ByWords, usingBlock: {
    (substring, substringRange, _, _) in
    
    if (substring == "saying") {
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: substringRange)
    }
})
print(attributedString)



extension String {
    /// :r: Must correctly select proper UTF-16 code-unit range. Wrong range will produce wrong result.
    public func convertRangeFromNSRange(r:NSRange) -> Range<String.Index> {
        let a  = (self as NSString).substringToIndex(r.location)
        let b  = (self as NSString).substringWithRange(r)
        let n1 = a.startIndex.distanceTo(a.endIndex)
        let n2 = b.startIndex.distanceTo(b.endIndex)
        let i1 = startIndex.advancedBy(n1)
        let i2 = i1.advancedBy(n2)
        return  Range<String.Index>(start: i1, end: i2)
    }
    
    /// O(1) if `self` is optimised to use UTF-16.
    /// O(n) otherwise.
    public func convertRangeToNSRange(r:Range<String.Index>) -> NSRange {
        let a = substringToIndex(r.startIndex)
        let b = substringWithRange(r)
        return  NSRange(location: a.utf16.count, length: b.utf16.count)
    }
    
}

extension NSRange {
	
//    func toRange() -> Range<String.Index> {
//
//    }

}


let s = "🇪🇸😂asdfa"
print(s[s.convertRangeFromNSRange(NSRange(location: 4, length: 2))])
print(s[s.convertRangeFromNSRange(NSRange(location: 0, length: 4))])
print(s[s.convertRangeFromNSRange(NSRange(location: 0, length: 2))])
print(s[s.convertRangeFromNSRange(NSRange(location: 0, length: 1))])

print(s.convertRangeToNSRange(s.startIndex..<s.endIndex))
print(s.convertRangeToNSRange(s.startIndex.successor()..<s.endIndex))



"asdfasdfasdfadsfads".rangeOfString("fasdf")

