//: Playground - noun: a place where people can play

import Cocoa

for _ in 1...5 {
    for case let i in 0...100 where i % 2 == 0 {
        print(i)
    }
}
