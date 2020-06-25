import UIKit

/*:
 # Closure
 Self-contained code blocks. 비교적 짧고 독립적인 코드 조각
 Objective-c 에서는 Block, Java 에서는 lambda 라고 부름
 Swift에서 클로저에 포함되는 건 3가지

 ## Named Closures ← 일반 함수(클로저라고 부르지 않음)
    (Global) Function
    Nested Function

 ## Unnamed Closures ← 익명 함수, 클로저(이름이 없는 함수, 클로저라고 부름)
    Anonymous Function
 */

/*:
 # Closures
 
 ## 클로저 표현식 기본 문법
 // 함수와 클로저는 서로 호환됨
 // 클로저는 func 키워드 없음, 클로저 헤드(parameter부터 returnType까지) 와 클로저 바디(내용) 를 in 키워드로 구분함
 // 함수와 마찬가지로 parameter와 return형을 생략 가능함. 이 때 in 키워드도 같이 생략됨
 { (parameters) -> ReturnType in
    statements
 }
 
## 가장 단순한 클로저 표현식
 { statements }
 */


/*:
 문자열을 출력하는 가장 단순한 클로저 = parameter 와 returnType이 생략된 클로저
 { print("Hello, Swift") }
 ↑ 이 때 컴파일 에러 발생! ← 클로저 표현식은 글로벌 스코프에서 단독으로 작성할 수 없음. 해결책: 상수에 저장
 자료형: () -> () parameter가 없고 return형이 없는 클로저
 자료형이 동일하기 때문에 함수와 호환 가능
 함수를 전달하는 곳에 클로저를 전달하고, 클로저를 전달하는 곳에 함수를 전달하는 것도 가능
 */

// 클로저는 이름이 없는 함수인데 c(상수)라는 이름을 붙인 것과 같음
let c = { print("Hello, Swift") }

// 클로저 출력ㄴ
c() // output: Hello, Swift


/*:
 ## 클로저에 parameter와 returnType 추가
 parameter와 returnType의 문법은 함수와 완전히 동일함
 
 클로저와 함수의 parameter 문법의 차이점
 클로저는 Argument Label(인자 이름) 을 사용하지 않음
 
 이 코드를 함수라고 가정했을 때 (str: String) 은 parameter name인 동시에 argument label 이다.
 하지만 클로저에서는 argument label을 사용하지 않는다.
 클로저에서의 str은 그저 paramater name이다.
 */
let c2 = { (str: String) -> String in
    return "Hello, \(str)"
}
let result = c2("Closure")

print(result) // output: Hello, Closure

/*:
 ## 클로저를 parameter로 전달
 1. 코드의 가독성을 높이기 위해 typealias 를 선언
 2. 새로운 함수를 구현
 3. 새로운 함수 호출 시 parameter를 전달
 4. 함수 바디에서 클로저 호출
 */

// 1. 문자열 parameter를 받아서 문자열을 리턴하는 형식에 SimpleStringClosure 라는 이름을 붙인다.
typealias SimpleStringClosure = (String) -> String

// 2. 새로운 함수 구현
func perform(closure: SimpleStringClosure) {
    // 4. 전달된 closure 를 함수 body안에서 호출하고 parameter로 iOS를 전달
    print(closure("iOS"))
}

// 3. perform 함수 호출 시 Argument로 전달한 c2가 perform() 함수의 parameter(closure: SimpleStringClosure) 로 전달된다.
perform(closure: c2)
