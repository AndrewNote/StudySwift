# Instargram Clone 

<br/>

---
<!--## 목차 📋-->
<!--1. [프로젝트 구조](#1-프로젝트-구조)-->
<!--2. [실행화면](#2-실행화면)-->
<!--3. [트러블 슈팅](#3-트러블-슈팅)-->
<!--4. [참고 자료](#4-참고-자료)-->


## 🛠️사용한 기술 스택
<img src="https://img.shields.io/badge/UI-UIKit-black"/>
<img src="https://img.shields.io/badge/Architecture-MVVM-yellow"/>
<img src="https://img.shields.io/badge/LocalDB-Combine-blue"/>
<img src="https://img.shields.io/badge/RemoteDB-FireBase-red"/>
<img src="https://img.shields.io/badge/DependencyManager-SwiftPackagemanager-blueviolet"/>

<!--## 📌핵심 경험-->
<!--- ✅ -->

## 🗝️Troubleshooting
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

```swift
let feed = setTabBarItem(unSeletedImage: UIImage(named: "homeUnSeleted"), seletedImage: UIImage(named: "homeSeleted"), rootViewController: FeedController())
```
- 각 Tab의 선택했을 때와 선택하지 않았을 때 각각의 이미지와 이동할 Controller를 설정함 
- 이미지는 UIImage(named:)를 사용하여 이미지를 load를 시도함
- 해당 이미지가 존재하지 않을 경우 nil을 반환할 수 있기 때문에 UIImage(named:) 메서드의 반환 값은 옵셔널 타입이였음
- ❗️때문에 if let으로 옵셔널을 일일히 풀어서 사용해야 한다는 문제점이 생김
<br />

```swift
let feed = setTabBarItem(unSeletedImage: #imageLiteral(resourceName: "homeUnSeleted"), seletedImage: #imageLiteral(resourceName: "homeSeleted"), rootViewController: FeedController())
```
- 💡#imageLiteral(resourceName:) 구문을 사용하여 이미지 리소스를 직접 참조해서 해결
- #imageLiteral(resourceName:)은 컴파일러에게 이미지 리소스의 이름을 전달하여 load 하기 때문에 이미지 리소스를 정확하게 참조하여 옵셔널이 아닌 이미지를 반환함
<br />

#### ❗️#imageLiteral(resourceName:) 사용시 주의점
- 이미지 크기를 직접 사용하기 때문에 원본 사이즈의 이미지의 크기를 적절히 조절 되어 있는 파일이어야함
- 다국어 지원에 대한 처리를 하지 않기 때문에 로컬라이징이 필요할경우 별도의 처리가 필요
- 컴파일러가 이미지 리소스를 확인하지 않기 때문에 프로젝트에 실제로 존재하는지 꼭 확인해야함 없다면 빌드 시 오류
<br />

## 2️⃣.
