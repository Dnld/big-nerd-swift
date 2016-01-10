//: Playground - noun: a place where people can play

import Cocoa

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"
print(mutablePlayground)

for c: Character in mutablePlayground.characters {
    print("'\(c)'")
}

// unicode scalar creation syntax
let oneCoolDude = "\u{1F60E}"
print(oneCoolDude)
let aAccent = "\u{0061}\u{0301}"
print(aAccent)
let aAccentPrecomposed = "\u{00E1}"
print(aAccentPrecomposed)

let a = aAccent == aAccentPrecomposed
print(a)
let b = aAccent.unicodeScalars.count == aAccentPrecomposed.unicodeScalars.count
print(b)
let c = aAccent.characters.count == aAccentPrecomposed.characters.count
print(c)

//for scalar in playground.unicodeScalars {
//    print(scalar.value)
//}

let fromStart = playground.startIndex
let toPosition = 4
let end = fromStart.advancedBy(toPosition)
let fifthCharacter = playground[end]
print(fifthCharacter)
let sixthIndex = playground.startIndex.advancedBy(5)
let sixthCharacter = playground[sixthIndex]
print(sixthCharacter)
let sixthCharacterRexux = playground[playground.startIndex.advancedBy(5)]
print(sixthCharacterRexux)

let startOfWord = playground.startIndex
let endOfWord = startOfWord.advancedBy(4)
let range = startOfWord...endOfWord
let firstWord = playground[range]
print(firstWord)
let firstWordRedux = playground[playground.startIndex...playground.startIndex.advancedBy(4)]
print(firstWordRedux)

