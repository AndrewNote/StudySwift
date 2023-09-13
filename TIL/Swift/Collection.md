# Collection(컬렉션)
- 데이터를 효율적으로 관리하기 위한 자료형
- Array, Dictionary, Set
- 주로 서버에서 데이터를 받아올때 Dictionary로 받아오고 Array 형태로 바꿔서 사용

## Array
- 1개의 배열에 동일한 타입의 데이터만 담을 수 있다.
- 데이터를 순서대로 저장, 순서가 있기 때문에 값은 중복가능

```swift
let fruit: Array<String> = []   // 정식 문법
let fruit: [String] = []        // 단축 문법
let fruit = Array<String>()      // ()은 생성자를 의미!
let fruit = [String]()

// 기본
fruit.count         // 5
fruit.isEmpty       // false
!fruit.isEmpty      // true
fruit.contains("blueberry") // false
fruit.randomElement()       // 랜덤으로 하나 추출

// 인덱스 접근
let fruit = ["apple","banana","cherry","durian"]
fruit[1]        // banana
fruit.startIndex // 0
fruit.endIndex  // 4 메모리 주소의 끝의 주소를 말하기 때문에 마지막 0,1,2,3,
fruit.firstIndex(of: "banana")  // 1    인덱스를 앞에서부터 찾아서 앞에서 몇번째인지
fruit.lastIndex(of: "banana")  // 1     인덱스를 뒤에서부터 찾아서 앞에서 몇번째인지 (중복을 찾을 때 사용)
fruit[fruit.startIndex]
fruit[fruit.endIndex - 1]

// 요소 추가
fruit += ["eggfruit"]
fruit.append("eggfruit") // 배열 마지막에 추가
fruit.append(contentsOf: ["eggfruit","fig"]) // 배열 마지막에 추가

// 요소 삽입
fruit.insert("apricot", at:0) // ["apricot, "apple", "banana", "cherry", "durian"]
fruit.insert(contentsOf:["blueberry","blackberry"],2)
//["apple","banana","blueberry","blackberry","cherry","durian"]

// 요소 교체
fruit[1] = "blueberry"
fruit[0..2] = ["blueberry"] // 범위로 교체 (교체 숫자가 짝이 안 맞아도 됨)

// 요소 삭제
fruit[0...3] = []
fruit.remove(at: 1) // 1번째 요소 삭제
fruit.removeSubrange(0...3)
fruit.removeAll()   // 모두 삭제
fruit.removeAll(keepingCapacity: true) // 저장공간은 일단은 보관해 둠 (안의 데이터만 삭제)
// 다시 할당할때 더 빨리 할당할 수 있다.

// 아래의 기능은 옵셔널로 반환되기 때문에 사용하려면 옵셔널 바인딩을 통해서 사용해야 한다.
fruit.first     // apple
fruit.last      // durian
```

## Dictionary(딕셔너리)
- 데이터를 Key(키)와 Value(값)으로 하나의 쌍으로 만들어 순서가 없는 저장
- key 값은 유일해야함(중복 불가능), value는 중복 가능
- 동일한 타입쌍으로 데이터만 담을 수 있다 ([Int:String]으로 담았다면 이 딕셔너리는 이 형식으로만 담아야한다.)
- 값만 따로 검색하는 방법은 제공하지 않음
- Dictionary의 값에 또 다른 딕셔너리 또는 배열을 사용해서 중첩적으로 사용 가능
- 원하는 value를 찾을 때 Array는 길면 앞에서부터 하나하나 값을 찾아야 하지만
- 딕셔너리의 각 value마다 Hashable로 key의 고유한 값을 설정하면 찾기 빠르다.
- **딕셔너리의 key값은 Hashable 해야함.**

```swift
var fruit: [String: String] = [:]   // 단축문법
var fruit: Dictionary<String, String> // 정식문법

var fruit = ["a": "apple","b":"banana","c":"cherry"]

// 기본
fruit.count     // 3
fruit.isEmpty   // false

// 키값 으로 탐색
fruit["a"]  // Optional("apple"), String?으로 반환
fruit["g"]  // nil, 옵셔널 타입이기 때문에 값이 없으면 nil 값 반환
fruit["g", default:"grape]  // 키 g가 없다면 기본값 grape 반환, 일반 String으로 반환

// 전체 키값만 탐색
fruit.keys    // ["a","b","c"]

// 전체 값만 탐색
fruit.values    // ["apple","banana","cherry"]

// 키값 업데이트
fruit["b"] = "blueberry"
fruit.updateValue("durian", forKey: "D") // 기존에 키값이 있으면 덮어쓴다.

// 키값 삭제
fruit["a"] = nil
fruit.removeValue(forKey: "a")  // 삭제후 값 리턴

// 랜덤
fruit.randomElement()   // Tuple 형태로 옵셔널로 리턴

if let a = fruit.randomElement() { // 옵셔널 형태이기 때문에 실제로 사용하려면 바인딩해서 사용
    print(a)
}

// 딕셔너리 비교
var fruit1 = ["a": "apple","b":"banana","c":"cherry"]
var fruit2 = ["a": "apple","b":"banana","c":"cherry"]
fruit1 == fruit2    // true 딕셔너리는 순서상관없이 비교 가능

//key와 value인 한 쌍의 값을 관리하기에 튜플이 최적이기 때문에 아래 처럼 사용하는 경우가 많다.
for (key,value) in dict {
    print("\(key): \(value)")
}

for (key, _) in dict {
    print("Key : \(key)")
}

for (_,value) in dict {
    print("Value: \(value)")
}
```

### Hash, Hashable, HashValue
- 어떤 타입이 Hashable 하다는건 해시 함수의 input으로 들어갔을 때 항상 동일한 결과가 나오는 것.
- 값의 유일성을 보장하고 검색 속도가 상대적으로 빠름
- **HashTable의 자료구조상 빠른 검색 알고리즘에 사용 됨**
- Swift의 기본 타입은 모두 Hashable

## Set(집합)
- 집합과 같은 연산을 제공하는, 순서가 없는 저장
- Array와 구분이 안되기 때문에 생성시 타입 선언을 꼭 해야함
- 요소 중복 해도 됨 (각 요소는 유일한 값 - Hashable)
- Hashing 알고리즘을 사용하므로 정렬순서보다 검색속도가 중요한 경우에 사용

```swift
var set: Set<Int> = [1, 1, 2, 2, 3, 3, 3]   // 생성시 꼭 타입 선언
var subSet: Set<Int> = [1,2,3,4,5]
print(set)  // [2,1,3] 출력할때 마다 순서가 바뀐다.

set.update(with: 5)
print(set)  // [2,3,1,5]

// 부분집합 여부 확인
set.isSubset(of: subSet)

// 상위집합 여부
set.isSuperset(of: subSet)

// 서로소 여부
set.isDisjoint(with: subSet)

// 합집합
set.union(subSet)
set.formUnion(subSet)   // 원본 변경

// 교집합
set.intersection(subSet)
set.formIntersection(subSet)    // 원본 변경

// 차집합
set.subtraction(subSet)
set.subtract(subSet)    // 원본 변경

// 대칭차집합
set.symmetricDifference(subSet)
set.formSymmetricDifference(subSet) // 원본 변경
```

### Naming
- 컬렉션을 직접적으로 변경할때는 동사원형으로 사용
- 원본은 변경하지 않고, 리턴형으로 다른 컬렉션을 반환할때는 분사형태로 사용(-ing/-ted)
```swift
fruit.sort()
fruit.sorted()

fruit.reverse()
fruit.reversed()

fruit.shuffle()     // 임의로 뒤섞는다
fruit.shuffled()    // 자신의 요소를 그대로 둔 채 새로운 컬렉션에 임의의 순서로 섞어서 반환
```
