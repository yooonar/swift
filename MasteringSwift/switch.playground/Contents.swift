import UIKit


/*:
 # Switch

 ## Syntax
 
 switch valueExpression {
    case pattern:
        statements // 반드시 한 줄 이상 포함되어있어야 함
    case pattern, pattern: // 여러 조건을 or 조건으로 작성 가능
        statements
    default:
        statements
 }
 */
let num = 1
switch num {
case 1:
    print("one")
case 2, 3: // 2 or 3
    print("two or three")
default: // Switch must be exhaustive. <- switch 는 모든 경우의 수를 처리해야한다
    // 아무것도 안하고 싶을 땐 break를 넣는다.
    // break

    print("others")
}
// output: one

/*:
 ## Syntax
 
 - 패턴에 조건 추가(where)
 switch valueExpression {
    case pattern where condition: // 패턴에 조건 추가
        statements // 반드시 한 줄 이상 포함되어있어야 함
    case pattern, pattern:
        statements
    default:
        statements
 }
 */

switch num {
case let n where n <= 10:
    print(n)
default:
    print("others")
}
// output: 1

import Foundation
/*:
 # Interval Matching
 범위를 매칭시킴 // 범위 연산자 ..n, n...m, m...
 */
let temperature = -8 // 온도

switch temperature {
case ..<10:
    print("cold")
case 10...20:
    print("cool")
case 21...27:
    print("warm")
case 28...:
    print("hot")
default:
    break
}
// output: cold

/*:
 # Fall Through
 이어지는 블록을 실행할 땐 다음 조건을 신경쓰지 않음
 매칭시키는 코드를 실행하면 나머지 케이스문은 무시하고 switch 문을 종료한다. = Swift는 Implicit Fall Through 를 사용하지 않는다.
 */
// FallThrough 사용 전
let num2 = 2
switch num2 {
case 1:
    print("one")
case 2:
    print("two")
case 3:
    print("three")
default:
    break
}
// output: two

// FallThrough 사용 후
switch num2 {
case 1:
    print("one")
case 2:
    print("two")
    fallthrough
case 3:
    print("three")
default:
    break
}
// output: two \n three

/*:
 ## Fall Through 예시
 로그인 기능을 구현할 때
    1. 로그인 실패를 9번까지는 그냥 경고만 출력
    2. 10번쨰는 경고를 출력한다음 리셋
    3. 그 이상은 경고없이 바로 리셋
 Fall Through 사용 장점: 결과는 동일하지만 중복 소스를 줄여줌
 */
let attempts = 10

// Fall Through 사용 전
switch attempts {
case ..<10:
    print("warning")
case 10:
    print("warning")
    print("reset")
default:
    print("reset")
}
// output: warning \n reset

// Fall Through 사용 후
switch attempts {
case ..<10:
    print("warning")
case 10:
    print("warning")
    fallthrough
default:
    print("reset")
}
// output: warning \n reset
