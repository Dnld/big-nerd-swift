//
//  Zombie.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/16/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

class Zombie: Monster {
//    var walksWithLimp = true
    var walksWithLimp: Bool
//    private(set) var isFallingApart = false
    var isFallingApart: Bool
    override class var spookyNoise: String {
        return "Brains..."
    }

    init?(limp: Bool, isFallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        self.isFallingApart = isFallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init?(limp: Bool, isFallingApart: Bool) {
        self.init(limp: limp, isFallingApart: isFallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee.")
        }
    }

    convenience required init?(town: Town?, monsterName: String) {
//        walksWithLimp = false
//        isFallingApart = false
//        super.init(town: town, monsterName: monsterName)
        self.init(limp: false, isFallingApart: false, town: town, monsterName: monsterName)
    }

    required init?(town: Town?, monsterName: String?) {
        fatalError("init(town:monsterName:) has not been implemented")
    }
    
    final override func terrorizeTown() {
        // this is optional chaining
        if !isFallingApart {
            if town?.population >= 10 {
                town?.changePopulation(-10)
            } else {
                let amountToKill = town?.population
                town?.changePopulation(-amountToKill!)
            }
            town?.mayor?.notifyOfZombieAttack()
        }
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
    
    deinit {
        print("\(name) is no longer with us.")
    }
}
