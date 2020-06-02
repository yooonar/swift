import UIKit

var temperature = 10
print(temperature)

switch temperature {
case 0...49 where temperature % 2 == 0 :
    print("Cold and even")
    fallthrough
case 50...79 where temperature % 2 == 0 :
    print("Warm and even")
    fallthrough
case 80...110 where temperature % 2 == 0 :
    print("Hot and even")
    fallthrough
default:
    print("Temperature out of range or odd")
}

print("finish")
