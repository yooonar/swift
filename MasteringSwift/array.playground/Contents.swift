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

// 배열 리터럴을 사용하여 정수 배열을 선언 - 값이 있는 경우
let numbers = [1, 2, 3]

// 빈 리터럴 생성
// let emptyArray = [] ← Error!
// 배열의 자료형은 저장된 요소에 의해 추론되는데 빈 리터럴을 사용하는 경우 추론할 요소가 없기 때문에 에러가 발생한다.
// 빈 리터럴을 사용할 때는 형식 추론을 사용할 수 없고 자료형을 직접 선언해주어야 한다.  ← 변수명: [타입] Eg. emptyArray: [Int]
// error msg: Empty collection literal requires an explicit type.ㄴ
let emptyArray: [Int] = []

// 생성자를 사용하여 배열 선언 - 정식 문법
let emptyArray2 = Array<Int>()

// 생성자를 사용하여 배열 선언 - 단축 문법
let emptyArray3 = [Int]()


// 배열을 만든다음 기본 값 채우기. 이 때 repeating 생성자를 이용
// repeating: 배열을 채울 기본 값 전달
// count: 배열을 채울 요소의 숫자
// repeating = 0, count = 10 ← 기본 값 0이 10개가 채워진 배열
let zeroArray = [Int](repeating: 0, count: 10)
print(zeroArray)


/*:
 # Inspecting an Array
 배열에 저장된 요소의 숫자 확인
 */

// 배열 요소의 숫자 확인 Int로 타입으로 리턴
// 배열이 빈 값인지만 확인하려면 count 를 0인 경우로 체크할 수 있음 Eg. nums.count == 0
nums.count
numbers.count

// 빈 값 체크는 count 보다 보통 isEempty 함수를 사용하는게 더 좋다
nums.isEmpty
numbers.isEmpty
emptyArray.isEmpty
emptyArray2.isEmpty
emptyArray3.isEmpty


/*:
 # Accessing Elements
 ## 배열에 저장된 요소에 접근
    배열명[접근할 요소의 인덱스]
 */
let fruits = ["Apple", "Banana", "Melon"]

// 배열의 요소에 접근할 때는 subscript 문법을 사용

// 배열에 저장된 첫번째 요소에 접근
fruits[0]

// 배열에 저장된 마지막 요소에 접근
fruits[2]

// subscript로 특정 범위 전달
fruits[0...1]

// 속성으로 제공되는 인덱스를 사용하는 것이 안전
// startIndex 속성을 이용해 첫번째 요소에 접근
fruits[fruits.startIndex]

// endIndex 속성을 이용해 마지막 요소에 접근
// endIndex: 마지막 인덱스의 다음 인덱스
// index(before) 를 이용해 마지막 인덱스의 이전 인덱스를 구해야함
fruits[fruits.index(before: fruits.endIndex)]


/*:
 # subscript 를 사용하지 않고 속성에 접근하는 방법
 first, last의 장점
 subscript 에 비해 오류가 나지않아 안전함
 마지막 요소에 접근할 때 인덱스 연산이 필요없어 코드가 단순하다
 */

// first: String? ← 옵셔널 스트링. 배열에 첫번째 요소가 있다면 첫번째 요소 리턴, 비어있다면 nil 리턴
fruits.first
// last: String? ← 옵셔널스트링. 배열에 마지막 요소가 있다면 마지막 요소 리턴, 비어있다면 nil 리턴
fruits.last

// 비어있는 배열에서 사용
emptyArray.first
emptyArray.last

// subscript 를 사용하여 첫번째 요소에 접근
// 접근할 요소가 없기 때문에 에러 발생
// emptyArray[0] // error msg. Index out of range.
