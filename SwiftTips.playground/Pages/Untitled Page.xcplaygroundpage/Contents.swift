//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


"sowow".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLPathAllowedCharacterSet())!


"我的傻".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLPathAllowedCharacterSet())!

"sssss😽🙀".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLPathAllowedCharacterSet())!

/**
public class func controlCharacterSet() -> NSCharacterSet
public class func whitespaceCharacterSet() -> NSCharacterSet
public class func whitespaceAndNewlineCharacterSet() -> NSCharacterSet
public class func decimalDigitCharacterSet() -> NSCharacterSet
public class func letterCharacterSet() -> NSCharacterSet
public class func lowercaseLetterCharacterSet() -> NSCharacterSet
public class func uppercaseLetterCharacterSet() -> NSCharacterSet
public class func nonBaseCharacterSet() -> NSCharacterSet
public class func alphanumericCharacterSet() -> NSCharacterSet
public class func decomposableCharacterSet() -> NSCharacterSet
public class func illegalCharacterSet() -> NSCharacterSet
public class func punctuationCharacterSet() -> NSCharacterSet
public class func capitalizedLetterCharacterSet() -> NSCharacterSet
public class func symbolCharacterSet() -> NSCharacterSet
@available(iOS 2.0, *)
*/

var emoji = "😽🙀"

"😽🙀".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.symbolCharacterSet())

"😽🙀".utf16

emoji.dataUsingEncoding(NSUTF8StringEncoding)



let s = "🙀" as NSString
s.UTF8String[0]
/**
*  
*/

let myStr = "1f564"
let strrrrrr = String(Character(UnicodeScalar(Int(myStr, radix: 16)!)))

"sdfadsfa".characters.count

"sss".utf8


let sparklingHeart = "\u{1F496}"
"👊🏼aosdjfk"

"\u{1F496}" == "💖"

let testStr = " asdd            asdfasd    "

testStr.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())





import AVFoundation
import Foundation
import CoreMedia

func mergeAndExportVideosAtFileURLs(fileURLArray:[NSURL]) {
	
    let mixComposition = AVMutableComposition()
    var layerInstructionArray = [AVMutableVideoCompositionLayerInstruction]()
    var totalDuration:CMTime = kCMTimeZero
    var renderSize = CGSize(width: 0, height: 0)
    for videoURL in fileURLArray {
        let asset = AVAsset(URL: videoURL)
        let assetTrack = asset.tracksWithMediaType(AVMediaTypeVideo).first!
        renderSize.width = max(renderSize.width, assetTrack.naturalSize.height)
        renderSize.height = max(renderSize.height, assetTrack.naturalSize.width)
    }
    
    let renderW = min(renderSize.width, renderSize.height)
    
    do {
        for videoURL in fileURLArray {
            
            let asset = AVAsset(URL:videoURL)
            
            let videoTrack: AVMutableCompositionTrack = mixComposition.addMutableTrackWithMediaType(AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)
            let audioTrack: AVMutableCompositionTrack = mixComposition.addMutableTrackWithMediaType(AVMediaTypeAudio, preferredTrackID: kCMPersistentTrackID_Invalid)
            
            if let video = asset.tracksWithMediaType(AVMediaTypeVideo).first as AVAssetTrack? {
                try videoTrack.insertTimeRange(CMTimeRange(start: kCMTimeZero, duration: asset.duration), ofTrack: video, atTime: totalDuration)
            } else {
                continue
            }
            if let audio: AVAssetTrack = asset.tracksWithMediaType(AVMediaTypeAudio).first as AVAssetTrack? {
                try audioTrack.insertTimeRange(CMTimeRange(start: kCMTimeZero, duration: asset.duration), ofTrack: audio, atTime: totalDuration)
            }
            totalDuration = CMTimeAdd(totalDuration, asset.duration)
            
            let layerInstruction: AVMutableVideoCompositionLayerInstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: videoTrack)
            let rate = renderW / min(videoTrack.naturalSize.height, videoTrack.naturalSize.width)
            var layerTransform = CGAffineTransform( a:  videoTrack.preferredTransform.a,
                                                    b:  videoTrack.preferredTransform.b,
                                                    c:  videoTrack.preferredTransform.c,
                                                    d:  videoTrack.preferredTransform.d,
                                                    tx: videoTrack.preferredTransform.tx * rate,
                                                    ty: videoTrack.preferredTransform.ty * rate )
            layerTransform = CGAffineTransformConcat(layerTransform, CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: -(videoTrack.naturalSize.width - videoTrack.naturalSize.height)/2.0))
            layerTransform = CGAffineTransformScale(layerTransform, rate, rate)
            layerInstruction.setTransform(layerTransform, atTime: kCMTimeZero)
            layerInstruction.setOpacity(00, atTime: totalDuration)
            layerInstructionArray.append(layerInstruction)
        }
        
    } catch {
    
    }
    
    
}








extension Array {
    
    public mutating func replaceOutOfRange<C : CollectionType where C.Generator.Element == Element>(bigRange: Range<Int>, with newElements: C) {
        let startIdx = Int(bigRange.startIndex.toIntMax())
        guard startIdx >= 0 && startIdx <= count else { return }
        let endIdx = startIdx + Int(newElements.count.toIntMax()) > count ? count : startIdx + Int(newElements.count.toIntMax())
        replaceRange(Range(start: startIdx, end: endIdx), with: newElements)
    }
    
}



var a = [1,3,41,51,234,523,2,123,1,412,3,12,12]

a.count

let b = [12,312,31,2,41,23,12,3,12,41,24,12,312,3,41,5,345,34,5]
b.count

//a.replaceRange(Range(start: 5, end: 5 + b.count), with: b)
a.replaceOutOfRange(Range(start: 5, end: 5 + b.count), with: b)

a.count
//a.replaceRange(Range(start: 25, end: 25 + b.count), with: b)
a.replaceOutOfRange(Range(start: 25, end: 25 + b.count), with: b) //超出返回的报错 
a.count



let formatter = NSNumberFormatter()
formatter.numberStyle = .SpellOutStyle
let string = "This is Functional Programming"
let translateURLs = string
    // Split the characters into words
    .characters.split(" ")
    // Count the number of characters on each word
    .map { $0.count }
    // Spell out this number of chars (`stringFromNumber` can return nil)
    .flatMap { (n: Int) -> String? in formatter.stringFromNumber(n) }
    // add " letters" suffix
    .map { "\($0) letters" }
    // encode the string so it can be used in an NSURL framgment after the # (the stringByAdding… method can return nil)
    .flatMap { $0.stringByAddingPercentEncodingWithAllowedCharacters(.URLFragmentAllowedCharacterSet()) }
    // Build an NSURL using that string (`NSURL(string: …)` is failable: it can return nil)
    .flatMap { NSURL(string: "https://translate.google.com/#auto/fr/\($0)") }

translateURLs

translateURLs.map{ print($0) }
print(translateURLs)


formatter.stringFromNumber(311231)

"3good ".stringByAddingPercentEncodingWithAllowedCharacters(.URLFragmentAllowedCharacterSet())









