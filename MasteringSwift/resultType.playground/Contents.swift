import UIKit

/*:
 # Result Type
 
 Swift의 오류 처리 시스템 발전 과정
 
 1. Swift 1.x : Objective-c 와 동일한 방법으로 처리함
 NSError 포인터를 사용해야했기 때문에 포인터 방식을 지양하는 Swift 에는 어울리지 않는 방식이었다.
 
 var error: NSError?
 let str: NSString
 let url: URL
 let success = str.writeToURL(url, atomically: true, encoding: NSUTF8StringEncoding, error: &error) if ! success {
    println("Error: \(error!)")
 }
 
 2. Swift 2.x +
 새로운 에러 처리 모델이 도입되었고 지금까지 사용되고 있음
 에러가 발생할 수 있는 코드블록을 throwing function 이나 throwing method 로 선언
 그리고 do catch 문에서 try 표현식을 통해 호출하고, 발생한 에러를 처리함
 에러 형식은 특별한 프로토콜을 채용한 형식으로 선언함
 
 enum MyError: ErrorType {
    case someError
 }
 
 func doSomething() throws {
    throw MyError.someError
 }
 
 do {
    try doSomething()
 } catch {
    print(error)
 }
 */

enum NumberError: Error {
    case negativeNumber
    case evenNumber
}

enum AnotherNumberError: Error {
    case tooLarge
}

// process function : throws function
// return oddNumber * 2 : 홀수만 처리하는 가상의 함수

/*
 throws 키워드는 코드 블록에서 에러를 던질 수 있다는 것을 나타내지만 에러의 형식을 특정하지는 못한다.
 하나의 에러에서 다양한 형식의 에러를 던질 수 있고, 코드블록을 호출하는 부분에서는 어떤 형식을 전달하는지 문법적으로 파악할 방법이 없다.
 바꿔말하면 catch 블록으로 에러가 전달되는 시점에는 실제 에러 형식이 아니라 에러 프로토콜 형식으로 전달된다.
 
 여기에서 모호함이 발생한다.
 에러를 올바르게 처리하기 위해서는 process 함수가 던지는 에러의 형식을 알고있어야 한다.
 지금은 코드가 짧아서 쉽게 파악할 수 있지만 프레임워크가 제공하는 API 를 사용할 때는 레퍼런스 없이 코드를 파악하기가 어렵다.
 */
func process(oddNumber: Int) throws -> Int {
    
    // parameter 로 음수 전달 시 negativeNumber 에러 전달
    guard oddNumber >= 0 else {
        throw NumberError.negativeNumber
    }
    
    // parameter 로 짝수 전달 시 evenNumber 전달
    guard !oddNumber.isMultiple(of: 2) else {
        throw NumberError.evenNumber
    }
    return oddNumber * 2 // 홀수만 처리하는 가상의 함수
}
// do catch로 process 함수를 try 문으로 호출하고, catch 구문에서 에러를 처리
do {
    let result = try process(oddNumber: 1)
    print(result)
} catch {
    print(error.localizedDescription)
}
/*
 어떤 형식의 에러가 전달되는지 파악했다면 해당 형식으로 처리하기 위해서 타입 캐스팅이 필요하다.
 */
