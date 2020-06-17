import UIKit


/*:
 # Switch

 ## Syntax
 
 switch valueExpression {
    case pattern:
        statements // 반드시 한 줄 이상 포함되어있어야 함
    case pattern, pattern:
        statements
    default:
        statements
 }
 */
let num = 9
switch num {
case 1:
    print("one")
case 2, 3:
    print("two or three")
default:
    // break
    print("others")
    // 아무것도 안하고 싶을 땐 break를 넣는다.
}

/*:
 ## Syntax
 
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

import Foundation
/*:
 # Interval Matching
 */
let temperature = -8 // 온도

switch temperature {
case ..<10:
    print("cold")
case 11...20:
    print("cool")
case 21...27:
    print("warm")
case 28...:
    print("hot")
default:
    break
}

/*:
 # Fall Through
 */
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
