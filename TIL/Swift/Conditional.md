# Conditional Statements(조건문)
- 조건에 따라서 어떤 동작을 할지 말지를 정함.
- 논리적 오류에 빠지는것의 주의해야 함
- 모든 가능한 수의 조건을 명시해야 함 (if문은 else, switch문은 default로 그 외의 조건을 명시할 수 있음.)
- swift는 1 < n < 10 성립안됨 n > 1 && n < 10 조건을 사용해야 함

## Pattern Matching 연산자
- 숫자가 범위내에 있는지 확인하는 연산자
- 결과 값은 true / false
```swift
let kid = 1...18
kid ~= 17    // true
```

## 삼항연산자
- 조건 ? 조건이 참일 경우 : 조건이 거짓일 경우
```swift
var age = 17;
age > 19 ? "Adult" : "Minor"    // Minor
```

## 범위연산자
- 내림차순으로 표기 불가능, reversed()를 사용해서 내림차순으로 가능.
- for문에서 주로 사용
```swift
1...9 // 1이상 9이하
1..<9 // 1이상 9 미만
```


## if
- 모든 조건에서 사용할 수 있고 모든 switch문을 if로 변경 할 수 있음
- 조건을 &&, ||, !로 연결할 수 있음
```swift
if true와 false가 결과로 나오는 조건 문장(,로 여러개 연결 가능) {
    
    // 조건 문장에서 true가 나올 시 실행될 코드

} else if { //그 다음 조건문으로 계속 만들어서 다른 조건문을 넣어 사용 가능  

} else { // if와 else if문들에 아무것도 해당 되지 않을 시 else문 실행

}
```

## guard문
- if문 하나만으로 완벽히 수행할 수 있지만 가독성을 위해 사용
- if문 처럼 중첩을 할 필요가 없음, else문을 항상 달아야 한다
- 조건이 true면 그냥 지나가고 false면 else 구문을 수행한 뒤 함수나 반복문 조기 종료(early exit)
- 주로 옵셔널 타입을 안전하게 해제할 때 사용
- 함수종료 시 return이나 throw가 반복문은 break, continue가 반드시 존재 해야하며 없으면 컴파일 에러
- **즉 제어문을 사용할 수 없는 상황이라면(특정 블록 내부)에 위치하지 않는다면 사용할 수 없다!**
```swift
// - id,password 숫자 체크

// if문을 사용할 때 
func check(id: String, password: String) -> String{
    if id.count > 6{
        if password.count > 8{
            return "회원가입이 가능합니다."
        }
        return "password를 확인해주세요"
    }
    return "id 확인해주세요."
}

// guard문을 사용할 때
func check(id: String, password: String) -> String{
    guard id.count > 6 else{ return "id를 확인해주세요"}
    guard password.count > 8 else{ return "password를 확인해주세요"}
    return "회원가입이 가능합니다."
}
```


## switch
- if문보다 가독성이 좋으나 한정적으로 사용가능. 분기처리에 많이 사용함
- 비교하는 변수타입과 case에 적을 타입의 종류는 같아야 함
- 실행하려는 코드가 없어도 **break 키워드를 반드시 입력!**
- fallthrough 키워드: 바로 뒤에 문장을 조건 상관없이 무조건 실행

```swift
var fruit: String = "apple"

switch fruit { switch 변수(비교할 값)
case "apple","cherry":  // ,로 값 여러개 설정 가능
    print("red")
case "banana":          // switch 변수에서 나올 수 있는 값
    print("yellow")
    fallthrough         // fallthrough 바로 뒤에 문장을 조건 상관없이 무조건 실행
case "melon":
    break               // 실행하려는 코드가 없어도 break 키워드를 반드시 입력!

default:                // 명시한 조건에 포함되지 않을 모든 상황에서 실행될 문장
    print("not color")
}
```

### default를 안 적어도 되는 경우
- 변수의 모든 경우의 수를 switch에 명시한 경우 default문은 사용하지 않아도 됨
```swift
var isTrue = true

switch isTrue {
case true:
    print("true")
case false:
    print("false")
}
// 예시의 switch문의 경우 모든 경우의 수를 명시했기때문에 default를 적지 않아도 오류가 발생하지 않는다.
```

### switch 범위 매칭
- case문 안에서는 부등식을 사용할 수 없음
- 범위연산자를 통해서 범위를 한정지어야 됨
```swift
switch score {
case score >= 80 && score < 90:      // 잘못된 예시
    print(B rank)
case score >= 70 && score < 80:    // 잘못된 예시
    print(C rank)
default:
    break    
}

// 범위연산자를 통해서 범위를 매칭 시킴
switch score{
case 80..<91:
    print("80이상 91 미만의 숫자")
case 60...70:
    print("60이상 70이하의 숫자")
default:
    break
}
```

### 바인딩(새로운 변수로 할당)과 where절(switch문에서 조건 확인)
- case문에서 조건문(if)을 사용하고 싶을 때 where절 사용
```swift
var num = 11

switch num{
case let a where a <= 11: // let a = num 으로 바인딩
    print("11이하의 숫자")
case let a where a % 2 != 0:
    print("홀수")
}
default:
    break
```