//
//  main.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/15/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

var myTown = Town()
//print("Population: \(myTown.population), number of stop lights \(myTown.numberOfStopLights)")
myTown.changePopulation(500)
//myTown.printTownDesctiption()
//let gm = Monster()
//gm.town = myTown
//gm.terrorizeTown()
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.changeName("Fred", walksWithLimp: true)
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDesctiption()