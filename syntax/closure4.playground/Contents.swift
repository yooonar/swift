import UIKit

/*
 표현방식
 { (parameters) -> (return type) in
    statements
 }
 */

// 함수와 비교
let names: [String] = ["banana", "apple", "dark", "iphone"]

// 함수 전달 예
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) comparing...")
    return first > second
}

let reversed: [String] = names.sorted(by: backwards)
print(reversed)

// 클로저 전달 예
let reversed2: [String] = names.sorted(by: {(first: String, second: String) -> Bool in
    print("\(first) \(second) comparing..")
    return first > second
})
print(reversed2)
