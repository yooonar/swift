import UIKit

let name = "Swift"
print(name)

// 상수는 변경 불가
// name = "Python"

// 숫자 표현
0.23
1.23e4 // 10진수 지수
1_000_000 // 1,000,000

10
0b1010 // 2진수; 접두어 0b
0o12 // 8진수; 접두어 0o
0xA // 16진수; 접두어 0x

print(Int8.min, Int8.max)
print(Int16.min, Int16.max)
print(Int32.min, Int32.max)
print(Int64.min, Int64.max)

// 메모리 공간 크기 확인 음수가 없는 UInt
print(MemoryLayout<UInt8>.size) // 1byte 저장 가능
print(MemoryLayout<UInt16>.size) // 2byte 저장 가능
print(MemoryLayout<UInt32>.size) // 4byte 저장 가능
print(MemoryLayout<UInt64>.size) // 8byte 저장 가능

let num = 123
// 상수 타입 구하기
print(type(of: num))
