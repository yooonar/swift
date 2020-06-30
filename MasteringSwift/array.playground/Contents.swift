import UIKit

/*:
 # Array
 
 ## Array Literal
    [elem, elem, ... ]
 */


let nums = [1, 2, 3]
// num ← Int type

/*:
 ## Array Type
 Array 문법
 ### Array<T> ← 배열의 정식 문법
 ### [T] ← Int 배열의 단축 문법 표기
 */


// 문자열 배열 정식 문법
let strArray: Array <String>

// 문자열 배열 단축 문법
let strarray2: [String]



import Foundation
/*:
 # Array Basics
 ## Creating an Array
 배열 생성 방법: 리터럴을 사용하여 생성하는 방법
 */

// 배열 리터럴을 사용하여 정수 배열을 선언
let numbers = [1, 2, 3]

// 빈 리터럴 생성
// let emptyArray = [] Error!
// 배열의 자료형은 저장된 요소에 의해 지정되는데 빈 리터럴을 사용하는 경우 에러가 발생한다.
// error msg: Empty collection literal requires an explicit type.
// 이 때는 자료형을 직접 선언해준다 ← 변수명: [타입] Eg. emptyArray: [Int]
let emptyArray: [Int] = []

// 생성자를 사용하여 배열 선언 - 정식 문법
let emptyArray2 = Array<Int>()

// 생성자를 사용하여 배열 선언 - 단축 문법
let emptyArray3 = [Int]()


// 배열을 만든다음 기본 값 채우기 이 때 repeating 생성자를 이용
// repeating: 배열을 채울 기본 값 전달
// count: 배열을 채울 요소의 숫자
// repeating = 0, count = 10 ← 기본 값 0이 10개가 채워진 배열
let zeroArray = [Int](repeating: 0, count: 10)
print(zeroArray)


/*:
 # Inspecting an Array
 배열에 저장된 요소의 숫자 확인
 */
