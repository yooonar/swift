import Foundation

let products = [
    "MacBook Air", "MacBook Pro",
    "iMac", "iMac Pro", "Mac Pro", "Mac Mini",
    "iPad Pro", "iPad", "iPad Mini",
    "iPhone Xs", "iPhone Xr", "iPhone 8", "iPhone 7",
    "AirPods",
    "Apple Watch Series 4", "Apple Watch Nike+"
]

/*:
 검색이나 정렬과 관련된 API는 대부분 클로저를 parameter로 받는다.
 */

// 배열이 제공하는 필터 메소드를 사용하여 Pro 가 들어가는 데이터 찾기
// [String] filter(isIncluded: (String) throws -> Bool)
// filter 메소드의 parameter는 하나이며, 자료형은 문자열을 parameter로 받아서 Boolean 형식으로 리턴한다
var ProModels = products.filter({ (name: String) -> Bool in
    return name.contains("Pro")
})

print(ProModels) // output: ["MacBook Pro", "iMac Pro", "Mac Pro", "iPad Pro"]


// sorted 메소드가 문자에 할당된 코드를 기준(아스키코드)으로 정렬하기 때문에 i가 M보다 뒤에 있다.
print(ProModels.sorted()) // output: ["Mac Pro", "MacBook Pro", "iMac Pro", "iPad Pro"]

// 대소문자에 관계없이 오름차순 정렬 ← 이 경우 직접 정렬 조건을 구현해야함
// sort(by: ) 메소드 사용
// String parameter을 두 개 받아서 Bool을 리턴하는 클로저
// 원하는 방식을 클로저로 구현한 다음 argument로 전달을 해주면 Sort(by: ) 메소드 내부에서 클로저를 호출한 후 요소를 정렬함

ProModels.sort(by: {(lhs: String, rhs: String) -> Bool in
    return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
})
print(ProModels) // output: ["iMac Pro", "iPad Pro", "Mac Pro", "MacBook Pro"]


print("Start")
// print("End") 바로 출력됨

// 코드의 실행 지연
// deadline: 지연시간, 실행할 코드
// execute 자료형: parameter가 없고 return 형이 없는 클로저
// void: 리턴형이 없다는 걸 나타내는 특별한 키워드. 빈 괄호로 대체 가능
DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: { print("End") })

// 위 코드와 완전히 같은 코드임
// xcode 자동완성으로 입력하면 최대한 단순한 코드로 입력됨
// Swift는 단순환 코드 선호함. 특히 클로저는 특히 더 선호함
// 불필요한 요소를 최대한 제거한 다음 간략히 작성 ← 문법 최적화(Syntax Optimization)
DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    print("End!")
}
