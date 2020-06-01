import UIKit

/** 변수 **/
var name = "Swift" // string
var year = 2020 // int
var valid = false // boolean

var x = 0, y = 0.0, z = 0.00

dump([name, year, valid])
print([name, year, valid])

// 기존 변수 변경
name = "Python"
print(name)

var another = name
print(another)
another = "C++"
print(name, another)

// 아무리 변수라도 타입 변경은 불가
// x = "hi"
