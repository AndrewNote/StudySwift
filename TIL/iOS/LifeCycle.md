## Scene-Based Life-Cycle
![LifeCycle](https://github.com/ChanHyuc/StudySwift/assets/121753386/3cbddacb-2bb5-4bda-9979-7e5f69741554)

**Foreground**
- User나 Systme이 App에 대해서 새로운 scene를 요청하게 되면 UIKit이 scene을 만든다.
- Inactive: App이 실행 중인 상태지만 Event를 받지 않음 Active 상태로 넘어가기 전에 반드시 거치는 상태. Alert창이 Screen을 덮어서 App이 Event를 받지 못하는 상태
- Active: App이 실행 중이고 Event를 받을 수 있는 상태

**Background**
- App 사용 중에 다른 App을 실행하거나 Home 화면으로 나간 상태.
- Background에서 동작하는 code를 추가하면 suspended 상태로 넘어가지 않고 Background 유지.
- 처음부터 Background 상태로 실행되는 App은 inactive대신 Background 상태로 넘어감.

**Suspend**
- App이 Background 상태에서 작업을 하지 않으면 곧바로 suspended 상태로 넘어감
- App이 다시 실행할 경우 빠른 실행을 위해 Memory에 올라가 있음
- Memory가 부족한 상황이 되면 iOS는 suspended 있는 앱들을 Memory에서 삭제

## Reference
[Apple Developer: UIScene.ActivationState.unattached](https://developer.apple.com/documentation/uikit/uiscene/activationstate/unattached)
[Apple Developer: UIScene.ActivationState.foregroundInactive](https://developer.apple.com/documentation/uikit/uiscene/activationstate/foregroundinactive)
[Apple Developer: UIScene.ActivationState.foregroundActive](https://developer.apple.com/documentation/uikit/uiscene/activationstate/foregroundactive)
[Apple Developer: UIScene.ActivationState.background](https://developer.apple.com/documentation/uikit/uiscene/activationstate/background)
[Apple Developer: Managing your app’s life cycle](https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle)
