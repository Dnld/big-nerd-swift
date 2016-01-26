//: Playground - noun: a place where people can play

import Cocoa

struct StackGenerator<T>: GeneratorType {
    typealias Element = T
    
    var stack: Stack<T>
    
    mutating func next() -> Element? {
        return stack.pop()
    }
}

struct Stack<Element>: SequenceType {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        if items.count > 0 {
            return items.removeLast()
        } else {
            return nil
        }
    }
    
    // map only needs one placeholder type because we already have Element
    func map<U>(f: Element -> U) -> Stack<U> {
        var result = [U]()
        for item in items {
            result.append(f(item))
        }
        return Stack<U>(items: result)
    }
    
    func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

var stringStack = Stack<String>()
stringStack.push("hello")
stringStack.push("world")
print(stringStack.pop())
print(stringStack.pop())
print(stringStack.pop())

func myMap<T, U>(items: [T], f: (T) -> U) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings) { $0.characters.count }
print(stringLengths)

intStack.push(2)
intStack.push(3)

var doubleStack = intStack.map { $0 * 2 }
print(doubleStack.items)

func checkIfEqual<T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("1", 1))

func checkIfDescriptionMatches<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionMatches(Int(1), UInt(1)))
print(checkIfDescriptionMatches(1, 1.0))
print(checkIfDescriptionMatches(Float(1.0), Double(1.0)))

var myStack = Stack<Int>()
myStack.push(1)
myStack.push(5)
myStack.push(77)

var myStackGenerator = StackGenerator(stack: myStack)
while let value = myStackGenerator.next() {
    print(value)
}

for value in myStack {
    print(value)
}
