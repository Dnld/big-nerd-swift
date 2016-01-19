//
//  Town.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/16/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

class Town {
    static let region = "South"
    var mayor: Mayor?
    var population = 5422 {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("the population has changed to \(population) from \(oldPopulation)")
                mayor?.logSympathy()
            }
        }
    }
    var numberOfStopLights = 4
    
    enum Size {
        case Small
        case Medium
        case Large
    }
    
//    lazy var townSize: Size = {
//        switch self.population {
//        case 0...10000:
//            return Size.Small
//        case 10001...100000:
//            return Size.Medium
//        default:
//            return Size.Large
//        }
//    }()

    var townSize: Size {
        get {
            switch self.population {
            case 0...10000:
                return Size.Small
            case 10001...100000:
                return Size.Medium
            default:
                return Size.Large
            }
        }
    }
    
    func printTownDesctiption() {
        print("population: \(population); number of stop lights: \(numberOfStopLights)")
    }

    func changePopulation(amount: Int) {
        population += amount
    }
}