//
//  Town.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/16/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

struct Town {
    var population = 5422
    var numberOfStopLights = 4
    
    func printTownDesctiption() {
        print("population: \(population); number of stop lights: \(numberOfStopLights)")
    }

    mutating func changePopulation(amount: Int) {
        population += amount
    }
}
