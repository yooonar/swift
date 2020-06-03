import UIKit

// optional
let num1: Int // num1 은 nil 이지만 int 형임을 명시해줌

let num2: Int = 0
print(num2)

let num3: Float = 0
print(num3)


let optionalNum: Int? = nil // optional int
let str: String? = nil // optional string

let a: Int? = nil
let b = a

// forced unwrapping 을 해주려면 ! 를 붙여주면 된다.
// 그치만 nil 로 저장된 값은 forced wrapping하면 fatal error 가 발생하기 때문에 if문으로 값이 있는 지 확인해주는 작업이 필요하다.
if b != nil {
    print(b!)
}
var num: Int? = nil // optional int
if num != nil {
    print(num!)
}

num = 123
print(num!)

let n = 123
print(n)

var num4: Int? = nil
num4 = 123

// unforced wrapping은 after 처럼 !를 붙여주면 optional int 에서 int 타입으로 바뀐다.
let before = num4
let after = num4!
print(type(of: before))
print(type(of: after))
