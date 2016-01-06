//: Playground - noun: a place where people can play

import Cocoa

print("the maximum Int value is \(Int.max)")
print("the minimum Int value is \(Int.min)")
print("the maximum 32-bit Int value is \(Int32.max)")
print("the minimum 32-bit Int value is \(Int32.min)")

print("the maximum UInt value is \(UInt.max)")
print("the minimum UInt value is \(UInt.min)")
print("the maximum 32-bit UInt value is \(UInt32.max)")
print("the minimum 32-bit UInt value is \(UInt32.min)")

let numberOfPages: Int = 10
let numberOfChapters: Int = 3

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

//let firstBadValue: UInt = -1
//let secondBadValue: Int8 = 200

print(10 + 20)
print(30 - 5)
print(5 * 6)
print((10 + 2) * 5)
print(30 - (5 - 5))

print(11 / 3)
print(11 % 3)
print(-11 / 3)

var x = 10
x++
print("x has been incremented to \(x)")
x--
print("x has been decremented to \(x)")

x += 10
print("10 has been added to x and it is now equl to \(x)")

let y: Int8 = 120
let z = y &+ 10
print(z)

let a: Int16 = 200
let b: Int8 = 10
//let c = a + b
let c = a + Int16(b)

let d1 = 1.1
let d2: Double = 1.1
let f1: Float = 100.3

print(10.0 + 11.4)
print(11.0 / 3.0)
print(12.4 % 5.0)

if d1 == d2 {
    print("d1 and d2 are the same")
}

print("d1 + 0.1 is \(d1 + 0.1)")
if d1 + 0.1 == 1.2 {
    print("d1 is equal to 1.2")
}
