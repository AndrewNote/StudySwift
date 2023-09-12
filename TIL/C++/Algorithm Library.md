## Algorithm
```cpp
#include <algorithm>
```
- C++ 표준 라이브러리
- 원소들에 대해 작업할 수 있는 여러가지 함수들을 정의함
- 작업자 원소들을 반복자, 포인터를 통해 가리킬 수 있게 해줌

## sort
```cpp
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    vector<int> numbers = { 10, 40, 50, 30, 20 };
    sort(numbers.begin(), numbers.end());
    for (int i : numbers) cout << i << " ";
    
    numbers = { 10, 40, 50, 30, 20 };    // 처음으로 값 초기화
    sort(numbers.begin(), numbers.begin() + 4); // 4번째 요소까지만 정렬
    return 0;
}
// 출력
10 20 30 40 50
10 30 40 50 20
```

## reverse
```cpp
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    vector<int> numbers = { 10, 20, 30, 40, 50 };
    reverse(numbers.begin(), numbers.end());
    for (int i : numbers) cout << i << " ";

    numbers = { 10, 20, 30, 40, 50 }; // 처음으로 값 초기화
    reverse(numbers.begin(), numbers.begin() + 4); // 4번째 요소까지만 reverse
    for (int i : numbers) cout << i << " ";
    return 0;
}
// 출력
50 40 30 20 10
40 30 20 10 50
```
- (시작 반복자, 종료 반복자) 인자를 가짐

## unique
```cpp

```
- 연속된 중복 원소를 제일 뒷부분으로 쓰레기값으로 보내버림

### Reference
- [cppreference: sort](https://en.cppreference.com/w/cpp/algorithm/sort)
- [cppreference: reverse](https://en.cppreference.com/w/cpp/algorithm/reverse)
