import UIKit

// 클로저 문법
/*
 { (매개변수 목록) -> 반환타입 in
    실행코드
 */

// 클로서 사용
/*
 let sum: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a + b
 }
 let sumResult: Int = sum(1, 2)
 print(sumResult) // 3
 */

let add: (Int, Int) -> Int
add = { (a: Int, b: Int) in
    return a + b
}

let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) in
    return a / b
}

let multiply: (Int, Int) -> Int
multiply = { (a: Int, b: Int) in
    return a * b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)
print(calculated) // 60

calculated = calculate(a: 50, b: 10, method: substract)
print(calculated) // 40

calculated = calculate(a: 50, b: 10, method: divide)
print(calculated) // 5

calculated = calculate(a: 50, b: 10, method: multiply)
print(calculated) // 500



// 따로 클로저를 상수/변수에 넣어 전달하지 않고 함수를 호출할 때 클로저를 작성하여 전달할 수도 있다.
/*
calculated2 = calculated(a: 50, b: 10, method({ (left: Int, right: Int) -> Int in
    return left * right
}))

print(calculated2)
*/
