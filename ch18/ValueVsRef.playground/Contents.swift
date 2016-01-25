//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
var playgroundGreeting = str
print(str)
print(playgroundGreeting)

playgroundGreeting = "Yo!"

// only changes the value of playgroundGreeting. not str
print(str)
print(playgroundGreeting)

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate

print(hecate.name)
print(anotherHecate.name)

anotherHecate.name = "AnotherHecate"

print(hecate.name)
print(anotherHecate.name)

struct Pantheon {
    // this will blow up my code
    //    let chiefGod: GreekGod
    var chiefGod: GreekGod
    let dateCreated = NSDate()
}

let pantheon = Pantheon(chiefGod: hecate)
print(pantheon.chiefGod.name)

anotherHecate.name = "Hecate"

print(pantheon.chiefGod.name)

let zeus = GreekGod(name: "Zeus")

// results in an error -- cannot assign to a const -- an immutable instance
//pantheon.chiefGod = zeus

// but you can chage a mutable instance
var anotherPantheon = Pantheon(chiefGod: zeus)
print(anotherPantheon.chiefGod.name)
anotherPantheon.chiefGod = hecate
print(anotherPantheon.chiefGod.name)


print(zeus.name)
zeus.name = "Zeus Jr"
print(zeus.name)

print(pantheon.chiefGod.name)
let greekPantheon = pantheon
hecate.name = "Trivia"
print(greekPantheon.chiefGod.name)

print(greekPantheon.dateCreated)

let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]
for god in gods {
    print(god.name)
}
let godsCopy = gods
godsCopy.last?.name = "Jupiter"
print("*** names in gods ***")
for god in gods {
    print(god.name)
}
print("*** names in godsCopy ***")
for god in godsCopy {
    print(god.name)
}

// can test identity
print(athena === hecate)
print(hecate === anotherHecate)
