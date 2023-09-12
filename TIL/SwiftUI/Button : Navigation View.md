## Button
- 보통은 View와 Control은 둘 다 앱의 UI인 시각적 요소이므로 굳이 구분하지 않음
- 하지만 이 둘을 구분한다면 텍스트, 색, 이미지처럼 화면에 콘텐츠를 표현하는 것에만 중점을 둔 것을 View라고 함
- 유저와의 상호작용을 할 수 있도록 추가적인 행동을 할 수 있는 View를 Control라고 함
<img width="191" alt="Button" src="https://github.com/ChanHyuc/StudySwift/assets/121753386/71c98d0b-9a94-4859-a279-32fa89e311a6">

```swift
  HStack {
      // 1
      Button("Button1") {
          print("Button1")
      }

      // 2
      Button( action: { print ("Button2") } ) {
          Text("Button2")
              .padding()
              .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
      }

      // 3
      Button {
          print("Button3")
      } label: {
          Circle()
              .stroke(lineWidth: 2)
              .frame(width: 80, height: 80)
              .overlay(Text("Button3"))
      }
  }.accentColor(.red)
```
1. 단순히 Text만 버튼을 표현할 때 title 매개 변수에 문자열을 먼저 전달하고 action이 뒤에 오는 생성자를 사용
2. 문자열만 사용한 1번과 달리 action을 먼저 정의하고 뷰를 나중에 정의
3. 텍스트를 먼저 만들고 외각선을 배경으로 추가한 2번과 달리 외곽선을 먼저 그리고 그 위에 Text를 올려줌

### onTapGesture
- Button을 사용하지 않고 버튼과 같은 기능을 하게 해줌
- 예시로 Image나 Text를 클릭 했을 때 이벤트가 발생하는 것
<img width="198" alt="onTapGesture" src="https://github.com/ChanHyuc/StudySwift/assets/121753386/ec0df0c0-bcd6-4846-97e1-97c534347a0d">

```swift
// 1
Image(systemName: "person.circle").imageScale(.large)
                .onTapGesture { print("onTapGesture") }
// 2
Button { print("버튼") }
label: {
    Image(systemName: "person.circle").imageScale(.large)
}.accentColor(.black)
```
- 이 둘은 외형과 작업이 동일하고 어떤방법을 사용해도 됨
- 하지만 onTapGesture로 동작할 경우 하이라이트 애니메이션이나 버튼의 기본효과, 커스텀 버튼 스타일 등을 사용할 수 없음

## NavigationView
- 내비게이션 스택을 이용해 콘텐츠 뷰를 관리하는 컨테이너 뷰
- 스타일에 따라 UINavigationController 또는 UISplitViewController를 사용할 수 있음
- 스택 구조의 내비게이션 계층을 구성함

## NavigationBarItems
<img width="191" alt="NavigationBarItems" src="https://github.com/ChanHyuc/StudySwift/assets/121753386/5c048c53-f510-456c-b956-d3bfa7c94f29">

```swift
let leadingItem = Button { print("왼쪽 버튼") }
    label: { Image(systemName: "bell").imageScale(.large) }
let trailingItem = HStack { 
        Button { print("오른쪽 버튼1") }
        label: { Image(systemName: "gear").imageScale(.large) }
        Button { print("오른쪽 버튼2") } 
        label: { Image(systemName: "person") }
        }
        return NavigationView {
            Text("내비게이션")
                .navigationBarItems(leading: leadingItem, trailing: trailingItem)
                .navigationTitle("내비게이션 바 아이템")
        }
```
- leading이나 trailing에 둘 이상의 아이템을 넣어야 한다면 HStack을 이용해서 정의함
