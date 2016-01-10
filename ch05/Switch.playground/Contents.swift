// Playground - noun: a place where people can play

import Cocoa

//var aValue = 3
//
//switch aValue {
//case 1:
//    print("the value is 1")
//case 2:
//    print("the value is 2")
//default:
//    print("the value is neithe 1 nor 2")
//}

var statusCode: Int = 404
var errorString: String = "The request failed with the error: "
//print(errorString)
//switch statusCode {
//case 400:
//    errorString = "Bad request"
//case 401:
//    errorString = "Unauthorized"
//case 403:
//    errorString = "Forbidden"
//case 404:
//    errorString = "Not found"
//default:
//    errorString = "None"
//case 400, 401, 402, 403, 404:
//    errorString = "There was something wrong with the request. "
//    fallthrough
//default:
//    errorString += "Please review the request and try again."
//}

switch statusCode {
case 100, 101:
//    errorString += "Informational, 1xx."
    errorString += "Informational, \(statusCode)."
case 204:
    errorString += "Successful but no content, 204."
case 300...307:
//    errorString += "Redirection, 3xx."
    errorString += "Redirection, \(statusCode)."
case 400...417:
//    errorString += "Client error, 4xx."
    errorString += "Client error, \(statusCode)."
case 500...505:
//    errorString += "Server error, 5xx."
    errorString += "Server error, \(statusCode)."
//default:
//    errorString += "Unknown. Please review the request and try again."
//case let unknownCode:
//    errorString = "\(unknownCode) is not a known error code."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    errorString += "\(unknownCode) is not a known error code."
default:
    errorString = "Unexpected error encountered."
}

let error = (code: statusCode, error: errorString);
print(error.error)

let firstErrorCode = 200
let secondErrorCode = 404
let errorCodes = (firstErrorCode, secondErrorCode)
switch errorCodes {
case (404, 404):
    print("No items found.")
case (404, _):
    print("First item not found.")
case (_, 404):
    print("Second item not found.")
default:
    print("All items found.")
}

// if-case
var age = 31
if case 18...35 = age where age >= 21 {
    print("In cool demographic and of drinking age.")
}



