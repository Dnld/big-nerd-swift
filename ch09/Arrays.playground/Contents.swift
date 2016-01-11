//: Playground - noun: a place where people can play

import Cocoa

var bucketList = ["Climb Mt. Everest"]

//bucketList.append("Fly hot air balloon to Fiji")
//bucketList.append("Watch the Lord of the Rings Trilogy in one day")
//bucketList.append("Go on a walkabout")
//bucketList.append("Scuba dive in the Great blue hole")
//bucketList.append("Find a triple rainbow")

var newItems = [
                    "Fly hot air balloon to Fiji",
                    "Watch the Lord of the Rings trilogy in one day",
                    "Go on a walkabout",
                    "Scuba dive in the Great Blue Hole",
                    "Find a triple rainbow"
                ]

//for item in newItems {
//    bucketList.append(item)
//}

bucketList += newItems

print(bucketList)
bucketList.removeAtIndex(2)
print(bucketList)
print(bucketList.count)
print(bucketList[4])
print(bucketList[0...2])
bucketList[2] += " in Australia"
print(bucketList[0...2])
bucketList[0] = "Climb Mt. Kilimanjaro"
print(bucketList[0])
print(bucketList)

var testArray = ["Climb Mt. Kilimanjaro", "Fly hot air balloon to Fiji", "Go on a walkabout in Australia", "Scuba dive in the Great Blue Hole", "Find a triple rainbow"]
var differentOrder = ["Climb Mt. Kilimanjaro", "Fly hot air balloon to Fiji", "Go on a walkabout in Australia", "Find a triple rainbow", "Scuba dive in the Great Blue Hole"]

print(bucketList == testArray)
print(bucketList == differentOrder)

// immutable arrays
var lunches = ["Cheesburger",
               "Veggie Pizza",
               "Chicken Caesar Salad",
               "Black Bean Burrito",
               "Falafel Wrap"
              ]

//lunches.append("nothing")

var test = "Cheesburger"
print(lunches.contains(test))

// reverse array in place
var start = 0
var end = lunches.count - 1
while end > start {
    var temp = lunches[start]
    lunches[start++] = lunches[end]
    lunches[end--] = temp
}

print(lunches)
