import UIKit
import Foundation

//var greeting = "Hello, playground"

// ⓪Hello, world! と入力（入出力）
print("Hello, world!")

// ①型について

// 基本の形
var myValuable = 42 // 変数の定義
myValuable = 50 // 変数に値を入れる
print(myValuable) // 値が50に変わる事を確認
let myConstant = 40 //定数の定義

// 明示的、黙示的な型定義
let implicitInteger = 70 // integer型っぽく入力
let implicitDouble = 70.0 // double型だと値がこの形
let explicitDouble : Double = 70 // integer型でもOKな値だけどdouble型で定義

// 型の明示的な変更（キャスト？）
let label = "The width is " // String型で定義
let width = 94 // int型で定義
let widthLabel = label + String(width) // int型のwidthをキャストして結合する

// 文字列の中に数値を入れたいとき
let apples = 3
let orranges = 5
let appleSummary = "I have \(apples) apples."
let orrangeSummary = "I have \(apples + orranges) pieces of fruit." // 数値を合計した後にキャストすることもできる

// 複数行にまたがる値の入力 """の中は全て文字列となる
let quatation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + orranges) piecies of fruit."
"""

// 配列や辞書型を使用する
var shoppingList = ["catfish", "water", "turips"]     // javaと違ってshoppingList[]とは宣言せず、入力値から判定
shoppingList[1] = "bottle of water" // 代入
print(shoppingList)

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
] // 代入

occupations["Jayne"] = "Public Relations" // 辞書の挿入
print(occupations)

shoppingList.append("blue paint")
print(shoppingList) // 配列の挿入

// 空の配列や辞書を使用する
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:] // キーと値の型を指定して初期化

// 型情報を推測できる場合の初期化
shoppingList = []
occupations = [:]

// ②制御フロー
let individualScores = [75, 43, 103, 87, 12] // ここには,不要
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// if let を使うとnilを値として許容できるようになる
var optionalString: String? = "Hello!"
print(optionalString == nil) // falseになる

// if let を使用した例
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

// 明示的にOptional型として定義するときには?を使う
let nickname: String? = nil // 変数Stringの後ろに?をつける ※コンパイルエラーにならない
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"

// 値を更新しない場合は同じ変数名を使っても良い（わからないので飛ばす）
//if let nickname {
    //print("Hey, \(nickname)")
//}
// switch文の書き方
// "Is it a spicy red pepper?"と出力される
let vegetable = "red pepper"
switch vegetable {
case "celery":    // セロリの場合
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":    // きゅうりかウォータークレスの場合
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):    // "pepper"という文字列を含む場合
    print("Is it a spicy \(x)?")
default:    // どれも当てはまらない場合
    print("Everything tastes good in soup.")
}

// for-in構文の使い方
// 配列の定義にもletが使われる
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
// for 定数名 in コレクション名など ..が基本形？
// Prime（素数）, Fibonacci（フィボナッチ数列）, Square（累乗）の配列について大小比較をそれぞれ繰り返す
// Primeを順番に大小比較し、Fibonacciの値は13より小さいため更新なし。Squarehで16から大小比較。
for (_, numbers) in interestingNumbers { // for(_, XXX) in はルール？
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
// インデックスの範囲を指定する書き方
// 0~3までのiを足し算
var total = 0
for i in 0..<4{
    total += i
}
print(total)

// while文の使い方
// nを２倍する。条件はn<100。n=64の時の処理でn=128となり、ループから抜ける。
// while文は条件式の更新処理が構文自体に組み込まれているわけではないため、無限ループ処理に注意(while ture{}など)
var n = 2
while n < 100 {
    n *= 2
}
print(n)
// repeat-while文の使い方
// 条件判定で処理しない条件だとしても、一度だけは必ずループを回してくれる。
// 出力結果は上のwhile文と同じ。
var m = 2
repeat {
    m *= 2
} while m < 100
    print(m)

// ③関数とClosures
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")    // 呼び出す形は左記のようになる

// 引数ラベルを設定しない場合
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "John", day: "Wednesday")    // 呼び出す形は左記のようになる

// 計算するための関数 引数：scores(int型)、戻り値(min(int型)、max(int型)、sum(int型))
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    // 初期化
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    // 大小比較をしながら、取得してきたscoreを順番に足して合計値も求める
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return(min, max, sum)
}
// タプルを使用して複数の値を戻り値にする
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)

// 関数のネスト化
// ネスト化されていると外の関数で宣言されている変数を操作することができる
func returnFifteen() -> Int {
    var y = 10
    func add(){
        y += 5    // add()関数で定義されていないyを操作する
    }
    add()    // add()関数の呼び出し
    return y
}
returnFifteen()    // returnFifteen()関数を戻り値として返す

// ファーストクラス型では、関数の引数や戻り値に関数を指定できる
// Int型からInt型に変換
func makeIncrementer() -> ((Int) -> Int) {
    // return addOne から呼び出されて処理を行う
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne    // 戻り値にaddOne関数を指定する
}
var increment = makeIncrementer()
increment(7)

// 関数を他の関数の引数として受け取ることができる
// (Int) -> Boolで引数の型と戻り値の型を表示
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    // list（コレクション）から値を取り出して繰り返す
    for item in list {
        //
        if condition (item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)    // lessThanTen を引数として受け取る

// Closure の無名関数（{}で囲む）
// {()} がClosuresの基本形
// 上で定義したnumbersの値を1つずつ取り出して3倍にする
numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})

// Closuresの型が明確な場合
// 引数と戻り値を省略した書き方をすることができる
// xxx.map は全要素に処理を行いたいときに使用する
let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)
// Closuresが関数の唯一の引数である場合、()を完全に省略することができる
// $0,$1はClosuresにおける引数の省略形
// numbersの値をsortする
let sortedNumbers = numbers.sorted{ $0 > $1 }
print(sortedNumbers)

// ④オブジェクトとクラス
// classの後ろにクラス名で宣言
class Shape {
    var numberOfSides = 0
    func SimpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
// メソッドの呼び出しには.を使用する。
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.SimpleDescription()

// プロパティの使い方→宣言またはイニシャライザで値を設定する
// イニシャライザ…初期化する特殊なメソッド
class NamedShape {
    // int型を指定する
    var numberOfSides: Int = 0
    var name: String
    // init()と宣言する
    // イニシャライザの引数は関数の呼び出しのような形で渡される
    init(name: String){
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
// サブクラスはクラス名の後に:をつける
class Square: NamedShape {
    var sideLength:Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        // superクラスの呼び出し
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    // スーパークラスをオーバーライドする時はoverride
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


//課題
class Circle: NamedShape{
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        //superクラスの呼び出し
        super.init(name: name)
        numberOfSides = 3
    }
    func area() -> Double {
        return radius * radius * 3.14
    }
    //オーバーライド
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)."
    }
}

// ゲッターとセッター
// ①サブクラスが宣言している値（sideLength）を設定
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init (sideLength: Double, name: String) {
        self.sideLength = sideLength
        // ②superクラスのイニシャライザを呼び出す
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {
        // 値を取得
        get {
            return 3.0 * sideLength
        }
        // 値をセット　set(aaa)のようにすると明示的に指定できる
        set {
            sideLength = newValue / 3.0
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
// イニシャライザを使うと他のクラスでも定義した変数を使うことができる　※今回ならsideLength
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// 三角形の辺の長さと四角形の辺の長さが常に同じになる
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        // プロパティの変更前に処理を書く
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

