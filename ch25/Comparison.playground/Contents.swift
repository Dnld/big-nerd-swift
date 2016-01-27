//: Playground - noun: a place where people can play

import Cocoa

struct Point: Comparable {
    let x: Int
    let y: Int
}

func ==(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}

func <(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
}

func +(lhs: Point, rhs: Point) -> Point {
    return Point(x: (lhs.x + rhs.x), y: (lhs.y + rhs.y))
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
let abEqual = (a == b)
print(abEqual)
print(a != b)

let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

print(c == d)
print(c < d)

let cd = c + d
print(cd)

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let p1 = Person(name: "Joe", age: 19)
let p2 = Person(name: "Doug", age: 27)
var people = [p1, p2]
let location = people.indexOf() { $0.name == "Doug" }
print(location)

// custom operators
class newPerson {
    var name: String
    weak var spouse: newPerson?
    
    init(name: String, spouse: newPerson?) {
        self.name = name
        self.spouse = spouse
    }
}

let matt = newPerson(name: "Matt", spouse: nil)
let drew = newPerson(name: "Drew", spouse: nil)

infix operator +++ {}

func +++(lhs: newPerson, rhs: newPerson) {
    lhs.spouse = rhs
    rhs.spouse = lhs
}

matt +++ drew
print(matt.spouse?.spouse?.name)

