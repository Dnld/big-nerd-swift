//: Playground - noun: a place where people can play

import Cocoa

//var groceryBag = Set<String>()
//groceryBag.insert("Apples")
//groceryBag.insert("Oranges")
//groceryBag.insert("Pineapple")

//var groceryBag = Set(["Apples", "Oranges", "Pineapple"])
var groceryBagAndANumber: Set = ["Apples", "Oranges", "Pineapples", 5]

print(groceryBagAndANumber)

for element in groceryBagAndANumber {
    print(element)
}

// contaisn returns a Bool
print(groceryBagAndANumber.contains("Apples"))

var anotherSet: Set = ["Apples", 5, "Spinach", "Rice", 15]
// union returns a set of unique elements
var combined = groceryBagAndANumber.union(anotherSet)
print(combined)

// intersect returns a set of elements that are in both
var inBoth = groceryBagAndANumber.intersect(anotherSet)
print(inBoth)

print(groceryBagAndANumber.isDisjointWith(anotherSet))

// cities bronze challenge
let myCities: Set = ["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"]
let yourCities: Set = ["Chicago", "San Francisco", "Jacksonville"]

print(yourCities.isStrictSubsetOf(myCities))
print(myCities.isStrictSupersetOf(yourCities))


// silver sets challenge
var groceryBagAndANumberRedux: Set = ["Apples", "Oranges", "Pineapples", 5]
var anotherSetRedux: Set = ["Apples", 5, "Spinach", "Rice", 15]

// can untersect and join in place
//groceryBagAndANumber.intersectInPlace(anotherSetRedux)
groceryBagAndANumber.unionInPlace(anotherSetRedux)
print(groceryBagAndANumber)

