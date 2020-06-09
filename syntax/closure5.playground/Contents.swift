import UIKit

// 후행 클로저
/*
 xcode 에서 자동완성 기능을 이용하면 자동으로 후행 클로저로 유도함
 함수나 메소드의 마지막 전달인자로 전달되는 클로저에만 해당됨
 전달인자가 하나면 소괄호 생략 가능, 소괄호를 닫은 후 작성할 수 있음
 매개변수 타입과 반환타입 생략 가능
 */

let names: [String] = ["banana", "apple", "dark", "iphone"]

// 1. 메소드 소괄호 닫은 후 작성
let reversed3: [String] = names.sorted() { (first: String, second: String) -> Bool in
    return first > second
}
print(reversed3)

// 2. 메소드 소괄호 생략
let reversed4: [String] = names.sorted{ (first: String, second: String) -> Bool in
    return first > second
}
print(reversed4)

// 3. 타입 유추를 통한 반환타입, 매개변수타입 생략
let reversed5: [String] = names.sorted { (first, second) in
    return first > second
}
print(reversed5)

// 4. 단축 단자 이름 - 첫번째 전달인자부터 $0, $1, $2, ... 순서로 표현
// in 생략 가능
let reversed6: [String] = names.sorted {
    return $0 > $1
}
print(reversed6)

// 5. 리턴 키워드 생략 - 클로저가 반환값을 갖고 실행문이 한줄이면 리턴 키워드 생략 가능
let reversed7: [String] = names.sorted { $0 > $1 }
print(reversed7)
