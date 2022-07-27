뷰 빌더는 함수로 정의된 매개변수에 뷰를 전달받아 하나 이상의 자식뷰를 만드는 속성이다.

애플은 뷰 빌더를 클로저로부터 뷰를 만드는 커스텀 파라메터 속성이라고 정의한다.

구조체든 함수든 템플릿이 정해져있는듯 하다.

var body: some View 는 암시적으로 뷰빌더 속성을 가지고 있다.

```swift
func contextMenu<MenuItems: View>(@ViewBuilder menuItems: () -> MenuItems) -> some View

myView.contextMenu {
    Text("Cut")
    Text("Copy")
    Text("Paste")
    if isSymbol {
        Text("Jump to Definition")
    }
}
```
