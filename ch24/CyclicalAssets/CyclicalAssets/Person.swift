//
//  Person.swift
//  CyclicalAssets
//
//  Created by Donald Steinert on 1/26/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    var assets = [Asset]()
    let accountant = Accountant()
    
    var description: String {
        return "Person \(name)"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangeHandler = {
            [weak self] netWorth in
            self?.netWorthDidChange(netWorth)
            return
        }
    }
    
    func takeOwnershipOfAssets(asset: Asset) {
        asset.owner = self
        assets.append(asset)
    }
    
    func netWorthDidChange(netWorth: Double) {
        print("The net worth of \(self) is \(netWorth)")
    }
    
    deinit {
        print("\(name) has been deallocated")
    }
}
