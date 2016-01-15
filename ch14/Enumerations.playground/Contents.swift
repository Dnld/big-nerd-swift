//: Playground - noun: a place where people can play

import Cocoa

enum TextAlignment {
    case Left
    case Right
    case Center
    case Justify
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



