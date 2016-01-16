//
//  Zombie.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/16/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

class Zombie: Monster {
    var walksWithLimp = true
    
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
    
    final override func terrorizeTown() {
        // this is optional chaining
        if town?.population >= 10 {
            town?.changePopulation(-10)
        } else {
            let amountToKill = town?.population
            town?.changePopulation(-amountToKill!)
        }
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}
