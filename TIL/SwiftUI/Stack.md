## Stack
- View를 배치하는 데 사용하는 컨테이너 뷰로 자식 뷰들을 어떤 형태로 배치할 것인지 결정함
- UIKit에서 UIStackView는 선택적인 요소였지만 SwiftUI에서는 필수적으로 활용됨

```swift
var body: some View {
    Text("Hello")
    Text("SwiftUI")
}
```
- body 프로퍼티에 연속적으로 텍스트를 작성하면 ~~컴파일 오류가 발생하는데 이는 프로퍼티에는 반드시 하나의 값만 반환해야 하기 때문~~

### Horizontal Stack(HStack)
![](https://velog.velcdn.com/images/whk1140/post/c33308d5-fa61-4300-a095-163c55a2e949/image.png)
```swift
HStack {
    Rectangle()
        .fill(.red)
        .frame(width: 100, height: 100)
    Rectangle()
        .fill(.blue)
        .frame(width: 100, height: 100)
    Rectangle()
        .fill(.yellow)
        .frame(width: 100, height: 100)
}
```
### Vertical Stack(VStack)
![](https://velog.velcdn.com/images/whk1140/post/1630f167-bed2-4b70-9e6b-7b5761a5f135/image.png)
```swift
VStack {
    Rectangle()
        .fill(.red)
        .frame(width: 100, height: 100)
    Rectangle()
        .fill(.blue)
        .frame(width: 100, height: 100)
    Rectangle()
        .fill(.yellow)
        .frame(width: 100, height: 100)
}
```
### Depth Stack(ZStack)
- ZStack 특성상 나중에 작성한게 먼저 작성한 것 보다 뷰 계층에서 상위에 위치함
![](https://velog.velcdn.com/images/whk1140/post/898eb72d-930a-4669-935e-e928211d41b2/image.png)
```swift
ZStack {
    Rectangle()
        .fill(.red)
        .frame(width: 100, height: 100)
        .offset(x: 40, y: 40)
    Rectangle()
        .fill(.blue)
        .frame(width: 100, height: 100)
        .offset(x: 20, y: 20)
    Rectangle()
        .fill(.yellow)
        .frame(width: 100, height: 100)
}
```

### Spacing
```swift
HStack(spacing: 100) {...}
```
- 명시적으로 값을 지정해주면 값만큼 간격에 떨어짐

### Alignment
```swift
HStack(alignment: .top) {...}
init(alignment: VerticalAlignment = .center, ...) // HStack
init(alignment: HorizontalAlignment = .center, ...) // VStack
init(alignment: Alignment = .center, ...)    // ZStack
```
- HStack은 세로 방향에 대한 Vertical Alignment 타입을 받고 
- VStack은 가로 방향에 대한 Horizontal Alignment 타입을 받고
- ZStack은 가로 세로의 모든 정보가 필요하기 때문에 두 가지 값을 모두 가진 Alignment 타입이 사용됨

### Spacer
- View 사이의 간격을 설정하거나 View의 크기를 확장할 용도로 사용됨
- Stack 내부에서 사용할 때와 외부에서 사용할 때 특성이 달라짐

### Overlay
- overlay는 뷰 원본의 공간을 기준으로 그 위에 새로운 뷰를 중첩해서 쌓는 기능을 함
- UIKit에서 addSubview 메서드를 사용하는것과 같음

### Background
- overlay와 같이 뷰 원본의 공간을 기준으로 뷰를 중첩하는거 같지만 위가 아니라 아래 방향으로 쌓아감
- Text에서 Background를 사용하는것은 Text에서 배경색을 지정하는게 아니라 View의 하위계층에 지정한 색을 가진 또 다른 View를 추가하는 기능
