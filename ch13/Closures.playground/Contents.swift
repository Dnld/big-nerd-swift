//: Playground - noun: a place where people can play

import Cocoa

// mental model: think which one do I want to come first?
// when ascending, you want the smaller one to come first, so return it
// when descending, you want the larger one to come first, so return it
func sortAscending(a: Int, b: Int) -> Bool {
    return a < b
}

func sortDescending(a: Int, b: Int) -> Bool {
    return a > b
}

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

//let sortedVolunteerCounts = volunteerCounts.sort(sortAscending)
//let sortedVolunteerCounts = volunteerCounts.sort({
//    (a: Int, b: Int) -> Bool in
//    return a < b
//    })

//let sortedVolunteerCounts = volunteerCounts.sort({a, b in a < b})

//let sortedVolunteerCounts = volunteerCounts.sort({$0 < $1})

// trailing closure syntax
let sortedVolunteerCounts = volunteerCounts.sort {$0 < $1}

print(sortedVolunteerCounts)

// type: () -> ((Int, Int) -> Int)
//func makeTownGrand() -> ((Int, Int) -> Int) {
//    func buildRoads(addLights: Int, toLights: Int) -> Int {
//        return addLights + toLights
//    }
//    return buildRoads
//}

func makeTownGrand(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(addLights: Int, toLights: Int) -> Int {
            return addLights + toLights
        }
        return buildRoads
    } else {
        return nil
    }
}

func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

//let townPlan = makeTownGrand()
//stopLights = townPlan(4, stopLights)
//print("The town now has \(stopLights) stop lights.")

var stopLights = 4
if let townPlan = makeTownGrand(10001, condition: evaluateBudget) {
    stopLights = townPlan(4, stopLights)
}
print("The town has \(stopLights) stop lights.")

func makeGrowthTracker(growth: Int) -> (() -> Int) {
    var totalGrowth = 0
    func growthTracker() -> Int {
        totalGrowth += growth
        return totalGrowth
    }
    return growthTracker
}

var townPopulation = 54234
let growBy500 = makeGrowthTracker(500)
growBy500()
growBy500()
growBy500()
// closures are reference types
let anotherGrowBy500 = growBy500
anotherGrowBy500()
anotherGrowBy500()

let growBy100000 = makeGrowthTracker(100000)
townPopulation += growBy100000()
townPopulation += growBy500()
print("The town's population is \(townPopulation).")