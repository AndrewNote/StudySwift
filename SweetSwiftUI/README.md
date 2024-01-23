# SweetSwiftUI

- 각각의 항목을 따로 프로퍼티나 뷰로 추출해서 뷰의 핵심인 body는 간결하게 유지하는게 좋음
- 새로운 View 타입을 만들지 View를 반환하는 프로퍼티를 만들지는 사용 먹적이나 빈도, 재사용성에 따라서 결정하면 됨




## colorInvert
- Color.primary.colorInvert()  primary의 색을 반전시켜주는 기능
- primary는 다크모드를 위해 나온 시맨틱 컬러중 하나
- 고정된 색을 사용하는게 아니라 상황에 맞게 색 변경
```swift
func colorInvert() -> some View
```
- 이 수식어를 사용할 때 유의해야 하는것 반환타입이 Color가 아닌 view 타입이라는 점
- background 처럼 뷰를 인수로 전달하는 경우는 그대로 사용
- foregroundColor 처럼 Color 타입이 필요한 경우 다른 방법 사용해야함

## cornerRadius
- UIKit에서는 cliToBounds를 별도로 활성화 해야 했지만
- SwiftUI에서는 cornerRadius만으로 함께 효과 적용

## shadow
- 뷰에 그림자 효과를 준다. 검은색을 사용하며 투명도를 정할 수 있음
- radius로 그림자의 범위를 x,y로 그림자의 위치를 지정할 수 있음
- .background(Color.primary.colorInvert()) .cornerRadius(6)
- 두개를 사용하는게 아닌 compositingGroup 하나만 사용 가능.
- shadow는 불투명한 상태의 뷰에 모두 그림자 효과를 부여하므로 의도하지 않은 결과를 나타날 수 있음
- 그래서 뷰 가장자리에만 그림자 효과를 넣어주기 위해
- 1. 뷰의 배경색을 불투명색으로 지정 / background로 해결
- 2. 이미 작성한 수식어들의 효과를 먼저 반영시킨 뒤, / clipped 수식어가 있는 cornerRadius를 사용해서 해결
- 3. 해당 뷰에 shadow 수식어 추가

## accentColor(.red)
- UIKit의 tintColor 역할과 같음
- 기본값은 파란색
