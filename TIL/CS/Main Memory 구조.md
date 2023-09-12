**1. Code(Program)**
- Program을 만들고 실행 위해 구현한 코드(Text)
- CPU는 Code 영역에서 저장된 명령을 하나씩 가져가서 처리 한다.
- Program이 시작하고 종료될 때 까지 Memory에 계속 남아 있는다.

**2. Data**
- 공통으로 공유하기 위한 Data
- 전역변수, Static / class 타입변수 저장
- Program이 실행되는 동안 Immutable
- Program 시작과 함께 할당되며 Program이 종료되면 소멸

**3. Heap**
- 개발자가 직접 공간을 할당 해제하는 Memory 공간
- malloc() (C언어)와 new연산자(C++,Java)를 사용해서 Memory를 할당하고
- free() (C언어)와 delete연산자(C++,Java)를 사용해서 Memory를 해제한다.
- FIFO(First-In First-Out)방식 / 선입선출
- 가장 먼저 들어온 Data가 가장 먼저 인출된다.

**4. Stack**
- 자동으로 관리되는 임시 Memory영역
- Function 호출되면 Memory를 할당하고 Function이 완료되면 Memory를 해제한다.
- Stack Frame에서 Function 호출 정보를 저장한다.
- LIFO(Last-In First-Out) / 후입선출
- Push로 Data를 저장하고 Pop로 Data를 인출한다.
