import UIKit

/*:
 # Stored Properties 저장 속성
 
 형식 내부에 변수와 상수를 선언하면 속성이 된다 = 저장 속성
 저장 속성은 클래스와 구조체에서 선언할 수 있다.
 저장 속성은 인스턴스에 속하는 속성이다.
 그래서 인스턴스가 생성될 때마다 새로운 메모리 공간이 생성된다.
 바꿔말하면 속성에 저장되는 값은 인스턴스마다 달라진다.
 
      Variable Stored Property
                ↑
    var name: Type = DefaultValue
 
    let name: Type = DefaultValue
                ↓
      Constrant Stored Property
 
 위 문법을 보면 변수 / 상수 선언 문법과 동일하다.
 선언과 동시에 기본값을 지정하는 경우에는 형식 추론을 통해 자료형을 생략할 수 있다.
 기본값을 생략한다면 자료형을 명시적으로 선언해야하는 것도 변수 / 상수 선언 문법과 동일하다.
 
 var 키워드로 선언하면 = 변수 저장 속성
 이름 그대로 변수이기 때문에 저장된 값을 언제든지 바꿀 수 있다.
 
 let 키워드로 선언하면 = 상수 저장 속성
 인스턴스 초기화가 완료된 후에는 값을 변경할 수 없다.
 그래서 상수 저장 속성의 값은 대부분 선언 시점에 저장한다.
 다른 요소에 의존적인 값이라면 생성자에서 저장한다.
 생성자 실행이 완료되면 인스턴스 초기화가 완료되고, 이후에는 저장된 값을 바꿀 수 없다.
 */


// 새로운 클래스를 만들고 저장 속성을 선언해보자.
class Person {
    let name: String = "Jone Doe"
    var age: Int = 33
}


/*:
 # Explicit Member Expression 명시적 멤버 표현식
    instanceName.propertyName
    instanceName.propertyName = NewValue
 
 */
// 새로운 인스턴스를 만들고 속성에 저장된 값을 확인해보자.

// 새로운 인스턴스 만들기
let p = Person()

// 인스턴스명.속성명 ← Dot Syntax: 점 문법
// Explicit Member Expression: 명시적 멤버 표현식
p.name
p.age

// 속성에 새로운 값을 변경
p.age = 30

// Error: Cannot assign to property: 'name' is a 'let' constant
// 상수 let 으로 선언한 경우 변경이 불가하다.
// p.name = "New Name"


// 새로운 구조체 만들기
struct Person2 {
    let name: String = "Jone Doe"
    var age: Int = 33
}

// let p2 = Person2()
var p2 = Person2()

p2.name
p2.age

// Error: Cannot assign to property: 'p2' is a 'let' constant
// let p2 = Person2() 생성한 인스턴스는 상수인 let 이다.
// age 속성은 var 로 선언되어 있어서 문제가 없어보이지만, 여기서 문제는 인스턴스 p2 를 상수 let 으로 저장하고 있어 문제가 된다.
// 이렇게 구조체 인스턴스를 상수에 저장하면 구조체에 포함된 모든 속성이 상수가 되기 때문에 상수 let 이 아닌 변수 var 로 변경해줘야 한다.

p2.age = 30
/*
 구조체의 가변성은 속성의 가변성에 영향을 준다는 점을 꼭 기억해야함!!!
 저장 속성을 바꿔야한다면 구조체 인스턴스를 변수에 저장해야한다.
 */


/*:
 # Lazy Stored Properties 지연 저장 속성
 
          Stored Property
 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
 ↑                 ↑
 initialization    Final Access
 
        Lazy Stored Property
 □□□□□□□□□□□□□□□□□□■■■■■■■■■■■■■■■■■
 ↑                 ↑
 initialization    Final Access
 
 lazy var name: Type = DefaultValue
 
 지연 저장 속성
 저장 속성이 초기화 되는 시점 = 인스턴스 초기화 시점
 
 지연 저장 속성은 초기화를 지연시킨다.
 인스턴스가 초기화되는 시점에 초기화 되는 게 아니라 속성에 처음 접근하는 시점에 초기화 된다.

 저장 속성 문법 앞에 lazy 키워드만 붙이면 지연 저장 속성으로 선언된다.
 다만, 초기화 시점이 지연되기 때문에 몇가지 제한이 있다.
 
 지연 저장 속성은 인스턴스가 초기화 된 이후에 개별적으로 초기화 된다.
 그래서 항상 변수 저장 속성으로 선언한다.
 쉽게 말해서 lazy var 로 선언하고 lazy let 은 사용할 수 없다.
 
 그리고 생성자에서 초기화하지 않기 때문에 선언 시점에 기본값을 저장해야한다.
 
 */

// 이미지를 저장할 구조체 선언
// 초기화 시점을 보는 것이 목적이기 때문에 실제로 이미지를 저장하지는 않는다.
// 대신 생성자에서 간단한 로그를 출력하도록 한다.
struct Image {
    // 생성자
    init() {
        print("new image")
    }
}

// 새로운 구조체 선언
struct BlogPost {
    // 제목과 내용은 비교적 작은 크기의 메모리 공간에 저장할 수 있어서 별다른 오버헤드가 없다.
    let title: String = "Title" // 제목 속성
    let content: String = "Content" // 내용 속성
    
    // 반면 이미지는 대부분 바이너리 형태로 저장되어있고 나머지 두 속성과 크기를 비교해보면 보통 수십배에서 수백배 이상 차이가 난다.
    let attachment: Image = Image() // 첨부파일 속성
}

// 새로운 인스턴스 선언
// attachment 속성을 저장 속성으로 선언하면 인스턴스가 초기화되는 시점에 새로운 이미지 인스턴스가 저장된다.
// 그래서 이 코드를 실행하면 생성자에 추가해둔 로그 new image 가 출력된다.
let post = BlogPost()
// output: new image

/*
 이런 방식은 매번 인스턴스를 생성할 때마다 파일이나 네트워크에서 이미지를 가져온다음, 메모리 공간에 복사해야하기 때문에 오버헤드가 발생한다.
 attachment 속성을 항상 사용한다면 어쩔 수 없지만 이 속성에 접근하지 않는 경우에는 불필요한 메모리를 사용하게 된다.
 attachment 를 지연 저장 속성으로 바꾸고 결과를 비교해보자.
 */


struct BlogPost2 {
    let title: String = "Title"
    let content: String = "Content"
    
    // lazy let attachment: Image = Image() ← Error! : Expected 'lazy' cannot be used on a let
    // lazy 는 let 상수로는 사용 불가, var 로 변경해줘야함
    lazy var attachment: Image = Image()
    
    // 날짜 속성 추가 - 현재 날짜로 초기화
    let date: Date = Date()
}

var post2 = BlogPost2()
/*
 post2 의 경우 실행해도 로그 new image 는 출력되지 않는다.
 BlogPost2 인스턴스가 생성되고 Title 속성과 Content 속성은 초기화 되었지만 attachment 속성은 아직 초기화되지 않았다.
 바로 이어서 속성에 접근해보자.
 */

// post2.attachment 속성에 접근하는 경우 오류 발생
// Error! : Cannot use mutating getter on immutable value: 'post2' is a 'let' constant
// 구조체 인스턴스를 상수 let 으로 저장하고 있다. 이렇게 하면 모든 속성이 상수가 된다.
// 다시말해 인스턴스가 초기화 된 다음에는 값을 변경할 수 없다.
// attachment 에 접근하는 시점에 값을 바꿔야 하는데(초기화 해야하는데) 구조체 전체가 상수가 되어있기 때문에 값을 바꿀 수 없다.
// 구조체에서 지연 저장 속성을 사용한다면 인스턴스를 변수에 저장해야한다.
// let post2 = BlogPost2() 이 아닌 var post2 = BlogPost2() 로 변경해야함
// 속성에 처음 접근하는 시점에 생성자가 실행고 init() 에 있는 print 함수가 실행됨
post2.attachment

/*
 BlogPost 구조체를 보면 처음 두 속성 Title, Content 는  문자열 리터럴로 초기화 하고 있다.
 보통은 이렇게 리터럴로 초기화 하는데 마지막 속성 attachment 를 보면 생성자를 호출하고 있다.
 여기에는 함수를 호출하는 코드를 써도 되고, 연산자로 계산하는 코드를 써도 된다.
 표현식이 리턴하는 값이 속성 형식과 동일하다면 문제없다.
 
 이 패턴을 좀 더 응용해보자.
 
 let date: Date = Date() 속성을 추가해 현재 날짜로 초기화한다.
 이 속성에 저장된 날짜를
 */

