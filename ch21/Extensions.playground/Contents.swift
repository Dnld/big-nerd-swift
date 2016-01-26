//: Playground - noun: a place where people can play

import Cocoa

typealias Velocity = Double
extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self }
}

protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatbed: Bool { get }
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0,
                "New value must be between 1 and 1")
        }
    }
}

// an extension to conform to the vehicle protocol
extension Car: VehicleType {
    var topSpeed: Velocity { return 180 }
    var numberOfDoors: Int { return 4 }
    var hasFlatbed: Bool { return false }
}

// extension to car to add an init method
extension Car {
    init (carMake: String, carModel: String, carYear: Int) {
        self.init(make: carMake,
            model: carModel,
            year: carYear,
            color: "Black",
            nickname: "N/A",
            gasLevel: 1.0)
    }
}

var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013)
print(c.topSpeed.kph)

extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
            case .Sedan:
                return "Sedan"
            }
        }
    }
    
    var kind: CarKind {
        switch numberOfDoors {
        case 2:
            return .Coupe
        default:
            return .Sedan
        }
    }
}
print(c.kind.description)

extension Car {
    mutating func emptyGas(amount: Double) {
        precondition(amount <= 1 && amount > 0 && amount < gasLevel,
            "Invalid amount")
        gasLevel -= amount
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

print(c.gasLevel)
c.emptyGas(0.5)
print(c.gasLevel)
c.fillGas()
print(c.gasLevel)
