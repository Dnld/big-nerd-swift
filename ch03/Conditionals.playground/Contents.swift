//: Playground - noun: a place where people can play

import Cocoa

var population: Int = 154222
var message: String
var hasPostOffice: Bool = false

if population < 10000 {
    message = "\(population) is a small town"
} else if population >= 10000 && population < 50000 {
    message = "\(population) is a medium town"
} else if population >= 50000 && population < 120000{
//    if population >= 10000 && population < 50000 {
//        message = "\(population) is a medium town"
//    } else {
    message = "\(population) is a pretty big town"
//    }
} else {
    message = "\(population) is a very big town"
}

//message = population < 10000 ? "\(population) is a small town" : "\(population) is a pretty big town"

print(message)

if !hasPostOffice {
    print("Where do we buy stamps?")
}
