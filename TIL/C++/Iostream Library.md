- C++에서 입출력을 위한 헤더 파일 (표준 라이브러리)

## namespace
```cpp
#include <iostream>
using namespace std

int main() {
    int inputNumber;
    cin >> inputNumber;
    cout << inputNumber << endl;
    return 0;
}
```
- namespace를 전역 범위로 사용하도록 하는 디렉티브
- std는 C++ 표준 라이브러리에 모든 요소들이 포함되어 있는 namespace
- std:: 없이도 std namespace와 관련된 요소들에 접근할 수 있음
- namespace는 서로 충돌하지 않게 식별자를 그룹화하는 기능 제공
- ❗️전역 namespace에 std의 모든 요소를 가져오는것이기 때문에 이름 충돌문제가 발생할 수 있음

## std::
```cpp
#include <iostream>
using namespace std

int main() {
    int inputNumber;
    std::cin >> inputNumber;
    std::cout << inputNumber << std::endl;
//    std::cout << inputNumber << "\n"
    return 0;
}
```
- endl은 newline(개행문자)를 출력하는 manipulator.
- endl을 사용하면 출력 버퍼를 지우고 줄바꿈을 함
- \n을 사용할 경우 출력 버퍼를 지우지 않음

## std::string
```cpp
#include <string>
std::string fruit = "apple";
```
- 문자열을 처리하는 다양한 기능과 멤버 함수 제공
- C와는 다르게 문자열의 크기를 알 필요없이 편리하게 문자열을 다룰 수 있게 해줌
- 문자열의 동적할당과 해제를 자동으로 처리하기 때문에 메모리 관리가 편리함
