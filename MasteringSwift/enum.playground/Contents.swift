import UIKit

/*:
 # Enumerations 열거형
--------------------------------------------------------------------
⎟  -------------------   -------------------   ------------------- ⎟
⎟ ⎟ Enumeration Case ⎟  ⎟ Enumeration Case ⎟  ⎟ Enumeration Case ⎟ ⎟
⎟ ⎟        ↓         ⎟  ⎟        ↓         ⎟  ⎟         ↓        ⎟ ⎟
⎟ ⎟    Constrant     ⎟  ⎟    Constrant     ⎟  ⎟    Constrant     ⎟ ⎟
⎟  -------------------   -------------------   ------------------- ⎟
--------------------------------------------------------------------

 3개의 상수(Constrant)가 하나의 그룹으로 묶여있다.
 이렇게 연관된 상수들을 하나로 묶은 자료형을 열거형이라고 한다.
 열거형에 포함된 상수들은 상수라고 하지 않고 Enumeration Case 라고 부르며, 더 줄여서 Case 라고 부르기도 한다.
 열거형: 독립적인 자료형
 열거형에 포함된 케이스들도 독립적인 이름을 가지고 있다.
 
 ## 열거형을 사용하는 이유
 ### 코드의 가독성과 안정성이 높아짐
 */

/*:
 ## 열거형을 사용하지 않았을 때의 문제점
 
 ### 예시) 문단 정렬 방식
 ** 표현 방식 **
 CASE 1. Int
 왼쪽   정렬 = 0
 가운데 정렬 = 1
 오른쪽 정렬 = 2
 1. 무슨 의미인지 알 수 없음
 2. 다른 숫자가 올 수 있음
 */
let left = 0
let center = 1
let right = 2

var alignment = center

/*:
 ** 표현 방식 **
 CASE 2. String
 1. 가독성은 좋으나 오타 발생 가능
 2. 대소문자 구분하여 작성 시 불일치 가능성 있음
 */
let left2 = "left"
let center2 = "center"
let right2 = "right"

var alignment2 = center2

// 대소문자 구분으로 해당 조건문은 실행되지 않음
if alignment2 == "Center" {
    
}

/*:
 # Enumeration Syntax
     enum TypeName {
        case caseName
        case caseName, caseName // 여러개
     }
 */

enum Alignment {
    case left
    case center
    case right
}

// 열거형을 이용한 가운데 정렬 표현
Alignment.center
Alignment.left
Alignment.right

// 독립적인 값
var textAlignment = Alignment.center

// 가운데 정렬을 왼쪽 정렬로 변경
// 앞에서 열거형을 저장했기 때문에 여기에서는 컴파일러가 변수의 자료형이 열거형이라는 걸 인지하고 있음(생략 가능)
// 앞으로 . 으로 시작되는 것을 보면 이름이 생략된 열거형이다 라고 생각하면 됨
textAlignment = .left

// 케이스로 선언하지 않은 justify 를 저장하면 에러 발생
// textAlignment = .justify

// 열거형 비교
// 열거형이 가운데 정렬인지 확인하고 싶은 경우
// 열거형 케이스는 값이기 때문에 비교형 연산자를 이용해 비교할 수 있음
if textAlignment == .center {
    
}

// 정렬 출력
switch textAlignment {
    case .left:
        print("left")
    case .center:
        print("center")
    case .right:
        print("right")
}
