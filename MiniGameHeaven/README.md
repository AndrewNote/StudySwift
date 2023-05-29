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

### UICollectionView (iOS 13+)
- Data: Diffable Data Source
-- DataSource와 CollectionView 사이의 인터페이스 역할을 하는 기능
- layout: Compositional Layout (List Configuration)
- Presentation(표시): UICollectionViewCell / UICollectionReusableView
-- ListCell: 
-- View Configuration: Cell의 디자인과 레이아웃을 더 자유롭게 구현할 수 있으며 더 세밀하게 제어할 수 있음

### List Configuration
- Compositional Layout 기반으로 만들어졌음
- 기본적으로 UICollectionView는 그리드 형태로 Item을 배치하지만 UICollectionViewCompositionalLayout을 사용해서 List Configuration을 구성하면 목록 형태의 레이아웃을 구현할 수 있음


## Cell 등록
### register로 등록
- 간단하고 직관적인 방법
- Cell 구성 로직이 클로저 내부에 구현되어 있어 코드 중복이 발생할 수 있고 유지보수가 어려움
```swift
collectionView.register(TodoListCell.self, forCellWithReuseIdentifier: "TodoListCell")

let dataSource = UICollectionViewDiffableDataSource<Section, TodoLabel>(collectionView: collectionView) {
    (collectionView, indexPath, todo) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoListCell", for: indexPath) as? TodoListCell
        cell?.configure(title: todo.title, content: todo.content, date: todo.date)
        return cell
    }
```

### register를 따로 하지 않고 register & configure 작업
- Cell의 등록과 구성아 하나의 객체로 통합되어 있어서 한 곳에 집중되므로 코드가 깔끔해짐
- 등록된 Cell을 통해 구체적인 구성 로직을 제공하므로 중복 코드를 피하고 Cell의 구성을 일관되게 처리가능
- 클로저 내부에서 Cell을 구성할 때 다양한 커스텀 로직을 적용할 수 있음 **런타임에서 동적으로 Cell을 구성하기에 더 많은 유연성 제공)**
```swift
        let registration = UICollectionView.CellRegistration<TodoListCell, TodoLabel> { cell, IndexPath, todo in
            cell.configure(title: todo.title, content: todo.content, date: todo.date)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, TodoLabel>(collectionView: collectionView) {
            (collectionView, indexPath, todo) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: todo)
        }
```

### TextField 그림자 넣기
```swift
textField.layer.masksToBounds = false
textField.layer.shadowColor = UIColor.black.cgColor
textField.layer.shadowOffset = CGSize(width: 0, height: 4)
textField.layer.shadowRadius = 5
textField.layer.shadowOpacity = 0.3
```
- textView는 이렇게 설정하면 그림자가 적용되었지만 textField는 되지 않았다.
