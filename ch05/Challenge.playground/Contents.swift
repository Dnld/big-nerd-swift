//: Playground - noun: a place where people can play

import Cocoa

let point = (x: 1, y: -4)
switch point {
case let q1 where point.x > 0 && point.y > 0:
    print("\(q1) is in quadrant 1")
case let q2 where point.x < 0 && point.y > 0:
    print("\(q2) is in quadrant 2")
case let q3 where point.x < 0 && point.y < 0:
    print("\(q3) is in quadrant 3")
case let q4 where point.x > 0 && point.y < 0:
    print("\(q4) is in quadrant 4")
case (0, 0):
    print("\(point) is at the center")
case (_, 0):
    print("\(point) is on the x-axis")
case (0, _):
    print("\(point) is on the y-axis")
default:
    print("Case not covered")
}
