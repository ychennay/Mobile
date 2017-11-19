//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var newString = str + " time"

for character in newString.characters{
    print(character)
}

let newTypeString = NSString(string: newString)

NSString(string:newTypeString.substring(to: 17)).substring(from: 3)

newTypeString.contains("playground")

newTypeString.components(separatedBy: " ")
