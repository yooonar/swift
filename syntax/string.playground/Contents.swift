import UIKit

let str1 = "Hello, Swift"
let str2 = "\"Hello\", Swift"
print(str1)
print(str2)

// string 쓸 때 \와 "를 인식 못하는 경우가 종종 있다.
// 이 때 string 전체의 앞 뒤에 #을 붙여주면 raw string이 되어 제대로 인식한다.
let str3 = #""Hello", Swift "#
print(str3)

let str4 = "Hello, \nSwift"
print(str4)

let str5 = "Hello, \t Swift"
print(str5)

