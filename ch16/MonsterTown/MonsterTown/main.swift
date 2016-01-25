//
//  main.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/15/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

//var myTown = Town()
var myMayor = Mayor()
var myTown = Town(region: "South", mayor: myMayor, population: 0, stopLights: 5)
//print(myMayor.anxietyLevel)
//myTown.mayor = myMayor
print(myTown?.townSize)
myTown?.changePopulation(100000)
print(myTown?.townSize)
//print("Population: \(myTown.population), number of stop lights \(myTown.numberOfStopLights)")
myTown?.changePopulation(500)
//myTown.printTownDesctiption()
//let gm = Monster()
//gm.town = myTown
//gm.terrorizeTown()
var fredTheZombie: Zombie? = Zombie(limp: false, isFallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.town = myTown
fredTheZombie?.changeName("Fred", walksWithLimp: true)
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printTownDesctiption()
print(Zombie.spookyNoise)

if Zombie.isTerrifying {
    print("Run away!")
}

let convenientZombie = Zombie(limp: true, isFallingApart: true)
let requiredZombie = Zombie(town: myTown, monsterName: "Al")

let myVampire = Vampire(town: myTown, monsterName: "Joe")
myVampire.town = myTown
myVampire.terrorizeTown()
myVampire.terrorizeTown()
myTown?.printTownDesctiption()
//print(myVampire.vampires)

print("victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print("victim pool: \(fredTheZombie?.victimPool)")

fredTheZombie = nil
