import UIKit

/*:
 # Value Types and Reference Types
    Structure Enumeration Tuple         Class Closure
            Values Type                 Reference Type
 
 값 형식: 구조체(Int, String같은 기본 자료형은 구조체로 구현되어있으며 Swift Collection 역시 구조체로 구현됨), 열거형, 튜플
 참조 형식: Class, Closure
 */

// 좌표를 저장하는 구조체와 클래스 선언
// 두 형식이 같은 이름을 사용할 수 없기 때문에 PositionValue, PositionObject 로 선언
// 속성은 선언과 동시에 기본값을 저장하고 있다.
// 이렇게하면 parameter가 없는 생성자가 자동으로 제공되는데 이것을 기본 생성자(Default Initializer)라고 한다.
struct PositionValue {
    var x = 0.0
    var y = 0.0
}

class PositionObject {
    var x = 0.0
    var y = 0.0
}

// 기본 생성자를 호출해서 인스턴스를 하나씩 만들기
var v = PositionValue()
// output: x 0  y 0


var o = PositionObject()
// output: x 0  y 0

// 새로운 변수 선언 후 v 와 o 에 저장되어있는 값으로 초기화
// v2 는 새로운 복사본을 만드는 것
var v2 = v
// output: x 0  y 0

// o2 는 새로운 복사본을 만들지 않음 o2 변수에 저장되는 것은 인스턴스가 저장되어있는 메모리 주소임
var o2 = o
// output: x 0  y 0

v2.x = 12
// output: x 12 y 0

v2.y = 34
// output: x 12 y 34


v
// output: x 0  y 0

v2
// output: x 12 y 34

// 구조체는 값형식이라 v2 에 저장되어 있는 값은 v 와 같은 값을 가진 복사본
// 그래서  v2 에서 속성을 바꿔도 v 에는 아무런 변화가 없다

o2.x = 12
// output: x 12 y 0

o2.y = 34
// output: x 12 y 34


o
// output: x 12 y 34


o2
// output: x 12 y 34

// 클래스는 새로운 복사본을 생성하지 않고 원본을 전달한다.
// 조금 더 정확히 설명하면 참조를 전달하는데 지금은 그냥 원본을 저장한다고 생각하면 된다.
// 원본이 전달되기 때문에 어떤 변수를 통해서 속성을 바꾸더라도 항상 같은 대상을 바꾸게 된다.
// 이 부분이 값형식과의 가장 큰 차이이다.


/*:
 값형식: 값형식을 다른곳에 저장하거나 parameter 와 return 형으로 전달하면 새로운 복사본이 생성된다.
 참조형식: 참조형식은 복사본을 생성하지 않는다. 대신 인스턴스가 저장되어있는 메모리 주소를 전달한다.
           그리고 주소와 값을 별도의 메모리 공간에 하나씩 저장하고 주소를 통해 값을 전달한다.
 
 객체지향 프로그래밍에서는 대부분 참조형식인 Class 로 구현한다.
 상대적으로 적은 데이터를 저장하고 상속이 필요하지 않다면: 값형식으로 구현
 값이 전달되는 시점마다 복사본이 생성되어야 하는 경우: 값형식으로 구현
 연관된 상수 그룹을 표현할 때: 열거형으로 구현
 코드 내에서 한 번만 사용되는 형식: 튜플로 구현
 나머지 값형식은 모두 구조체로 구현함
 
 함수형 프로그래밍과 프로토콜지향 프로그래밍에서는 주로 구조체로 구현
 상속을 구현해야하거나 참조를 전달해야하는 경우에만 클래스로 구현
 */


