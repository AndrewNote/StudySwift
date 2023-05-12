# MiniGameHeaven

## UITableView, UICollectionView 선택
UITableView
- 단일 Column을 구현하는데 적합하며 Data가 일정한 크기와 형식을 가짐

UICollectionView
- Data의 크기와 형식이 동적이고 다양한 크기 및 layout이 필요한 경우
- 그리드 뷰, 원형 뷰, 수평 스크롤 등 다양한 형태의 View 구현 가능 (유연성)
- 그만큼 구현이 복잡하고 더 많은 코드를 작성해야 할 수 있음


## Datasource, DiffableDataSource 선택
- DiffableDataSource는 유연한 DataSource를 제공함
- DiffableDataSource는 Section 및 row 구성을 쉽게 업데이트 할 수 있게 함
- DiffableDataSource는 Section에 대해 고유한 식별자를 사용하여

