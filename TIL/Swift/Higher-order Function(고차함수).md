- Function를 Parameter로 사용하거나, Function 실행의 결과를 Function로 return하는 Function 
- 함수형 언어를 지향하는 언어에는 기본적으로 내장되어 있다.

## map
- 기존 Array에서 특정 방식으로 매핑해서(매핑방식은 Closure가 제공) **새로운**Array를 return


**기존 Array요소들을 제곱값을 반환**
```swift
let numbers = [1,2,3,4,5]

// 기본형
let square = numbers.map { number -> Int in
    return number * number
}

// 축약형
let square = numbers.map { $0 * $0 }

print(square)    // [1, 4, 9, 16, 25]
```

**단어로 된 Array를 String과 합쳐서 문자 만들기**
```swift
let redColor = ["Apple","Tomato","Strawberry"]

// 기본형
let speak = redColor.map { name -> String in
    return name + " is a red"
}

// 축약형
let speak = redColor.map { $0 +" is a red" }

print(speak) // ["apple is a red", "tomato is a red" ,"strawberry is a red"]
```

<br />

## filter
- 기존 Array에서 특정 조건을 확인 후 true를 반환하는 값을 걸러내서 **새로운** Array를 return

**Array에서 B로 시작하는 단어만 filter**
```swift
let fruit: Array<String> = ["Apple","Banana","Blueberry","Cherry"]

// 기본형
let startWithB = fruit.filter { name -> Bool in
   return name.contains("B")
}
// 축약형
let startWithB = fruit.filter { $0.contains("B") }

print(startWithB) // ["Banana", "Blueberry"]
```

**Array에서 홀수인 숫자만 filter**
```swift
let numberArray: Array<Int> = [1, 2, 3, 4, 5, 6]

// 기본형
let oddNumberArray: Array<Int> = numberArray.filter { number in
    return number % 2 == 1
}

// 축약형
let oddNumberArray: Array<Int> = numberArray.filter { $0 % 2 == 1 }

print(oddNumberArray)    // [1, 3, 5]
```

## reduce
- 기존 Array에서 Closure가 정한 방식으로 결합해서 마지막 결과값을 return
- 초기값 제공할 필요가 있음
