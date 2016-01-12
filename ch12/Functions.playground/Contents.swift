//: Playground - noun: a place where people can play

import Cocoa

func printGreeting() {
    print("Hello, playground.")
}
printGreeting()

func printPersonalGreetint(name: String) {
    print("Hello, \(name).")
}
printPersonalGreetint("Don")

//func divisionDescription(num: Double, den: Double) {
//    print("\(num) divided by \(den) is \(num / den)")
//}
//divisionDescription(4.5, den: 323.4234)

func divisionDescription(forNumerator num: Double,
                       andDenominator den: Double,
                      withPuncuation punc: String = "." ) {
    print("\(num) divided by \(den) is \(num / den)\(punc)")
}
divisionDescription(forNumerator: 4.23423, andDenominator: 345353.435345345)
divisionDescription(forNumerator: 42342.3412, andDenominator: 2343243, withPuncuation: "!")

func printPersonalGreetings(names: String...) {
//    print(names)
    for name in names {
        print("Hello, \(name).")
    }
}
printPersonalGreetings("Don", "Brian", "Matt")

var stringToChange = "To this string I wil add:"
func appendString(string: String, inout toString original: String) {
    original += " \(string)"
}
appendString("Hello, world!", toString: &stringToChange)
print(stringToChange)

func returnPersonalGreeting(name: String) -> String {
    return "Hello, \(name)."
}

let returnedGreeting = returnPersonalGreeting("Don")
print(returnedGreeting)

// nested functions
let valueOutside = 5
func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        print("Value outside: \(valueOutside)")
        return numerator / 2
    }
    return divide()
}
let areaOfT = areaOfTriangle(withBase: 4.5, andHeight: 3.7)
print(areaOfT)

func sortEvenOdds(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}
var sorted = sortEvenOdds([1,2,3,4,5,6,7,8,9])
print(sorted.evens)
print(sorted.odds)

// optional returns
func grabMiddleName(name:(String, String?, String)) -> String? {
    return name.1
}
//let middleName = grabMiddleName(("Robert", nil, "Moses"))
let middleName = grabMiddleName(("Robert", "Henry", "Moses"))
if let name = middleName {
    print("The middle name is: \(name)")
} else {
    print("There is no middle name")
}

// making use of a guard statement
func greetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    print("Hey, \(middleName)")
}
greetByMiddleName(("Robert", "Henry", "Moses"))
greetByMiddleName(("Robert", nil, "Moses"))

