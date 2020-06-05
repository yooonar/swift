import UIKit

// 클로저 축약형

// 1. return 값으로 반환되는 타입을 추측 가능
var sayHello = { (name: String) in
    return "Hello \(name)"
}
print(sayHello("RAMI!"))
// output: Hello RAMI!

/*
 클로저에서는 return 키워드 또한 생략해줄 수 있다.
 마지막에 있는 값을 반환 값으로 인식한다.
 */
var sayHello2 = { (name: String) in
    "Hello \(name)"
}
print(sayHello2("RAMI!"))
// output: Hello RAMI!

// 2. 변수의 타입을 명시해주었다면 매개변수의 타입도 생략 가능
/*
 $ 사인을 통해 매개변수를 0부터 순서대로 접근할 수 있다.
 */
var sayHello3 : (String) -> String = { "Hello \($0)"}
print(sayHello3("RAMI!"))
// output: Hello RAMI!


// 기본 문법과 축약문법 비교
var sayHelloBefore = { (name: String) -> String in return "Hello \(name)" }
var sayHelloAfter : (String) -> String = { "Hello \($0)" }

print(sayHelloBefore("RAMI~"))
print(sayHelloAfter("RAMI~"))


