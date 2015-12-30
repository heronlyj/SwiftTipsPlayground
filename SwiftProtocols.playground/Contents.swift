//: #### Introducing Protocol-Oriented Programming in Swift 2
//: http://www.raywenderlich.com/109156/introducing-protocol-oriented-programming-in-swift-2

import Foundation

protocol Bird: BooleanType {
  var name: String { get }
  var canFly: Bool { get }
}

//: > `BooleanType` is a Swift Standard Library protocol that is conformed to by any type that wants to behave as a boolean. In other words, it can be resolved to a Bool type and can be used implicitly in an `if` statement.
//: > In this extension, `BooleanType` is given default behavior for any `Bird`, and returns the value of `canFly`.

extension BooleanType where Self: Bird {
  var boolValue: Bool {
    return self.canFly
  }
}

//: > Extending `Bird` to have default behavior means that `Bird` types that are also `Flyable` no longer need to implement the `canFly` property themselves.

extension Bird where Self: Flyable {
  // Flyable birds can fly!
  var canFly: Bool { return true }
}

protocol Flyable {
  var airspeedVelocity: Double { get }
}

struct FlappyBird: Bird, Flyable {
  let name: String
  let flappyAmplitude: Double
  let flappyFrequency: Double

  var airspeedVelocity: Double {
    return 3 * flappyFrequency * flappyAmplitude
  }
}

struct Penguin: Bird {
  let name: String
  let canFly = false
}

struct SwiftBird: Bird, Flyable {
  var name: String { return "Swift \(version)" }
  let version: Double

  // Swift is FAST!
  var airspeedVelocity: Double { return 2000.0 }
}

//: > One of the benefits of protocol extensions over base classes is that you can define default behavior for any type, not just classes. In this case, the `Bird` and `Flyable` protocols are conformed to an `enum`.

enum UnladenSwallow: Bird, Flyable {
  case African
  case European
  case Unknown

  var name: String {
    switch self {
    case .African:
      return "African"
    case .European:
      return "European"
    case .Unknown:
      return "What do you mean? African or European?"
    }
  }

  var airspeedVelocity: Double {
    switch self {
    case .African:
      return 10.0
    case .European:
      return 9.9
    case .Unknown:
      fatalError("You are thrown from the bridge of death!")
    }
  }
}

//: > This extension on `CollectionType` defines a function that returns every `skip`th element in the collection, starting with the first. Because it is a protocol extension, it will be available to any `CollectionType`.

extension CollectionType {
  func skip(skip: Int) -> [Generator.Element] {
    guard skip != 0 else { return [] }

    var index = self.startIndex
    var result: [Generator.Element] = []
    var i = 0
    repeat {
      if i % skip == 0 {
        result.append(self[index])
      }
      index = index.successor()
      i++
    } while (index != self.endIndex)

    return result
  }
}

//: > The extension was defined on `CollectionType`, which is a protocol `Array` conforms to.
//: > Other types, such as `Set` and `Range` are `CollectionType` as well.

let bunchaBirds: [Bird] =
[UnladenSwallow.African,
  UnladenSwallow.European,
  UnladenSwallow.Unknown,
  Penguin(name: "King Penguin"),
  SwiftBird(version: 2.0),
  FlappyBird(name: "Felipe", flappyAmplitude: 3.0, flappyFrequency: 20.0)]

bunchaBirds.skip(3)

//: > Now, `UnladenSwallow.African` can be passed as the sole argument to an `if` statement.
//: > Because swallows can fly, this evaluates to true.

if UnladenSwallow.African {
  print("I can fly!")
} else {
  print("Guess I’ll just sit here :[")
}

//: > In Swift 2, `map` is defined as an extension on `CollectionType` and not individually on each `CollectionType` conformer. Now that it is an extension, it can be used on generic functions where the type is simply specified as a `CollectionType`

func topSpeed<T: CollectionType where T.Generator.Element == Flyable>(c: T) -> Double {
 	 return c.map { $0.airspeedVelocity }.reduce(0) { max($0, $1) }
}

let flyingBirds: [Flyable] = [UnladenSwallow.African, UnladenSwallow.European, SwiftBird(version: 2.0)]

topSpeed(flyingBirds) // 2000.0





