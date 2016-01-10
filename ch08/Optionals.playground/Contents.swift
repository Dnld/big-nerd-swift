//: Playground - noun: a place where people can play

import Cocoa

// optional with the type string
var errorCodeString: String?
//errorCodeString = "404"
print(errorCodeString)

//if errorCodeString != nil {
//    // forced unwrapping after you are sure the optional string has a value
//    let theError = errorCodeString!
//    print(theError)
//}

// optional binding to a temporary constant
//if let theError = errorCodeString {
//    if let errorCodeInteger = Int(theError) {
//        print("\(theError): \(errorCodeInteger)")
//    } else {
//        print(theError)
//    }

// can unwrap many optionals within a single line to avoid hairy nesting
// you can also add a where clause to the conditional
if let theError = errorCodeString, errorCodeInteger = Int(theError) where errorCodeInteger == 404 {
    print("\(theError): \(errorCodeInteger)")
} else {
    print("error code string does not have a value")
}

// forced unwrapping of a nil optional
//var nilOptionalString: String?
//print(nilOptionalString!)

// optional chaining
var errorDescripton: String?
if let theError = errorCodeString, errorCodeInteger = Int(theError) where errorCodeInteger == 404 {
    errorDescripton = ("\(errorCodeInteger + 200): the requested resource was not found")
}

var upCaseErrorDescription = errorDescripton?.uppercaseString
upCaseErrorDescription?.appendContentsOf(". PLEASE TRY AGAIN.")
//if let upCaseErrorDescriptionString = upCaseErrorDescription {
//    print(upCaseErrorDescriptionString)
//} else {
//    print("No error")
//}
var message = upCaseErrorDescription ?? "No error"
print(message)

