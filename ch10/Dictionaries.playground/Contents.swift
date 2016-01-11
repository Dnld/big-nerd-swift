//: Playground - noun: a place where people can play

import Cocoa

// var testDictionary: Dictionary<String, Int> = [:]
// var testDictionary = Dictionary<String, Int>()
// var testDictionary: [String: Int] = [:]
// var testDictionary = [String:Int]()

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
print("I have rated \(movieRatings.count) movies")

// this becomes an optional
let darkoRating = movieRatings["Donnie Darko"]
if let rating = darkoRating {
    print(rating)
}
movieRatings["Dark City"] = 5
print(movieRatings)

//if let oldRating = movieRatings.updateValue(4, forKey: "Chungking Express") {
//    print("Rating for Chungking Express changed from \(oldRating) to \(movieRatings["Chungking Express"]!)")
//}

let oldRating: Int? = movieRatings.updateValue(4, forKey: "Chungking Express")
if let lastRating = oldRating, currentRating = movieRatings["Chungking Express"] {
    print("\(lastRating) changed to \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 3

var movieToRemove = "Dark City"
var oldValue = movieRatings[movieToRemove]
var removed: Int? = movieRatings.removeValueForKey(movieToRemove)
if let success = removed where success == oldValue {
    print("\(movieToRemove) removed successfully")
}

print(movieRatings)

// setting a value to nil also removes it
//movieRatings["Donnie Darko"] = nil
//print(movieRatings)

for (key, value) in movieRatings {
    print("\(key) has the rating \(value)")
}

// can isolate keys of values for iteration
for (_, value) in movieRatings {
    print("one of the movies has been rated \(value)")
}

for movie in movieRatings.keys {
    print("\(movie) has been rated")
}

var ratedMovies = Array(movieRatings.keys)
print(ratedMovies)

var newYork = ["New York": [12345, 34566, 43567], "Kings": [45673, 54678, 54235], "Queens": [234567, 43456, 34356]]
var zips = [Int]()
for value in newYork.values {
    zips += value
}

print("New York has the following zip codes: \(zips)")
