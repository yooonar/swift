import UIKit

/*:
 # Raw String
 문자열 리터럴에서 백슬래시 \ 와 큰 따옴표 " 는 특별한 의미로 사용된다.
 " " 는 문자열의 시작과 끝을 표현하고, \ 는 escape sequence 로 사용된다.

 특수문자가 포함된 문자열을 쉽게 구상할 수 있고, 리터럴과 최종 결과의 큰 차이가 없기 때문에 문자열의 가독성이 증가한다.

 또한, 정규식 문자열을 직관적으로 작성할 수 있다는 장점이 있다.
 */

var str = "\"Hello\", Swift"
var rawStrOrg = #"\"Hello\", Swift"#
var rawStr = #""Hello", Swift"#

print("===== str =====")
print(str)
// output: "Hello", Swift

print("===== raw str =====")
print(rawStrOrg)
// output: \"Hello\", Swift

print("===== raw str =====")
print(rawStr)
// output: "Hello", Swift


/*
 문자열 리터럴의 양 끝을 # 으로 감싸면 raw string 이 된다.
 raw string 은 " "와 \ 를 문자열 그대로 처리한다.
 그래서 " 만을 표현하고 싶을 땐 \" 가 아닌 " 만 넣어 표현할 수 있다.
 */


str = "Lorem\nIpsum"
print("===== str =====")
print(str)
/*
 output:
 Lorem
 Ipsum
 */

rawStr = #"Lorem\nIpsum"#
print("===== raw str =====")
print(rawStr)
// output: Lorem\nIpsum
// 문자열 그대로 출력된다. 줄바꿈을 하고싶을 땐 어떻게 해야할까?

rawStr = #"Lorem\#nIpsum"#
print("===== raw str =====")
print(rawStr)
/*
 output:
 Lorem
 Ipsum
 */

rawStr = ###"Lorem\###nIpsum"###
print("===== raw str =====")
print(rawStr)
/*
 output:
 Lorem
 Ipsum
 */



let value = 123
str = "The value is \(value)"
rawStr = #"The value is \#(value)"# // value 를 문자열 그대로 출력하지 않고 값을 가지고 오고 싶다면 \ 다음 # 을 넣어준다.

print("===== str =====")
print(str)
// output: The value is 123

print("===== raw str =====")
print(rawStr)
// output: The value is 123



// 정규식

// 간단한 우편번호 정규식
var zipCodeRegex = "^\\d{3}-?\\d{3}$"

// 정규식에서 메타 문자도 \ 로 시작하는데 메타문자를 그대로 문자열 리터럴에 추가하면 이스케이프식으로 인식됨.
// \ 하나만 넣으면 문법상 에러가 발생하기 때문에 \\ 로 넣어준다.

let zipCode = "123-456"
if let _ = zipCode.range(of: zipCodeRegex, options: [.regularExpression]) {
    // zipCode 가 제대로 된 우편번호라고 판단될 때
    print("valid")
}
// output: valid


var zipCodeRegex2 = #"^\d{3}-?\d{3}$"#
let zipCode2 = "123-456"
if let _ = zipCode2.range(of: zipCodeRegex2, options: [.regularExpression]) {
    // zipCode2 가 제대로 된 우편번호라고 판단될 때
    print("valid")
}
// output: valid

//불필요한 \ 가 제거되어 문자열의 가독성이 높아졌다.
