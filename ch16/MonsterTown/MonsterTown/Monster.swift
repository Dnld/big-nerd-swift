//
//  Monster.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/16/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
//    var name = "Monster"
    var name: String?
    static let isTerrifying = true
    
    class var spookyNoise: String {
        return "Grrrr"
    }
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    required init?(town: Town?, monsterName: String?) {
        if monsterName == "" || monsterName == nil {
            return nil
        }
        name = monsterName
        self.town = town
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
