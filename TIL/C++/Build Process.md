## C언어 Build Process
- C언어는 Compile 방식으로 빌드를 함
- Compile 방식은 소스코드 전체를 기계어로 번역하는 방식
- 빌드과정은 크게 Precompile, Compile, Assemble, Link 4단계를 거침

### Precompile(전처리)
- 전처리기에 의해 수행됨 
- #으로 시작되는 C 소스 코드는 전처리기에게 실직적인 컴파일이 이루어지기 전에 무언가를 실행하라고 알려줌 
- ex) #include <stdio.h>: stdio.h 파일의 내용이 #include 부분에 포함됨

### Compile(컴파일)
- Source 코드 -> Assembly 코드
- 전처리기가 전처리한 소스 코드를 생성하고 나면 Compiler라고 불리는 프로그램은 C 코드를 Assembly라는 저수준 프로그래밍 언어로 컴파일함
- C코드를 Assembly 코드로 변환함으로써 컴퓨터가 이해할 수 있는 언어와 최대한 가까운 프로그램을 만듬

### Assemble(어셈블)
- Assembly 코드 -> Object 코드
- 컴퓨터의 CPU(중앙처리장치)가 프로그램을 어떻게 수행해야 할 지 알 수 있는 명령어인 0과 1들로 바꿔 주는 작업
- Source코드에서 Object 코드로 컴파일 되어야 할 파일이 한 개라면 컴파일 작업은 여기서 끝남
- 하지만 컴파일 되어야 할 파일이 2개 이상이면 링크 단계가 추가됨

### Link(링크)
- 만약 프로그램이 여러개의 파일로 이루어져 있으면 하나의 Object 파일로 합쳐야 한다면 Link 라는 컴파일의 마지막 단계가 필요
- 이 네 단계를 거치면 최종적으로 실행 가능한 파일이 완성

### Reference
- [Youtube: CS50](https://www.youtube.com/@cs50)
