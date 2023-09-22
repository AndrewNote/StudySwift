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

## 성능 최적화
```cpp
ios_base::sync_with_stdio(false);
cin.tie(NULL);
cout.tie(NULL);
```
- ios_base::sync_with_stdio(false): C++의 입출력 스트림을 C 스타일 입출력 함수와 동기화할 것인지를 설정하는 코드. 기본적으로 C++의 입출력 스트림은 C 스타일 입출력 함수와 동기화되어 있어서 한 번에 하나의 스트림만을 사용할 수 있음. 이를 해제하기 위해 sync_with_stdio(false)를 호출하면 입출력 스트림은 자유롭게 사용될 수 있으며, C 스타일 입출력 함수와 혼합해서 사용할 수 있음
- cin.tie(NULL);와 cout.tie(NULL):  스트림들 사이의 연결을 설정하는 코드입니다. C++의 스트림들은 기본적으로 연결되어 있어서 cin과 cout을 사용할 때, cin으로 입력을 받으면 cout은 출력 버퍼를 비워줍니다. 이렇게 연결되어 있으면 입력과 출력이 서로 간섭할 수 있습니다. cin.tie(NULL);와 cout.tie(NULL);를 호출하면 이러한 연결을 해제하게 됩니다. 즉, cin으로 입력을 받을 때 cout은 자동으로 출력 버퍼를 비우지 않게 됩니다.
- 이렇게 설정을 변경하면 입출력 성능을 최적화할 수 있으며, 특히 입출력이 많은 프로그램에서 성능 향상을 가져올 수 있습니다. 하지만 주의해야 할 점은 입출력 스트림을 혼합해서 사용할 때 버퍼 관리에 조금 더 신경을 써야 한다는 것입니다.
