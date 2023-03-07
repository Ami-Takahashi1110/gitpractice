import UIKit

var greeting = "Hello, playground"

// Optional<Wrapped>型
// Optional<Wrapped>型 はWrapped型の存在（none）と不在（some）の2通りを表すことができる（列挙型）
enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}

// .noneはnilと等しいケースで.someがWrapped<>型の存在を表すケース
let none = Optional<Int>.none
print(".none: \String(describing:none)")

let some = Optional<Int>.some(1)
print(".some: \(String(describing:some))")

// .someの場合は型推論ができる（Wrapped<>を省略できる）
let some = Optional.some(1)

// .noneの場合にWrapped<>を省略するときは代入型を指定する必要がある
let none: Int? = Optional.none // Optional<Int>型

// 列挙型ではなくnilリテラルを使用する方法
var a: Int?

a = nil // nilリテラルによる.noneの生成
a = Optional(1) // イニシャライザによる.someの生成
a = 1 // 値の代入による.someの生成

// nilリテラルによる.noneの生成
let optionalInt: Int? = nil
let optionalString: String? = nil

print(type(of: optionalInt), String(describing: optionalInt))
print(type(of: optionalString), String(describing: optionalString))

// nilリテラルにはデフォルトの型が存在しないため、
