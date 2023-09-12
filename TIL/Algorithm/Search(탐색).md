## Sequential Search(순차탐색)
- N개의 데이터가 있을 때 그 데이터를 차례대로 하나씩 확인하여 처리하는 방식
- 순차 탐색은 데이터 정렬 여부와 상관없이 하나씩 확인해야 한다는 점에서 최악의 경우 시간 복잡도는 O(N)이다.

## Binary Search(이진 탐색)
- 배열 내부의 데이터가 무작위일 때는 사용할 수 없지만 이미 정렬되어 있다면 매우 빠르게 데이터를 찾을 수 있다.
- 탐색 범위를 절반씩 좁혀간다. 그래서 시간복잡도는 O(logN)이다.
- 위치를 나타내는 변수 3개를 사용하는데 시작점,끝점,중간점이다.
- 찾으려는 데이터와 중간점 위치에 있는 데이터를 반복적으로 비교한다.

```python
# 이진 탐색(재귀함수)
def binary_search(array, target, start, end):
  if start > end:
    return None
  mid = (start + end) // 2
  # 찾은 경우 중간점 인덱스 반환

  if array[mid] == target:
    return mid
  # 중간점의 값보다 찾고자 하는 값이 작은 경우 왼쪽 확인
  elif array[mid] > target:
    return binary_search(array, target, start, mid - 1)
  # 중간점의 값보다 찾고자 하는 값이 큰 경우 오른쪽 확인
  else:
    return binary_search(array, target, mid + 1, end)

# n(원소의 개수)과 target(찾고자 하는 문자열)을 입력받기
n, target = list(map(int, input().split()))
# 전체 원소 입력받기
array = list(map(int, input().split()))

# 이진 탐색 수행 결과 출력
result = binary_search(array, target, 0, n - 1)
if result == None:
  print("원소가 존재하지 않습니다")
else:
  print(result + 1)
```
입력 
10 7
1 3 5 7 9 11 13 15 17 19
출력 4

입력 
10 7
1 3 5 6 9 11 13 15 17 19
출력 원소가 존재하지 않습니다.

```python
# 이진 탐색(반복문)
def binary_search(array, target, start, end):
  while start <= end:
    mid = (start + end) // 2
    # 찾은 경우 중간점 인덱스 반환

    if array[mid] == target:
      return mid
    # 중간점의 값보다 찾고자 하는 값이 작은 경우 왼쪽 확인
    elif array[mid] > target:
      end = mid - 1
    else:
      start = mid + 1
  return None

# n(원소의 개수)과 target(찾고자 하는 문자열)을 입력받기
n, target = list(map(int, input().split()))
# 전체 원소 입력받기
array = list(map(int, input().split()))

# 이진 탐색 수행 결과 출력
result = binary_search(array, target, 0, n - 1)
if result == None:
  print("원소가 존재하지 않습니다")
else:
  print(result + 1)
```

## Tree Structure(트리 자료구조)
- DB는 내부적으로 대용량 데이터 처리에 적합한 Tree 자료구조를 이용하여 항상 데이터가 정렬되어 있다.
- 그래프 자료구조의 일종으로 시스템과 같은 곳에서 많은 양의 데이터를 관리하기 위한 목적으로 사용한다

**Tree의 특징**
- Tree는 부모 노드와 자식 노드의 관계로 표현된다.
- Tree의 최상단 노드를 Root 노드라고 한다.
- Tree의 최하단 노드를 단말 노드라고 한다.
- Tree에서 일부를 떼어내도 Tree 구조이며 이를 Sub Tree라 한다.
- Tree는 파일 시스템과 같이 계층적이고 정렬된 데이터를 다루기에 적합하다.

**이진 탐색 Tree**
- 부모 노드보다 왼쪽 자식 노드가 작다.
- 부모 노드보다 오른쪽 자식 노드가 크다.
- 간단하게 표현하면 왼쪽 자식 노드 < 부모 노드 < 오른쪽가 성립되야 된다.

입력데이터가 많거나, 탐색 범위가 매우 넓은 편이라면(1000만~1000억 이상) input()함수를 사용하면 동작 속도라 느려진다. 이럴 경우 sys 라이브러리의 readline() 함수를 이용한다. 또한 readline()으로 입력하면 입력 후 Enter가 줄 바꿈 기호로 입력되는데 이 공백 문자를 제거하려면 rstrip() 함수를 사용해야 한다.
```python
import sys
input_data = sys.stdin.readline().rstrip()
print(input_data)
```

