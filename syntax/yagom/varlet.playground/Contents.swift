import UIKit

/*:
 변수와 상수

 # 1. 상수, 변수 선언
 상수 선언 키워드: let
 변수 선언 키워드: var
 
 # 2. 상수의 선언
 let 이름: 타입 = 값
 
 # 3. 변수의 선언
 var 이름: 타입 = 값
 
 # 4. 값의 타입이 명확하다면 타입은 생략 가능하다.
 let 이름 = 값
 var 이름 값
 
 */

let constrant: String = "차후의 변경이 불가능한 상수 let"
var variable: String = "차후에 변경 가능한 변수 var"

variable = "변수는 이렇게 다른 값으로 변경 가능합니다."

print(constrant)
print(variable)


/*
 # 5. 상수 선언 후 나중에 값 할당하기
 나중에 할당하려고 하는 상수나 변수는 타입을 꼭 변경해주어야 한다.
*/

let sum: Int
let inputA: Int = 200
let inputB: Int = 300

// 선언 후 첫 할당
sum = inputA * inputB

// let 으로 선언한 후 할당한 경우에는 값을 다시 바꿀 수 없다.
// sum = 1

// 변수는 할당한 값을 변경할 수 있다.
var nickName: String

// print(nickName)
// Variable 'nickName' used before being initialized 에러 발생. 초기화하지 않고 print 찍으면 오류남

// 변수는 차후에 다시 다른 값을 할당해도 오류가 발생하지 않는다.
nickName = "yoonar"

print(nickName)
