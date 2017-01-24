//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let answer = 42
func whatIsTheAnswer() -> Int{
    return answer
}


func g(_ a:Int) -> Int{
    return a + 3
}

let gg = {(a:Int) -> Int in return a + 3}

g(1)
gg(1)


let nums = [1,2,3,4,5,6,7,8,9,10]

let transformed = nums.map({$0 - 1})
transformed
