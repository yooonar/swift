import UIKit

let num = 1

// default 반드시 설정할것.
// 하나의 case에서는 꼭 statement를 설정해줘야한다
// 이 때 where 문법을 통해 pattern에 해당하는 case 에서 condition을 한 번 더 확인해준다
switch num {
case let n where n <= 10 :
    print(n)
default:
    print("others")
}

/**
기본 문법
switch valueExpression {
case <#pattern#> where condition :
    statements
default:
    statements
}
*/

// switch 범위 지정
// 범위를 지정할 때 ..를 쓴다
let tempurature = -8
switch tempurature {
case ..<10 :
    print("cold..")
case 10...20 :
    print("cool!")
case 21...27 :
    print("warm~")
case 28... :
    print("hot!!!!")
default:
    break
}

// switch fallthrough
// 바로 다음 case가 있는 블럭도 실행시킴
switch tempurature {
case ..<10 :
    print("cold..")
    fallthrough
case 10...20 :
    print("cool!")
case 21...27 :
    print("warm~")
case 28... :
    print("hot!!!!")
default:
    break
}
