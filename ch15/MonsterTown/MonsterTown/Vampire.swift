//
//  Vampire.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/16/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

class Vampire: Monster {
    static var vampires = [Vampire]()
    
    override func terrorizeTown() {
        if town?.population >= 1 {
            town?.changePopulation(-1)
            Vampire.vampires.append(Vampire())
        }
        super.terrorizeTown()
    }
    
}
