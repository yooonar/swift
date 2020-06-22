import UIKit
/*:
 # Optionals
 Swift 는 기본적으로 Non-Optional Type 이다.
 상수 num에 1을 넣지 않으면 정의되어있지 않아 컴파일 에러 발생
 Type annotation missing in pattern.
 */
let num = 1

// 자료형을 선언해주면 당시에는 오류가 나진 않지만 컴파일 하는 경우 오류가 발생한다.
// Constant 'num2' used before initialized.
let num2: Int

// 상수의 값을 네트워크에서 받아야 하는 경우 네트워크가 끊기면 없을 수 있다.


/*:
 Optional: 값을 가지지 않아도 되는 형식
 nil: 값이 없다.
 nil 자체만으로는 추론할 수 있는 형식이 없다. = 타입을 지정하지 않고 nil을 선언하는 경우 컴파일 하면 에러난다.
 반드시 Type annotation(: Int) 으로 타입을 지정해주어야 한다.
 let optionalNum = nil <- Error! msg: 'nil' requires a contextual type
 objective-c 의 nil(존재하지 않는 객체에 대한 포인터) 과 swift의 nil 은 다름(포인터가 아닌 그냥 값이 없다는 것을 나타내는 키워드)
 그렇기때문에 swift의 nil은 참조 형식, 값 형식에서도 얼마든지 사용 가능하다.
 */
let optionalNum: Int? = nil


/*:
 # Optional Types
 ## TypeName <- Non-Optional Type
 ## TypeName? <- Optional Type
 
 let str: String = nil <- Error! 타입 반드시 지정해야함 msg: Nil cannot initialize specified type 'string'
 */

// String <- 스트링 타입 형식이라고 읽음
let str: String = "Swift" // Non-Optional Type

// String? <- 옵셔널스트링 타입 형식이라고 읽음
let optionalStr: String? = nil // Optional Type

// Int? <- 옵셔널 인트 타입 형식이라고 읽음
let optionalInt: Int? = nil


let a: Int? = nil

// b의 자료형: Int? <- 옵셔널 인트 타입
let b = a

b // b = nil <- 값이 저장되어있지 않다

// a 는 identifier(상수의 이름)이면서 Expression(표현식)
// 표현식을 평가한 결과가 옵셔널로 리턴되는 경우 특별히 Optional Expressions(옵셔널 표현식)이라고 한다.
