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

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
let abEqual = (a == b)
print(abEqual)
print(a != b)

let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

print(c == d)
print(c < d)
