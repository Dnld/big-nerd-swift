//
//  Mayor.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/19/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

struct Mayor {
    private var anxietyLevel = 0
    
    mutating func notifyOfZombieAttack() {
        anxietyLevel++
    }
    
    func logSympathy() {
        print("I am deeply saddened to hear about this latest tragedy.  I promise that my office is looking into the nature of this rash of volience.")
    }
}
