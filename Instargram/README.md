# Instagram Clone 

<br/>

---
<!--## 목차 📋-->
<!--1. [프로젝트 구조](#1-프로젝트-구조)-->
<!--2. [실행화면](#2-실행화면)-->
<!--3. [트러블 슈팅](#3-트러블-슈팅)-->
<!--4. [참고 자료](#4-참고-자료)-->


## 🛠️ 사용한 기술 스택
<img src="https://img.shields.io/badge/UI-UIKit-black"/>
<img src="https://img.shields.io/badge/Architecture-MVVM-yellow"/>
<img src="https://img.shields.io/badge/LocalDB-Combine-blue"/>
<img src="https://img.shields.io/badge/RemoteDB-FireBase-red"/>
<img src="https://img.shields.io/badge/DependencyManager-SwiftPackagemanager-blueviolet"/>

<!--## ✏️ 프로젝트 진행하면서 공부한것들-->

<!--## 📌핵심 경험-->
<!--- ✅ -->

## ❗️ 트러블 슈팅
### 1️⃣. #imageLiteral(resourceName:) 사용한 이미지 load
```swift
private func setTabBarItem(unSeletedImage: UIImage, seletedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
    let item = UINavigationController(rootViewController: rootViewController)
    item.tabBarItem.image = unSeletedImage
    item.tabBarItem.selectedImage = seletedImage
    item.navigationBar.tintColor = .black
    return item
}
```
- TabBar 설정을 조금 더 수월하게 하기 위해서 Custom Method를 만듦
<br />

**❗️ 문제점** 
```swift
let feed = setTabBarItem(unSeletedImage: UIImage(named: "homeUnSeleted"), seletedImage: UIImage(named: "homeSeleted"), rootViewController: FeedController())
```
- 각 Tab의 선택했을 때와 선택하지 않았을 때 각각의 이미지와 이동할 Controller를 설정함 
- 이미지는 UIImage(named:)를 사용하여 이미지를 load를 시도함
- 해당 이미지가 존재하지 않을 경우 nil을 반환할 수 있기 때문에 UIImage(named:) 메서드의 반환 값은 옵셔널 타입이였음
- 때문에 if let으로 옵셔널을 일일히 풀어서 사용해야 한다는 문제점이 생김
<br />

**💡 해결책**
```swift
let feed = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "homeUnSeleted"), seletedImage: #imageLiteral(resourceName: "homeSeleted"), rootViewController: FeedController())
```
- #imageLiteral(resourceName:) 구문을 사용하여 이미지 리소스를 직접 참조해서 해결
- #imageLiteral(resourceName:)은 컴파일러에게 이미지 리소스의 이름을 전달하여 load 하기 때문에 이미지 리소스를 정확하게 참조하여 옵셔널이 아닌 이미지를 반환함
<br />

#### ❗️#imageLiteral(resourceName:) 사용시 주의점
- 이미지 크기를 직접 사용하기 때문에 원본 사이즈의 이미지의 크기를 적절히 조절 되어 있는 파일이어야함
- 다국어 지원에 대한 처리를 하지 않기 때문에 로컬라이징이 필요할경우 별도의 처리가 필요
- 컴파일러가 이미지 리소스를 확인하지 않기 때문에 프로젝트에 실제로 존재하는지 꼭 확인해야함 없다면 빌드 시 오류
<br />

### 2️⃣. 중복되는 코드를 줄이기 위한 서브클래스 생성
**❗️ 문제점** 
```swift
    private let emailTextField = {
        let textField = UITextField()
        textField.placeholder = "사용자 이름, 이메일 주소 또는 휴대폰 번호"
        textField.borderStyle = .none
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.tintColor = .black
        return textField
    }()
    
    private let passwordTextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.systemGray3.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.tintColor = .black
        return textField
    }()
```
- 계정의 ID(Email)을 적는 textField와 비밀번호를 적는 TextField가 placeholder와 isSecureTextEntry 두개의 프로퍼티값만 다르고 다른것은 전부 동일하게 겹치는 상황
**💡 해결책**
```swift
class CustomTextField: UITextField {
    init(placeholderText: String) {
        super.init(frame: .zero)
        placeholder = placeholderText
        backgroundColor = .white
        layer.borderWidth = 1
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 5
        layer.borderColor = UIColor.systemGray3.cgColor
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        leftViewMode = .always
        tintColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```
- UITextField 서브클래스로 새로 생성하여 겹치는 프로퍼티는 init()에 추가하고 겹치지 않는 부분은 매개변수로 값을 받아서 생성
```swift
    private let emailTextField = CustomTextField(placeholderText: "사용자 이름, 이메일 주소 또는 휴대폰 번호")
    private let passwordTextField = CustomTextField(placeholderText: "비밀번호")
    passwordTextField.isSecureTextEntry = true
```
- CustomTextField를 사용함으로써 중복되는 코드를 줄임
