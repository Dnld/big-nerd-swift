//: Playground - noun: a place where people can play

import Cocoa

//for i in 1...10 {
//    print(i)
//}

var myFirstInt: Int = 0

// for-case
//for case let i in 1...100 where i % 3 == 0 {
//    print(i)
//}

//for i in 1...100 {
//    if i % 3 == 0 {
//        print(i)
//    }
//}

//for _ in 1...5 {
//    ++myFirstInt
//    print(myFirstInt)
////    print("myFirstInt equals \(myFirstInt) at iteration \(i).")
//}

//for var i = 1; i <= 5; i++ {
//    print(i)
//}

//var i = 1
//while i <= 5 {
//    print(i)
//    i++
//}

//repeat {
//    print(i)
//    i++
//} while i <= 5

var shields = 5
var blasterOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0

while shields > 0 {
    
    if spaceDemonsDestroyed == 500 {
        print("You won!")
        break
    }
    
    if blasterOverheating {
        print("Blasters are overheating. Cooldown initiated.")
        sleep(5)
        print("Blasters are ready to fire")
        sleep(1)
        blasterOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blasterOverheating = true
        continue
    }
    
    print("Fire blasters.")
    ++blasterFireCount
    if blasterFireCount % 3 == 0 {
        spaceDemonsDestroyed++
    }
}







