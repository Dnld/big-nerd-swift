//
//  main.swift
//  CyclicalAssets
//
//  Created by Donald Steinert on 1/26/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
print("created \(bob)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1500.00)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.00)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.00)

bob?.takeOwnershipOfAssets(laptop!)
bob?.takeOwnershipOfAssets(hat!)

print(laptop?.description)

bob = nil
print("the bob variable is now \(bob)")

laptop = nil
hat = nil
backpack = nil
