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
