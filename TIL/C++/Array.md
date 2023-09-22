## std::array 
```cpp
std::array<int, 10>arr; // 크기가 10인 int 타입의 arr 이름을 가진 배열 선언
arr[0] = 1;     // arr의 첫번째 원소를 1로 설정
```
- C 스타일 배열과 똑같은 방식으로 배열 원소에 접근할 수 있는 [] 연산자를 제공
- [] 연산자를 사용할 경우 빠른 동작을 하지만 index 값이 배열의 크기보다 작은지는 검사하지 않음
- 대신 at(index)를 사용하면 index가 유효하지 않을 경우 out_of_range(exception)을 발생시킴 (예외처리 가능)

### at(index)
```cpp
std::array<int, 4>arr = {1, 2, 3, 4};
try {
    std::cout << arr.at(3) << std::endl;   // 에러 아님
    std::cout << arr.at(4) << std::endl;   // out_of_range 예외 발생
} catch (const std::out_of_range& ex) {
    std::cerr << ex.what() << std::endl;
}
```
- 값 또는 참조(reference)로 전달할 수 있음
- C 스타일 배열을 함수에 전달할 때처럼 포인터 연산을 사용하거나 참조 또는 역참조 연산을 하지 않아도 됨
- 때문에 다차원 배열을 전달하는 경우에도 가독성이 좋아짐

### 깊은 복사
```cpp
void print(const std::array<int, 5>& arr) {
    for (auto ele : arr) 
        std::cout << ele << ", ";
}
int main() {
    std::array<int, 5> arr = {1, 2, 3, 4, 5};
    print(arr); // 출력 시 1, 2, 3, 4, 5가 출력 됨
}
```
- print 함수의 매개변수에 전달받을 배열 크기가 고정되어 있어서 다른 크기의 배열을 전달할 수 없음
- ex) std::array<int, 10>을 전달하면 컴파일러는 함수 매개변수와 일치하지 않거나 매개변수 형식으로 변환할 수 없다고 에러를 출력
- 다양한 크기의 std::array 대해 동작하는 범용적인 배열 출력 함수를 만들고 싶다면 print()를 함수 템플릿으로 선언하고, 배열 크기를 템플릿 매개변수로 전달하면 됨
```cpp
template <size_t N>
void print(const std::array<int, N> &arr);
```
- 함수에 std::array 객체를 전달할 경우 새로운 배열에 모든 원소가 복사됨 (자동으로 깊은 복사)
- 만약 자동으로 깊은 복사를 피하고 싶다면 참조 또는 const 참조를 사용하면 됨



### C 스타일 배열 제약 사항
- 메모리 할당과 해제를 수동으로 해야하며 해제하지 않으면 Memory leak이 발생할 수 있고 메모리 영역을 사용 못함
- 배열 크기보다 큰 원소를 참조하는 것을 검사하지 못함 Segmentation Fault 또는 메모리 손상이 발생
- deep copy(깊은 복사)가 동작하지 않아서 수동으로 구현해야 함


## Declare
```cpp
char vowel[6] = {'a', 'e', 'i', 'o', 'u'};    // C 스타일 선언
array<char, 6> vowel = {'a', 'e', 'i', 'o', 'u'}; // C++ 스타일 선언
```

## find
```cpp
find(vowel, vowel + 6, 'a')    // C 스타일 find
find(vowel.begin(), vowel.end(), 'a')    // C++ 스타일 find
```
- 배열의 find 함수는 문자열 find함수와 다르게 표준 라이브러리에 내장되어 있지 않음
- algorithm 라이브러리에 정의된 find를 사용
- 첫번째 인자 시작 인덱스(또는 반복자)
- 두번째 인자 끝 인덱스(또는 반복자) 
- 세번째 인자 찾고자 하는 값
