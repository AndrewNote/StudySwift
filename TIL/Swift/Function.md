# Function(함수)
- 어떤 기능을 하는 코드 모음이며 ⭐️입력과 출력이 있을수도 없을수도 있음 
- definition(정의)와 call(호출)로 2단계로 실행됨. **즉 정의만 하고 실행하지 않으면 함수를 사용할 수 없음**
- 반복되는 동작을 단순화해서 재사용을 쉽게 할 수 있음 (단순화) / 코드를 논리적 단위로 구분 할 수 있음 (기능 모듈화)
- 소문자로 시작, 뒤에()로 실행하면 함수이다. ex) print()
- 함수는 원칙적으로 output(리턴값)이 한개만 존재하기 때문에 여러개의 값을 반환할 수 없지만, 어떤 묶음 값으로 반환하는 것은 가능 ex) Tuple

## Function 기본 구조 (Definition & Call)
|return값 없는 경우|return값 있는 경우|
|:---:|:---:|
|함수의 결과로 값을 갖지 않음 <br/> (동작만 수행)|함수의 결과로 값을 가짐|
|메모리 공간을 만들지 않음|값을 반환하기 위한 임시 메모리 공간을 별도로 만듦|
|(함수 실행시)CPU 제어권|CPU 제어권 + 리턴값|

**예시 코드**
```swift
// Definition(정의)
func fruit(a: String, b:Int) { // 함수에 input이 있는 경우 ,로 여러개 표기 가능
    print(a)
    print(b)
}
// Call(호출, 사용)
fruit(a: "apple", b: 1000)     // input이 있는 함수를 실행하려면 반드시 타입에 맞는 argument를 적어야 한다.
fruit(a: "banana", b: 3000)    // 여러번 사용 가능

func fruit() {          // 함수에 input이 없는 경우
    print("apple")
}

func fruit() -> Void {  // 함수에 output이 없는경우 Void를 작성하거나 생략해도 됨
    print("apple")
}

func fruit() -> String { // output이 있는경우 return 타입을 꼭 적는다.
    return "apple"      // output을 선언한 경우 반드시 return으로 반환해야 한다.
}
```
## Parameter
- Parameter는 함수 정의시, 입력값으로 사용되는 변수(함수 내부에서만 사용)
- 파라미터 또는 매개변수,인자라고도 함
- input이 여러개인 경우 ,로 여러개 표기 가능
- 함수의 입력값으로 사용되는 변수는 변하지 않는 값**⭐️상수**
- 파라미터는 **상수**값이므로 변경하려고 한다면 내부에서 바인딩해서 변경해야 함

## Argument
- 함수 호출시, 함수가 필요한 파라미터 타입과 일치하는 실제 값(함수 외부에서 사용)
- 아규먼트 또는 인수라고 함
- Argument Label, Parameter Name을 둘다 사용할 때 공백으로 구분해서 사용

### Argument Label
- 함수에서 사용할 파라미터 이름과 외부에서 호출할 아규먼트 이름을 다르게 설정할 수 있음
- 함수를 작성할 때는 간편하게 작성할 수 있으며, 함수값을 입력할 때는 구체적으로 명시할 수 있음
- 와일드카드 패턴으로 생략할 수 있으며 파라미터값만 적을 경우 아규먼트는 파라미터 값을 사용

**예시 코드**
```swift
func fruit(fruitName a: String, fruitPrice b: Int){ 
    print("\(a)는 \(b)원 입니다") // 함수를 작성할 때는 간편하게 작성할 수 있으며
}
fruit(fruitName:"apple", fruitPrice:1000) // 함수값을 입력할 때는 구체적으로 명시해 줄 수 있음

//Argument Label 생략가능
func addFunction(_ firstNum: Int, _ secondNum: Int) {
    print(firstNum + secondNum)
}
addFunction(4, 11)  // Argument를 적지 않아도 된다.
```
### Variable parameters (가변 파라미터)
- 하나의 파라미터로 2개 이상의 아규먼트를 전달할 수 있다.
- 아규먼트는 배열형태로 전달된다.
- 가변 파라미터는 함수마다 한개씩만 선언할 수 있다.

**예시 코드**
```swift
func average(_ numbers: Double...) Double {
    var total = 0
    for num in numbers {
        total += num
    }
    return total / Double(numbers.count)    // 3
}
average(1,2,3,4,5)
```

### Default값 설정
- 아규먼트에 값이 있을 경우 입력한 값으로 사용
- 값이 없을 경우 Default로 설정한 값 사용

**예시 코드**
```swift
func addFunction(_ num1: Int,_ num2: Int = -1) -> Int {
    return num1 + num2
}

addFunction(5)      // 5 - 1(default값) = 4
addFunction(5,3)    // 5 + 3 = 8

func appleStore(Device: String, version: Int? = nil {
    print( \(Device) \(version) )
}
appleStore(Device: "iPhone", version: 13)
appleStore(Device: "iPhone")    // 옵셔널 사용 시 아규먼트 생략 가능
```

### 함수를 지칭할 때
- 개발자 문서를 읽을 때 필요

**예시 코드**
```swift
func fruit(name:String,price:Int){
    print("\(name) is \(price)")
}
var some = fruit    // () 생략해서 변수에 넣으면 변수도 똑같은 함수를 가리키게 된다.
some()              // 따라서 변수 some은 fruit 함수와 똑같은 기능을 가지게 된다.

var some = fruit(name:price:)  // 파라미터가 있는경우 함수를 가리키고 싶을 때의 표기
some("apple", 1000)

var some = fruit(_:_:)  // 아규먼트 레이블이 생략된 경우
```

## Overloading(오버로딩)
- 같은 이름의 함수에 파라미터를 다르게 선언하여 하나의 함수에 여러개의 함수 기능을 만듬
- 파라미터 수, 파라미터 타입, 아규먼트 레이블, 리턴 타입을 모두 포함해서 함수를 다르게 식별

```swift
func calc(plus1: Int,plus2: Int) -> Int{
    return plus1 + plus2
}
func calc(minus1: Int,minus2: Int) -> Int{
    return minus1 - minus2
}
func calc(multiply1: Int,multiply2: Int) -> Int{
    return multiply1 * multiply2
}
func calc(division1: Int,division2: Int) -> Int{
    return division1 / division2
}

calc(plus1: 11, plus2: 4)   // 15
calc(minus1: 11, minus2: 4) // 7
```
