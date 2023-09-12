## Sort(정렬) 
- Sorting(정렬)이란 데이터를 특정한 기준에 따라 순서대로 나열하는 것
- 적절한 정렬 알고리즘이 공식처럼 사용된다.
- 정렬 알고리즘은 이진 탐색의 전처리(분석하기 좋게 데이터를 고치는 작업) 과정이기도 하다

## Selection Sort(선택정렬)
- 가장 원시적인 방법이다.
- 처리되지 않은 데이터 중에서 가장 작은 데이터를 선택해 맨 앞에 있는 데이터와 바꾸는 것을 반복한다.
- 선택 정렬은 N번 만큼 가장 작은 수를 찾아서 맨 앞으로 보내야 한다
- 빅오 표기법에 따라서 O(N^2)

```python
array = [7,5,9,0,3,1,6,2,4,8]

for i in range(len(array)):
    min_index = i # 가장 작은 원소의 인덱스
    for j in range(i + 1, len(array)):
        if array[min_index] > array[j]:
            min_index = j
    array[i], array[min_index] = array[min_index], array[i] # 스와프

print(array)
```
## Insertion Sort(삽입정렬)
- 처리되지 않은 데이터를 하나씩 골라 적절한 위치에 삽입한다
- 선택 정렬에 비해 구현 난이도가 높은 편이지만, 일반적으로 더 효율적으로 동작한다.
- 삽입 정렬의 시간 복잡도는 O(N^2)이며, 선택 정렬과 마찬가지로 반복문이 두 번 중첩되어 사용
- **현재 리스트의 데이터가 거의 정렬되어 있는 상태라면 매우 빠르게 동작**
(바로 왼쪽과 비교 했는데 예시처럼 break를 만나면 바로 다음 분기로 넘어가기 때문)
```python
array = [7,5,9,0,3,1,6,2,4,8]

for i in range(1, len(array)):
    for j in range(i, 0, -1): # 인덱스 i부터 1까지 1씩 감소하며 반복
        if array[j] < array[j - 1]: # 한 칸씩 왼쪽으로 이동
            array[j], array[j - 1] = array[j - 1], array[j]
        else: # 자기보다 작은 데이터를 만나면 그 위치에서 멈춤
            break
print(array)

```

## Quick Sort(퀵 정렬)
- 기준 데이터를 설정하고 그 기준보다 큰 데이터와 작은 데이터의 위치를 바꾸는 방법
- 일반적인 상황에서 가장 많이 사용되는 정렬 알고리즘
- 병합 정렬과 더불어 대부분의 프로그래밍 언어의 정렬 라이브러리의 근간이 되는 알고리즘
- 가장 기본적인 퀵 정렬은 첫 번째 데이터를 Pivot(기준 데이터)로 설정
```python
array = [7,5,9,0,3,1,6,2,4,8]

def quick_sort(array):
    # 리스트가 하나 이하의 원소만을 담고 있다면 종료
    if len(array) <= 1:
        return array
    pivot = array[0] # 피벗은 첫 번째 원소
    tail = array[1:] # 피벗을 제외한 리스트

    left_side = [x for x in tail if x <= pivot] # 분할된 왼쪽 부분
    right_side = [x for x in tail if x > pivot] # 분할된 오른쪽 부분

    # 분할 이후 왼쪽 부분과 오른쪽 부분에서 각각 정렬을 수행하고, 전체 리스트를 반환
    return quick_sort(left_side) + [pivot] + quick_sort(right_side)

print(quick_sort(array))
```
- 평균의 경우 O(NlogN)의 시간 복잡도를 가진다
- 하지만 최악의 경우 O(N^2)의 시간 복잡도를 가진다
## Count Sort(계수정렬)
