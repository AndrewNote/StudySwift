# Optional(옵셔널)
- nil은 값이 없을 수도 있다는걸 표현하는 키워드 (실제 값이 없는게 아님)
- nil은 실제 값이 없음을 한번 걸러주는 역할도 함
- 옵셔널타입에 값을 넣지 않으면 자동으로 nil이라는 임시값이 넣어짐
- 메모리 주소에 nil값이 있으면 임시값이 있기에 에러가 나지 않지만 실제 값이 없으면 에러가 발생
- 옵셔널끼리는 연산 불가능
- 값이 없는 상태에서 접근하면 에러 발생
```swift
var fruit: String   // 타입만 선언
print(fruit)        // 값이 없으므로 에러

var fruit: String?
print(fruit)        // nil

var fruit: String? = "apple"
var fruit: Optional<String> = "apple"   // 옵셔널 정식 문법

var apple: String? = nil    // 옵셔널 타입에는 nil값을 넣을 수 있다.

var a: Int? = 11
var b = a           // Optional(11)값이 b에 복사됨

var c: Int = 4 
b = c           // 일반 타입보다 Optional 타입이 더 큰 범위이기 때문에 Optional 타입으로 담김 
print(c)        // Optional(4) 
```

- Optional 타입 내부는 enum으로 연관값으로 저장됨
```swift
enum Optional<Wrapped> {
    case some(Wrapped)
    case none
}
```


## Optional Unwrapping (옵셔널 타입 추출)
1. Forced Unwrapping(강제 추출): 값이 있다는 것이 확실할 때 사용
```swift
let fruit: String? = "apple"
print(fruit!)              // apple
```

2. nil 확인 후, 강제 추출: if문으로 nil 아닌 것을 확인후 강제로 추출
```swift
if fruit != nil {   // 만약 nil이 맞다면 실행되지 않음
    print(fruit!)        // apple
}
```
3. 옵셔널 바인딩: 바인딩이 된다면, 특정 작업을 하겠다는 뜻
```swift
if let a = fruit {  // fruit를 새로운 상수 a에 담고 있음
    print(a)        // fruit값이 상수에 담긴다면 사용하겠다는 뜻
}                   // nil이면 일반 상수에 담기지 않으므로 if문이 실행되지 않음

// guard문으로 사용가능.
func some(name: String?) {     
    guard let n = name else {   // let n = name의 조건에 해당 되지 않는다면(상수에 담기지 않는다면) 
        return                  // else { return }에서 미리 걸러냄
    }  
    print(n)                    // guard문에서 조기 종료시 실행되지 않음       
}
some(name:"apple") // apple
```

4. Nil-Coalescing(닐 코얼레싱): 값이 없을경우를 대비해서 기본값을 제시
- 옵셔널 표현식 ?? 표현식(default Value)
- 옵셔널 표현식이 nil이면 ?? 뒤에있는 표현식 사용
- 옵셔녈 표현식에 값이 있으면 값 사용
```swift
var price: Int?
print(price ?? 1000)    // 1000 price에 값이 없으므로 default Value인 1000
price = 200
print(price ?? 1000)    // 200  price에 값이 200이 있으므로 200

// 다른 표현 방법으로 삼항연산자를 사용
price != nil? price! : 1000
```

## Optional Chaining(옵셔널 체이닝)
- 옵셔널 타입으로 선언된 값에 접근해서 속성,메서드를 사용할 때 접근연산자 . 앞에 ?를 붙여야함
- 결과는 항상 옵셔널타입으로 리턴, 체이닝 과정에서 하나라도 nil을 리턴하면 뒤에 표현식은 평가하지않고 nil 리턴
```swift
class AppleStore {
    var name: String?
    var price: Int?
    
    func region(){
        print("made in USA")
    }
}
var iPhone: AppleStore? = AppleStore()
iPhone?.name = "iPhone13 Pro"
print(iPhone?.name)         // Optional(iPhone13 Pro)
print(iPhone?.region())     // made in USA
```








## 함수와 옵셔널타입
- 보통은 함수의 파라미터가 옵셔널타입일 때 nil을 기본값으로 둔다.
- 함수 사용시 옵셔널타입인 파라미터는 아규먼트에 nil을 계속 표기해야하지만 기본값을 nil로 설정하면 생략가능
 
```swift
func fruit(name: String, color:String?=nil) {

}
fruit(name: "apple", color:"red")// 이렇게도 사용 할 수 있음
fruit(name: "apple", color: nil) // 기본값 없을시 이렇게 표기
fruit(name: "apple")    // color 생략
```

## Optional 심화
- 실제적으로 메모리에 값이 없는게 아니라 한번 감싸져 있는것
- 옵셔널 타입의 내부는 열거형의 연관값으로 값이 저장
- .some(연관값): 구체적인 정보가 들어있음
- .none: 구체적인 정보에 값이 없음, 명시적인 열거형으로 표현한 것이고, 일반적으로는 값이 없다는 의미의 nil 키워드를 사용한다.

```swift
enum Optional<Wrapped> {// 제네릭 문법
    case some(Wrapped)  // 구체적인 값이 들어있는 곳
    case none           // nil과 완전히 동일
}

var num: Int? = 11 

var num: Optional = Optional.some(11)
var num: Optional = Optional.none

switch num {    // swift 내부적으로 옵셔널이 이렇게 구현되어 있어서 개발자는 편하게 꺼내서 사용할 수 있는것
case .some(let a):
    print(a)
case .none:
    print("nil")
}
```
