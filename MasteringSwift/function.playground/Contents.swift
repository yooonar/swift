import UIKit

print("hello")
/*:
 # Swift Standard Library
 https://developer.apple.com/reference/swift
 
 ## 1. Calling Function
       함수를 가져와서 쓰는 법 = 호출
 ## 2. Defining Function
       직접 함수를 만드는 법 = 선언, 구현
 */
 
/*:
 # Function
 ## 1. Calling Functions
    FunctionNames(parameters)
 
 ## 2. Defining Functions
                           ↓ Return Allow
     func name(parameters) -> returnType {
        statements
     }
 parameter 생략 가능
 */

// 값을 리턴하지 않는 함수. 이 경우 리턴화살표, 리턴 형식 생략 가능
func sayHello() {
    print("hello, Swift")
}
sayHello()
