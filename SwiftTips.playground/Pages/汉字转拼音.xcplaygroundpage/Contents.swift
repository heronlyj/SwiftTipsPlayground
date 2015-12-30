//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


/**

CFStringTransform
iOS在CoreFoundation中提供了CFStringTransform函数，但在Foundation中却没有相对应的方法。它的定义如下：

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse);
其中string参数是要转换的string，比如要转换的中文，同时它是mutable的，因此也直接作为最终转换后的字符串。range是要转换的范围，同时输出转换后改变的范围，如果为NULL，视为全部转换。transform可以指定要进行什么样的转换，这里可以指定多种语言的拼写转换。reverse指定该转换是否必须是可逆向转换的。如果转换成功就返回true，否则返回false。

如果要进行汉字到拼音的转换，我们只需要将transform设定为kCFStringTransformMandarinLatin或者kCFStringTransformToLatin（kCFStringTransformToLatin也可适用于非汉字字符串）:

CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, CFSTR("中国"));CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);NSLog(@"%@", string);
这段代码将输出：

zhōng guó
可以看出，CFStringTransform正确的输出了“中国”的拼音，而且还带上了音标。有时候我们不需要音标怎么办？还好CFStringTransform同时提供了将音标字母转换为普通字母的方法kCFStringTransformStripDiacritics。我们在上面的代码基础上再加上这个：

CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);NSLog(@"%@", string);
那么最终将输出：

zhong guo
*/

//CFStringCreateMutableCopy(nil, <#T##maxLength: CFIndex##CFIndex#>, <#T##theString: CFString!##CFString!#>)

let string = CFStringCreateMutableCopy(nil, 0, "中国")

print(string!)

//let range: UnsafeMutablePointer<CFRange> = CFRangeMake(0, 1)

//CFStringTransform(string, CFRangeMake(0, 1),kCFStringTransformMandarinLatin , true)

CFStringTransform(string, nil, kCFStringTransformMandarinLatin, false)

print(string)


CFStringTransform(string, nil, kCFStringTransformStripDiacritics, false)

print(string)




