//: Playground - noun: a place where people can play

import Cocoa

enum TextAlignment: Int {
    case Left = 20
    case Right = 30
    case Center = 40
    case Justify = 50
}

var alignment: TextAlignment = TextAlignment.Left
print(alignment)
// ther is type inference
var alignmentRedux = TextAlignment.Left
print(alignmentRedux)

alignment = .Right

//if alignment == .Right {
//    print("We should align the text right.")
//}

switch alignment {
case .Left:
    print("We should align the text left")
case .Right:
    print("We should align the text right")
case .Center:
    print("We should align the text center")
case .Justify:
    print("We should justify the text")
}

// these are th raw values
print("Left has a raw value of \(TextAlignment.Left.rawValue)")
print("Right has a raw value of \(TextAlignment.Right.rawValue)")

let myRawValue = 20

if let myAlignment = TextAlignment(rawValue: myRawValue) {
    print("success")
    print(myAlignment.rawValue)
    print(myAlignment.hashValue)
    if myAlignment == TextAlignment.Left {
        print("equal to .Left")
    }
} else {
    print("conversion failed")
}

// there are default raw values when the enum is a string
enum ProgrammingLanguage: String {
//    case Swift = "Swift"
    case Swift
    case ObjectiveC = "Objective-C"
    case C = "C"
    case Cpp = "C++"
    case Java = "Java"
}

let myFavoriteLanguage = ProgrammingLanguage.Swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")

enum LightBulb {
    case On
    case Off
    
    func surfaceTempForAmbientTemp(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

var bulb = LightBulb.On
var ambientTemp = 77.0

var surfaceTemp = bulb.surfaceTempForAmbientTemp(ambientTemp)
print("The surface temp of the bulb is \(surfaceTemp)")

bulb.toggle()
surfaceTemp = bulb.surfaceTempForAmbientTemp(ambientTemp)
print("The surface temp of the bulb is \(surfaceTemp)")

// enums can have associated values
enum ShapeDimensions {
    case Square (side: Double)
    case Rectangle (height: Double, width: Double)
    case Point
    
    func area() -> Double {
        switch self {
        case let .Square(side: s):
            return s * s
        case let .Rectangle(height: h, width: w):
            return w * h
        case .Point:
            return 0
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case let .Square(side: s):
            return s * 4
        case let .Rectangle(height: h, width: w):
            return (h * 2) + (w * 2)
        case .Point:
            return 0
        }
    }
}

var square = ShapeDimensions.Square(side: 15.0)
var rectangle = ShapeDimensions.Rectangle(height: 10, width: 20)
var point = ShapeDimensions.Point
print("square's area is \(square.area())")
print("rectangle's area is \(rectangle.area())")
print("point's area is \(point.area())")
print("square's perimeter is \(square.perimeter())")
print("rectangle's perimeter is \(rectangle.perimeter())")
print("point's perimeter is \(point.perimeter())")

// recursive enums
enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent (name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents (fatherName: String, fatherAncestors: FamilyTree,
        motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.TwoKnownParents(
    fatherName: "Fred Sr.", fatherAncestors: .OneKnownParent(name: "Beth", ancestors: .NoKnownParents),
    motherName: "Marsha", motherAncestors: .NoKnownParents)
