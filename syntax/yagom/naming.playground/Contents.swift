import UIKit

/*:
 # 1. 이름짓기 규칙
 - Lower Camel Case: function, method, variable, constrant
   eg. someVariableName
 
 - Upper Camel Case: type(class, struct, enum, extension, ...)
   eg. Person, Point, Week
 
 - Swift는 대소문자를 구분한다.
 
 
 # 2. 콘솔로그
 - print
   단순 문자열 출력

 - dump
   인스턴스의 자세한 설명 (description 프로퍼티)까지 출력
 
 print, dump 모두 스트리밍으로 표현해 콘솔이 아닌 로그 파일로 남길 수 있지만 기본적으로는 콘솔 로그에 남기는 역할을 하고 있다.
 
 
 # 3. 문자열 보간법
 - String Interpolation
 
 - 프로그램 실행 중 문자열 내에 변수 또는 상수의 실질적인 값을 표현하기 위해 사용한다.
 
 - \(값)
   자동으로 치환해 출력해준다.
 */
let age: Int = 10

"안녕하세요! 저는 \(age) 살입니다."
// == 안녕하세요! 저는 10 살입니다.

"안녕하세요! 저는 \(age + 5) 살입니다."
// == 안녕하세요! 저는 15 살입니다.

print("안녕하세요! 저는 \(age + 5) 살입니다.")
print("\n#####################\n")
// 안녕하세요! 저는 15 살입니다.
// #####################


class Person {
    var name: String = "yoonar"
    var age: Int = 10
}

let yoonar: Person = Person()

print(yoonar)
// __lldb_expr_21.Person

print("\n#####################\n")
// #####################

dump(yoonar)
// ▿ __lldb_expr_21.Person #0
// - name: "yoonar"
// - age: 10
