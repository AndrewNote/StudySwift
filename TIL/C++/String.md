## 문자열 입력 받기
```cpp
#include <iostream>
#include <string>
using namespace std;

int main() {
    string fruit;
    cin >> fruit;    // apple is red! 입력
    cout << fruit;    // apple만 출력
    return 0;
}
```
- string 타입은 cin으로 입력받을 때 공백을 기준으로 문자열의 끝이라고 판단하여 더 이상의 입력을 받지 않음

### String의 getline() 함수
```cpp
#include <iostream>
#include <string>
using namespace std;

int main() {
    string fruit;
    getline(cin,fruit);    // apple is red! 입력
    cout << fruit;        // apple is red! 출력
    return 0;
}
```
## find
```cpp
#include <iostream>
#include <string>

int main() {
    std::string fruit = "apple";
    int found = fruit.find("l");

    if (found != std::string::npos) {
        std::cout << "Found at index: " << found << std::endl;
    } else {
        std::cout << "Not found" << std::endl;
    }
    return 0;
}
```
- 문자열에서 특정 부분 문자열을 찾는데 사용
- array의 find와는 사용 방법과 동작이 약간 다름
- nops: std::string 클래스에 정의된 정적 멤버 변수 
- std::string::find()함수가 호출되었을때 찾는 문자열 또는 문자가 발견되지 않았을 경우 반환하는 값으로 사용

## replace
```cpp
#include <iostream>
#include <string>
using namespace std;

int main() {
    string fruit = "i like apple";
    fruit.replace(fruit.find("apple"), 5 ,"banana");
    cout << fruit << endl;    // i like banana
}
```
- replace(변경하기전 문자열, 몇글자를 변경할 것인지의 숫자, 변경할 문자열)

## 문자열 숫자형으로 변경, 숫자형 문자열로 변경
```swift
int main() {
    string str1 = "1000";
    int integer1 = 234;
    
    int integer2 = stoi(str1);  // 1000 문자열을 숫자 1000으로 변경
    cout << integer1 + integer2;    // 1000 + 234 = 1234
    
    string str2 = to_string(integer1);  // 숫자 234를 문자열 "234"로 변경
    cout << str1 + str2;            // "1000" + "234" = "1000234" 
}
```

### Reference
[cppreference: replace](https://en.cppreference.com/w/cpp/string/basic_string/replace)
