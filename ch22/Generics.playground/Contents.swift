//: Playground - noun: a place where people can play

import Cocoa

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        if items.count > 0 {
            return items.removeLast()
        } else {
            print("No items in stack")
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