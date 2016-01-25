//
//  Town.swift
//  MonsterTown
//
//  Created by Donald Steinert on 1/16/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation
struct Town {
    let region: String
    var mayor: Mayor?
    var population: Int {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("the population has changed to \(population) from \(oldPopulation)")
                mayor?.logSympathy()
            }
        }
    }
    var numberOfStopLights: Int
    
    init?(region: String, mayor: Mayor?, population: Int, stopLights: Int) {
        if population <= 0 {
            return nil
        }
        self.region = region
        self.mayor = mayor
        self.population = population
        numberOfStopLights = stopLights
    }
    
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
        print("population: \(population); number of stop lights: \(numberOfStopLights); region: \(region)")
    }

    mutating func changePopulation(amount: Int) {
        population += amount
    }
}
