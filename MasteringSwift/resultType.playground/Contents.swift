import UIKit

/*:
 # Result Type
 
 Swift의 오류 처리 시스템의 발전 과정
 
 1. Swift 1.x : Objective-c 와 동일한 방법으로 처리한다.
 NSError 포인터를 사용해야했기 때문에 포인터 방식을 지양하는 Swift 에는 어울리지 않는 방식이었다.
 
 var error: NSError?
 let str: NSString
 let url: URL
 let success = str.writeToURL(url, atomically: true, encoding: NSUTF8StringEncoding, error: &error) if ! success {
    println("Error: \(error!)")
 }
 
 2. Swift 2.x +
 새로운 에러 처리 모델이 도입되었고, 지금까지 사용되고 있음
 에러가 발생할 수 있는 코드블록을 throwing function 이나 throwing method 로 선언한다.
 그리고 do catch 문에서 try 표현식을 통해 호출하고, 발생한 에러를 처리한다.
 에러 형식은 특별한 프로토콜을 채용한 형식으로 선언한다.
 
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
    
    // AnotherNumberError 에 선언되어있는 tooLarge 에러를 던지도록 guard 문을 추가하자.
    guard oddNumber < 1000 else {
        throw AnotherNumberError.tooLarge
    }
    
    // 하나의 함수 process 에서 두가지 형식의 에러를 던지고 있다.
    // 그리고 함수를 호출할 때
    return oddNumber * 2 // 홀수만 처리하는 가상의 함수
}

// do catch로 process 함수를 try 문으로 호출하고, catch 구문에서 에러를 처리하고 있다.
do {
    let result = try process(oddNumber: 1)
    print(result)
    
    // 10000 이 넘어가면 AnotherNumberError.tooLarge 오류 발생, 두번째 catch 문이 호출됨
    let result2 = try process(oddNumber: 10001)
    print(result2)
    // output: The operation couldn’t be completed. (__lldb_expr_3.AnotherNumberError error 0.)
    
    /*
     코드는 문제없이 실행되지만 AnotherNumberError 를 올바르게 처리했다고 볼 수는 없다.
     컴파일러가 새로운 형식의 에러가 추가되었다는 것을 인식하지 못하기 때문에 에러 처리에서 논리적인 오류가 발생할 가능성이 높다.
     만약 두번째 catch 문을 삭제하거나 주석처리 하는 경우,
     process 함수가 NumberError 형식만 던진다면 문제가 없지만 다른 형식으로 에러를 던지면 runtime 에러가 발생한다.
     이전보다 문제가 더 심각해진다.
     현재는 컴파일러가 이런 것들을 에러로 판단하지 않는다.
     컴파일 시점에 문제를 파악할 수 없기 때문에 코드의 안정성이 낮아진다.
     */
    
} catch let myErr as NumberError {
    // 어떤 형식의 에러가 전달되는지 파악했다면 해당 형식으로 처리하기 위해서 타입 캐스팅이 필요하다.
    // 여기에서 NumberError 형식으로 에러를 던지고 있기 때문에 NumberError 으로 타입 캐스팅을 해야한다.
    // switch 문으로 간단하게 로그만 출력 처리한다.
    switch myErr {
    case .negativeNumber:
        print("negative Number")
    case .evenNumber:
        print("even Number")
    }
} catch {
    print(error.localizedDescription)
}
/*
 이렇게 새로운 catch 블록을 추가하고 전달된 에러를 실제 형식으로 타입 캐스팅해야한다.
 이제 NumberError 가 전달되면 첫번째 catch 블록이 처리하고, 나머지 에러는 두번째 블록이 처리한다.
 */



/*
 Result 입력 후 cmd + opt + click 하여 Jump to definition 으로 이동
 @frozen public enum Result<Success, Failure> where Failure : Error {
    /// A success, storing a `Success` value.
    case success(Success)

    /// A failure, storing a `Failure` value.
    case failure(Failure)
    ...
 }
 위에 보이는 것처럼 Result 는 제네릭 열거형이다.
 Success case 와 Failure case 가 선언되어있고 연관값을 가지고 있다.
 Success case 에 저장할 수 있는 형식은 제한이 없지만, Failure case 에는 에러 형식만 저장할 수 있다.
 generic 으로 선언되어 있다는 것은 형식이 명확하다는 것이다.
 두번째 parameter 로 에러 형식을 명확히 선언하기 때문에 형식에 관한 모호함이 모두 사라진다.
 
 보통 작업의 결과는 두가지이다. 성공과 실패
 작업이 성공하면 Success case 에 작업의 결과가 저장된다.
 서버에서 json 데이터를 가져오는 작업이라면, 파싱된 데이터가 저장된다.
 
 반대로 작업이 실패하면 Failure case 에 에러가 저장된다.
 
 Result 형식은 완전히 새로운 형식의 개념은 아니다.
 어떤 라이브러리들은 이미 직접 구현한 Result 타입을 활용하고 있다.
 
 이제 swift가 공식적으로 지원하기 때문에 라이브러리의 의존성을 줄일 수 있다.
 */

// Result 형식을 사용해서 에러를 처리해보자.
// Result 형식은 throwing closure 로 초기화하는 생성자를 제공해준다.
// 그래서 기존 코드를 수정하지 않고 Result 형식으로 처리할 수 있다.
// 이렇게하면 Result 변수에 Result 인스턴스(열거형)가 저장되는데, 이 인스턴스는 Success case 와 Faulure case 를 가지고 있다.
// 그래서 switch 문으로 처리할 수 있다.
let result = Result { try process(oddNumber: 1) }

switch result {

// 함수가 정상적으로 실행되면 success case 와 매칭되어 연관값으로 얻을 수 있다.
case .success(let data):
    print(data)
// 함수가 실패하면 failure case 와 매칭되어 연관값으로 얻을 수 있다.
case .failure(let error):
    print(error.localizedDescription)
}
// do catch 문에 비해 성공과 실패가 더욱 명확해졌다.


// Result 형식은 열거형이기 때문에 작업이 성공했을 때와 실패했을 때를 작성해주어야 한다.
// Result<Int, NumberError> ← 성공하면 Int 형식, 실패하면 NumberError 형식으로 리턴
// 리턴 형식을 직접 지정하기 때문에 형식의 안정성을 보장하며, 잘못된 형식으로 인해 발생하는 문제는 컴파일 에러를 통해 바로 확인할 수 있다.
func processResult(oddNumber: Int) -> Result<Int, NumberError> {
    
    // Result 타입에서 에러를 처리할 때는 함수에서 직접 에러를 던지지 않는다.
    
    // parameter 로 음수 전달 시 negativeNumber 에러 전달
    guard oddNumber >= 0 else {
        // return Result.failure(NumberError.negativeNumber)
        // 이렇게 작성해도 되지만 컴파일러가 타입을 추론할 수 있어 코드를 더욱 단순하게 구현할 수 있다.
        // throwing function 에서는 형식 추론이 불가능하기 때문에 전체 형식을 써야하는데, Result 형식에서는 형식을 생략할 수 있다.
        return .failure(.negativeNumber)
        
    }
    
    // parameter 로 짝수 전달 시 evenNumber 전달
    guard !oddNumber.isMultiple(of: 2) else {
        return .failure(.evenNumber)
    }
    // 여기서는 NubmerError 형식만 사용하기로 했기 때문에 AnotherNumberError 는 사용할 수 없어 주석 처리한다.
    //    guard oddNumber < 1000 else {
    //        return .failure(AnotherNumberError)
    //    }

    // 결과값을 success case 에 담아 리턴
    return .success(oddNumber * 2)
}


/*
 throwing function 과 Result 형식을 비교해보면, 에러 형식을 직접 던지는 것이 아니라 연관값으로 리턴한다.
 다시 말해서 함수를 throwing function 으로 선언하지 않는다.
 
 이런 차이 때문에 함수를 처리하는 방식과 에러를 처리하는 방식이 달라진다.
 성공과 실패가 열거형으로 리턴되고, 에러는 실제로 결과를 사용하는 시점에 처리한다.
 
 - 에러를 처리하는 시점
 throwing function: 함수 호출할 때 에러 처리
 Result: 작업 결과를 사용하는 시점에서 에러 처리
 
 에러를 처리하는 시점이 이동됨
 
 이런 패턴을 Delayed Error Handling 이라고 부른다.
 */


let result2 = processResult(oddNumber: 1)
switch result2 {
// 함수가 정상적으로 실행되면 success case 와 매칭되어 연관값으로 얻을 수 있다.
case .success(let data):
    print(data)
// 함수가 실패하면 failure case 와 매칭되어 연관값으로 얻을 수 있다.
case .failure(let error):
    print(error.localizedDescription)
}

// 지금은 성공과 실패를 모두 처리하고 있다.
// 에러를 무시하려면

// 이 메소드는 작업이 성공하면 결과값을 리턴하고, 실패하면 에러를 던지는 throwing 메소드 이다.
// 이렇게 되면 작업이 성공한 경우에만 if 블록이 실행된다.
if let result = try? result2.get() {
    print(result)
    // output: 2
}


/*
 throwing function 은 정확히 어떤 형식의 에러를 던지는지 파악하기 힘들다.
 반면 Result 형식을 사용하면 에러 형식이 명시적으로 선언된다.
 컴파일 타임에 에러 형식을 정확히 인식할 수 있다는 것은 형식 안정성이 보장된다는 것이다.
 그래서 타입 캐스팅 없이 에러를 처리할 수 있고, 형식 추론을 통해서 에러 처리 코드가 더욱 단순해진다.
 작업의 결과를 성공과 실패로 명확히 구분해서 처리할 수 있다는 것도 장점이다.
 
 그리고 get 메소드를 활용해 에러처리 코드를 더욱 단순하게 구현할 수 있다.
 
 Result 형식이 여러가지 장점을 가지고 있지만 기존 에러 처리 패턴을 완전히 대체하는 것은 아니다.
 에러를 처리하는 방법이 다양해진 것이다.
 */
