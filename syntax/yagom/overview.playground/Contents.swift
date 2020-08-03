import UIKit

/*
 같은 표현식
 Dictionary<String, Any>                            ===     [String: Any]
 
 Array<Int>                                         ===     [Int]
 
 Optional<Bool>                                     ===     Bool?
 
 func foo() -> Void { }                             ===     func foo() { }
 
 func bool(closure: (Void) -> Void) -> Void { }     ===     func bool(closure: () -> Void) { }
 
 zoo(closure: { (param: Int) in print(param) } )    ===     zoo( closure: { (param) in print(param) } )
 zoo(closure: { (param: Int) in print(param) } )    ===     zoo{ (param: Int) in print(param) }
 zoo(closure: { (param: Int) in print(param) } )    ===     zoo{ (param) in print(param) }
 zoo(closure: { (param: Int) in print(param) } )    ===     zoo( closure: { print(param) } )
 zoo(closure: { (param: Int) in print(param) } )    ===     zoo { print(param) }
 */
print("yagom syntax overview")
