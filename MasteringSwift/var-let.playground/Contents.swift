import UIKit
/*:
 # Variables
 ## Syntax
 ![Variables Syntax](syntax-var.png)
 var variableName = initialValue
 */
// 새로 선언하는 변수라 var 키워드가 있음
var name = "Swift"
var year = 2020
var valid = true // false

var x = 0.0, y = 0.0, z = 0.0

name // 표현식
print(name)
print(year)
print(valid)
print(x)
print(y)
print(z)
/*:
 ## Syntax
 ![Variables Syntax](syntax-var-new-value.png)
 variableName = initialValue
 */
// 이미 선언되어 있는 값을 수정하는 거라 var 키워드가 없음
name = "Steve"
name = "yoonar"
print(name)



var anotherName = name
anotherName = "Tim"

print(name, anotherName)

/*:
 # Constants
 ## Syntax
 ![Variables Syntax](syntax-let.png)
 let variableName = initialValue
 */
// 상수 let
let name2 = "yoonar"
name2

// swift 는 상수를 주로 사용한다.
// 상수 선호이유
// 1. 실수로 값을 변경하는 오류가 없다.
// 2. 컴파일러가 별도의 최적화를 하여 코드가 빠르게 실행됨
// 일단 상수로 선언했다가 값을 변경해야할 때 변수로 변경하도록 한다.
