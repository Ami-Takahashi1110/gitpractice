import UIKit
import Foundation
import Security

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
    // イニシャライザの呼び出し
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
    // イニシャライザの呼び出し
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
        // プロパティの変更前に処理を書く
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
    // イニシャライザの呼び出し
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

// triangleAndSquareは引数がsquareとtriangle
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

// オプショナル型を使用するときは?を使用する
// この場合は引数にnilを許容する
let optionalSquare: Square? = Square(sideLength: 2.5, name: "Square")
let sideLength = optionalSquare?.sideLength

// 列挙型と構造体
// enumを使って列挙型を作ることができる
// enumはjavaのときに使わなかったので使い道が知りたい
enum Rank: Int {
    // 列挙体の定義
    case ace = 1  //明示的に1を指定する
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    // swiftではメソッドが追加できる
    // rawValueメソッドはデフォルト値から使われた分だけ1ずつ増加する
    func simpleDescription() -> String {
        // switch文で条件分岐
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
// 変数aceにRankクラスのaceを代入
let ace = Rank.ace
// rawValueプロパティで列挙体の呼び出しができる？
// これはdefaultの処理に入っている？
let aceRawValue = ace.rawValue

//　if let構文 値がnilかどうかをチェックする
// コードを書く行を短縮できる
if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleDescription()
}
    
//
enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        
        switch self {  //selfの値はSuitとなっている
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diammonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts  // 値が指定されていないので、heartsがそのまま代入される
let heartsDescription = hearts.simpleDescription()

// serverの状態をデフォルト値として設定することもできる（特に代入などしていない）
enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")

}

// 構造体を使うときにはstructを使用する
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// Concurrency　非同期処理…asyncを使用する
// Concurrency 非同期処理、並行処理のコードを簡潔かつ安全に記述できる機能
func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}
// 非同期のメソッドを呼び出す際にはasyncを使用する
func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}
// 他の非同期処理と並行して実行するためにはasync letを使用する
func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}
// 非同期処理を構造化するにはtaskを使う
Task {
    await connectUser(to: "primary")
}

//プロトコル javaでいうインターフェースの生成
//プロトコルには関数などの処理を記載しないで、継承したクラスなどで関数を実行する
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
    }
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
    
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// 自身の値を変更する場合、funcの前にmutatingキーワードを書く
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

// 
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

//例外処理(プロトコル)
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
// throwやthrowsで例外処理であることを示している
func send(job: Int, toPrinter printerName: String) throws ->
String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// エラーの処理にはdo-catchを使用できる
do {
    let printerResponse = try send(job: 1040, toPrinter:"Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
// do-catch 複数ケースありパターン
do {
    let printerResponse = try send(job: 1440, toPrinter:"Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire{
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
// オプショナル型で結果を?に代入する
// オプショナルはnilを返すことができる
// javaみたいにnullpointerexceptionを返すことがあると、スマホアプリなどを作る際だと途中で落ちたら使いにくい。
// try?だとエラーを一つ見落としてしまうことがある
let printerSuccess = try? send(job: 1884, toPrinter:"Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Toner")

// スコープを抜けずに必ず実行したい処理があるときはdeferを使用する
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

// ジェネリクスは１度の定義であらゆる型に対応できる
// 関数名<>()で()内に指定する変数型を記載する
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)


// 関数だけでなく列挙型、メソッドや構造体もジェネリクスで対応できる
// 列挙型の例
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// プロトコルを実装した型、特定のスーパークラスを持つクラスなどにも使う際にはwhereを使って実装できる
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
