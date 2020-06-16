import UIKit

/*:
 # Number Literals
 */
// 숫자 입력
0.23 // 실수
1.23e4 // 10진수 지수
0xAp2 // 16진수 지수
1_000_000 // 1,000,000 언더스코어 쉼표대신 언더바 사용

// 진법
10 // 10진수
0b1010 // 2진수
0o12 // 8진수
0xA // 16진수 아주 큰 수, 메모리 주소, 컬러 코드 표현 시 사용

//: [Next](@next)


/*:
 # Integer Types
 Int8  ● ○ ○ ○ ○ ○ ○ ○
 
 Int16 ● ● ○ ○ ○ ○ ○ ○
 
 Int32 ● ● ● ● ○ ○ ○ ○
 
 Int64 ● ● ● ● ● ● ● ●
 */
// 비트, Int8 = 8비트 = 1바이트 저장 가능

// 저장할 수 있는 값의 범위
Int8.min // 최소값 -128
Int8.max // 최대값 127

// 메모리 공간의 크기
MemoryLayout<Int8>.size // output: 1,  byte 단위의 크기로 제공

// 마이너스 없는 양수의 범위
UInt8.min // output: 0, unsigned Integer
UInt8.max // output: 255


/*:
 # Int & UInt
 */
// UInt 대신 Int 를 사용하는 이유: 정수를 제일 빠르게 처리해줌

MemoryLayout<Int>.size // output: 8, 바이트 단위
Int.min
Int.max

let num = 123
// 상수는 기본 int 타입
type(of: num) // output: Int.Type

/*:
 # Floating-point Types
 
 Float  ● ● ● ● ○ ○ ○ ○
 
 Double ● ● ● ● ● ● ● ●
 */
// UInt 대신 Int 를 사용하는 이유: 정수를 제일 빠르게 처리해줌
// Float: 4바이트, Double: 8바이트
// 양수, 음수, 0 모두 저장 가능 대략 -900경 ~ +900경
// 숫자를 저장할 때 지수와 가수로 나눠서 저장하기 때문에 항상 정수 자료형보다 큰 값을 저장할 수 있다

// 단점: 메모리의 크기에 따라 소수점의 정확도가 달라짐.
// Float:  최대 6자리 까지만 정확성을 보장함. 그 이후는 오차가 발생할 수 있음.
// Double: 최대 15자리까지만 정확성을 보장함. 그 이후는 오차가 발생할 수 있음.
let pi:Float = 3.1415926535897932384626
print(pi) // output: 3.1415927
let pi2 = 3.1415926535897932384626 // 자료형을 입력하지 않으면 기본 Double 형식
print(pi2) // output: 3.141592653589793
