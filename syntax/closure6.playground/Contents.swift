import UIKit

/*
 탈출 클로저(Escaping Closure)
 @escaping 키워드 사용
 함수 종료 후 호출될 필요가 있는 클로저를 사용해야할 때 사용
 */
var completions: [() -> Void] = []
func someFuncWithCompletion(completion: @escaping () -> Void) {
    return completions.append(completion)
}

/*
 자동 클로저(Auto Closure)
 함수의 전달 인자로 전달되는 표현을 자동으로 변환해주는 클로저
 전달인자를 갖지 않는다
 자동으로 @noescape 속성을 포함하기 때문에 탈출 클로저를 사용하고 싶으면 @escaping 을 붙여야 한다
 */
var customerInLine: [String] = ["A", "B", "C", "D"]
let customerProvider: () -> String = {
    return customerInLine.removeFirst()
}

func serveCustomer(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())")
}
serveCustomer(customerInLine.removeFirst())
