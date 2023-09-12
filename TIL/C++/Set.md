## 선언
```cpp
set<T>이름
```
- 원하는 자료형 및 Class를 T에 선언 ex) string, int
- 중복을 허용하지 않고 허용하려면 multiset을 사용해야함

### insert
```cpp
insert(element)
```
- insert(element): set에 element 추가

### erase
```cpp
erase(element)
```
- erase(element): 세트에서 해당하는 element를 삭제

### clear
- clear(): 세트에 있는 모든 원소 삭제

find(element): element에 해당하는 iterator를 반환
count(element): element에 해당하는 개수를 반환
기타
empty(): 비어있으면 true 아니면 false를 반환
size(): 세트에 포함되어 있는 원소들의 수를 반환

### Reference
[cppreference: set](https://en.cppreference.com/w/cpp/container/set)
[cplusplus: set](https://cplusplus.com/reference/set/set/)
