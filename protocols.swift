protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
    func isFromClass() -> Bool
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
    func isFromClass() -> Bool {
      return true
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    func isFromClass() -> Bool {
      return false
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

print(aDescription)
print(bDescription)
print(String(a.isFromClass()))
print(String(b.isFromClass()))

//////////////////////////////////////

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
    func isFromClass() -> Bool {
      return false
    }
}
print(7.simpleDescription)

extension Double {
  var absoluteValue: Double {
      if self < 0 {
        return -1 * self
      } else {
        return self
      }
    }
}
print((-7.034).absoluteValue)

/////////////////////////////////////

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// Prints "A very simple class.  Now 100% adjusted."
// print(protocolValue.anotherProperty)  // Uncomment to see the error
