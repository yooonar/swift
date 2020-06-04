import UIKit


/**
 // 클로저 기본 문법
{
 (매개변수목록) -> 반환타입 in
}
 */

/*
함수 vs 클로저

함수
 1. 이름이 있다.
 2. func 키워드가 존재한다.
 3. in 키워드가 존재하지 않는다.
 
클로저
 1. 이름이 없다.
 2. func 키워드가 존재하지 않는다.
 3. in 키워드가 존재한다.

 func giveFunc() { ... } // function
 var giveNoFunc = { () -> in ... } // closure

 giveFunc()
 giveNoFunc()
 */


func sayHello(name: String) -> String {
    return "Hello \(name)!"
}
print(sayHello(name: "RAMI"))

/*
function to closure
 1. 중괄호를 제거한다.
 func sayHello(name: String) -> String
    return "Hello \(name)!"
 2. in 키워드를 함수의 본체와 반환타입 사이에 넣어준다.
 func sayHello(name: String) -> String in
    return "Hello \(name)!"
 3. func 키워드와 함수의 이름을 제거한다.
 (name: String) -> String in
    return "Hello \(name)!"
 4. 전체를 중괄호로 감싼다. - 완성된 클로저
 {(name: String) -> String in
    return "Hello \(name)!"
 }
 5. 완성된 클로저를 변수에 할당하면 사용이 가능하다.
 var sayHello = { (name: String) -> String in
    return "Hello \(name)!"
 }
 sayHello("RAMI!")
 // output: Hello RAMI!
 */

var sayHelloClosure = {
    (name: String) -> String in
    return "Hello \(name)!"
}
print(sayHelloClosure("RAMI"))


