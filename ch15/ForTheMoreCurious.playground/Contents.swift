//: Playground - noun: a place where people can play

import Cocoa

// type method example
// use static for structs and enums, class for classes
struct Square {
    static func numberOfSides() -> Int {
        return 4
    }
}

print(Square.numberOfSides())

// function currying
func greetName(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}
print(greetName("Don", withGreeting: "Good morning,"))

func greetingForName(name: String) -> ((String) -> String) {
    func greeting(greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    return greeting
}

let greeterFunction = greetingForName("Matt")
let theGreeting = greeterFunction("Hello,")
print(theGreeting)

// swift currying syntax
func greeting(greeting: String)(_ name: String) -> String {
    return "\(greeting) \(name)"
}

let friendlyGreeting = greeting("Hai,")
let newGreeting = friendlyGreeting("Chris")
print(newGreeting)

struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changeName(fn: String, ln: String) {
        firstName = fn
        lastName = ln
    }
}

var p = Person()
let changer = Person.changeName
print(p)
p.changeName("John", ln: "Johnson")
print(p)
changer(&p)("Matt", ln: "Mathias")
print(p)
