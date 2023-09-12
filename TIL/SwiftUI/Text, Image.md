## Text
- 문자열을 표현하는 View
- UIKit의 UILabel과 같은 역할
- Button, Picker, Toggle 등 다양한 뷰에서 UI에 텍스트를 구성할 때 사용해야 함으로 UILabel보다는 훨씬 많은 사용됨

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {   // 세로 방향으로 뷰를 배열
            Text("Sweet SwiftUI")
                .font(.title)       // 폰트
                .fontWeight(.black) // 굵기
                .foregroundColor(.red) // 글자색
                .background(.green)    // 배경색
            
            Text("볼드")
                .bold()
            Text("이탤릭")
                .italic()
            Text("밑줄")
                .underline()
            Text("취소선")
                .strikethrough()
        }
    }
}
```

## Image
- UIKit의 UIImageView와 같은 역할
- UIImage 객체를 따로 만들고 UIImageView에 전달하는 형식으로 사용했지만 바로 원하는 이미지를 나타낼 수 있음
```swift
Image("SwiftUI")
```
- 에셋에 "SwiftUI"라는 이름의 이미지가 있다고 가정할 때 이것을 불러오려면 이렇게 한줄로 작성하면 됨
- 이미지는 주어진 공간과 관계없이 고유의 크기를 유지함

### Resizable
- 이미지 크기를 변경해야 할 경우에 적용
- resizable은 이미지에서만 사용 가능한 수식어이므로 반드시 frame 수식어보다 먼저 적용해야함

## SF Symbols
- 애플에서 직접 제공하는 이미지들의 모음
- 벡터 기반의 이미지로 만들어져서 색이나 크기를 쉽게 변경할 수 있으며 동적타입 적용시 자동으로 텍스트처럼 적절한 크기로 조정됨
- systemName 매개 변수에 이름을 전달하면 되지만 이름이 없거나 틀릴경우 아무 내용도 출력되지 않음

### ImageScale
- small, medium(default), large를 선택해서 심벌의 크기나 색을 입힐 수 있음
<img width="114" alt="SwiftUI_ImageScale" src="https://github.com/ChanHyuc/StudySwift/assets/121753386/6f0dcbcc-9e25-45af-9493-823b77a4ae38">


```swift
HStack(spacing: 30) {
            Image(systemName: "book.fill").imageScale(.small).foregroundColor(.red)
            Image(systemName: "book.fill").foregroundColor(.yellow)
            Image(systemName: "book.fill").imageScale(.large).foregroundColor(.blue)
        }
```

### Font
- 폰트를 이용해서 크기를 변경할 수 있음
<img width="233" alt="SwiftUI_Font" src="https://github.com/ChanHyuc/StudySwift/assets/121753386/4fddb3ba-53ca-4f4e-af44-efbff0e15ee2">

```swift
HStack(spacing: 30) {
            Image(systemName: "speaker.3").font(.body)
            Image(systemName: "speaker.3").font(.title)
            Image(systemName: "speaker.3").font(.system(size: 40))
            Image(systemName: "speaker.3").imageScale(.large).font(.system(size: 40))
        }
```

### Weight
- 이미지는 굵기를 조정할 수식어가 없어서 font 수식어를 이용해서 변경해야함
- 굵기는 총 9가지가 있음
<img width="172" alt="SwiftUI_Weight" src="https://github.com/ChanHyuc/StudySwift/assets/121753386/4c03802e-ccca-47b3-bcef-e2b1ae032f50">

```swift
HStack(spacing: 30) {
            Image(systemName: "arrow.up").font(Font.title.weight(.black))
            Image(systemName: "arrow.up").font(Font.title.weight(.semibold))
            Image(systemName: "arrow.up").font(Font.title.weight(.light))
            Image(systemName: "arrow.up").font(Font.title.weight(.ultraLight))
        }
```
