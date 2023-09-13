# Tuple(튜플)
- 데이터의 조합으로 어떤 형태든 만들 수 있는 타입
- 2개이상의 연관된 데이터(값)를 저장하는 Compound(복합/혼합) 타입
- 데이터의 종류 및 갯수를 추가/삭제 불가, 변경가능.
- Function는 반환값이 하나지만 묶음으로 반환할 때 Tuple을 사용

```swift
let price = (1000, 5000) // type inference(타입추론), 멤버이름 생략가능
let price : (Int, Int) = (1000, 5000)

var apple = ("red", 1000, "korea")
apple = ("green", 3000, "USA") // 수정 가능
apple = ("green", "japan") // 추가,삭제 불가능
apple.0 // green  변수명.0 = 첫번째 데이터 접근
```

## Named Tuple
- 코드의 가독성을 높이기 위해 이름을 지을 수 있음
```swift
let apple = (color: "red", price: 1000, region: "korea")

apple.0 // red 
apple.color //red, 멤버 이름으로 접근하는 방법은 코드의 가독성이 높아짐
```

## Decomposition(튜플의 분해)
- 튜플의 데이터 묶음을 각각 하나씩 대칭해서 변수에 저장가능
```swift
let (color, price, region) = ("red", 1000, "korea") 
color // red
price // 1000
region //korea
```

### Array와 Tuple의 차이점
|Array|Tuple|
|:---:|:---:|
|같은 타입의 멤버들이 순서를 가진 형태의 Collection 타입임|Collection 타입이 아닌 data의 묶음이라 할 수 있음|
|Sequence 프로토콜을 채택함으로 loop를 돌릴 수 있음|loop를 돌릴수 없음(순서가 없기 때문)|
|배열의 원소 추가/삭제 가능|만들때 결정되므로 데이터 타입이 결정되므로 추가/삭제 불가|

### Tuple과 Switch활용 
```swift
let fruit = (name: "apple", color: "red")

switch fruit {
case ("apple", "red"):
    print("빨간 사과 입니다.")
case ("apple", "green"):
    print("초록 사과 입니다.")
default:
    break
}
```
### 튜플의 값의 비교 (실제 사용하는 경우는 흔하지는 않음)

(1, "banana") < (2, "apple")   // true, 1이 2보다 작고; banana와 apple은 비교하지 않기 때문
(3, "apple") < (3, "lemon")    // true 왼쪽 3이 오른쪽 3과 같고 apple은 lemon보다 작기 때문

## Enumerate
- 열거된 것들을 Named 튜플 형태로 한개씩 전달
- 하나씩 꺼낼때마다 값만 반환하는게 아니라 index까지 같이 반환해줌

```swift
let fruit = ["apple","banana","cherry"]

for tupleFruit in fruit.enumerated() {
    print(tupleFruit)
}
// (offset: 0, element: "apple") (offset: 1, element: "banana") (offset: 2, element: "cherry")


// offset과 element 생략해서 출력 가능
for tupleFruit in fruit.enumerated() {
    print("\(tupleFruit.0), \(tupleFruit.1)")
}
// 0,apple 1,banana 2,cherry
```
