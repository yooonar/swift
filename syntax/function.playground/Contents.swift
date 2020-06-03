import UIKit

func sayHello() { // define
    print("Hello, Swift")
}

sayHello()

// func 함수명 (변수 이름: 타입) -> 리턴타입
func dupl(a: Int, b: Int) -> String { // define
    return "\(a) * \(b) = \(a * b)"
}

print(dupl(a:3, b:4))
