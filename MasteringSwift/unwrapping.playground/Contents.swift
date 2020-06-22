import Foundation

/*:
 # Unwrapping
 옵셔널로 선언한 경우 랩핑 되어있다.
 실제로 저장된 값을 사용해야할 때 추출하는 랩핑된 부분을 벗기는 작업이 필요하다.
 랩을 벗기는 작업(과정)을 추출 혹은 언랩핑이라고 한다.
 */

var num: Int? = nil
print(num)
// output: nil

num = 123
print(num)
// output: Optional(123)

let n = 1
print(n)
// output: 1

/*:
 # Forced Unwrapping
 ## OptionalExpression!

 강제 추출
 */

// 랩핑 상태
print(num)
// output: Optional(123)

// 언랩핑 상태 <- 실제 값 추출
print(num!)
// output: 123


num = nil
// print(num!) // <- Error! 값이 없는데 강제로 언랩핑을 하여 오류 발생. msg: Unexpectedly found nil while unwrapping an Optional value

// 조건문으로 먼저 nil인지 검수. 값이 있는 경우만 프린트 하기 때문에 안전함
if num != nil {
    print(num)
}

num = 123
let before = num // <- wrapping. 옵셔널 인트 타입 형식
let after = num! // <- unwrapping. 인트 타입 형식

// 가능하면 강제 추출은 사용하지 않는 것이 좋다. <- 안전하게 Optional Binding 사용하는 것을 권장함

