

---

# 공부한 정보

---

* `Slider` 뷰를 통해 슬라이더를 추가할 수 있다.

* 슬라이더에 색깔을 입히고 싶다면 `.accentColor(.red)` 수정자를 사용하면 된다.

* value는 값을 지정할 수 있도록 바인딩할 곳이다. in은 슬라이더의 범위이며 Step은 슬라이더를 이동할 때의 스텝이다.

* value는 더블값이다. 그러므로 소수점 6자리까지 출력한다. 만약 소수점을 제한하고 싶다면 specifier: "%.2f와 같이 쓰면 된다.

* Int 값으로 출력하고 싶다면 `Int(sliderValue)`와 같이 형변환을 해줘야한다.

* Spacer()만 하면 화면 끝까지를 기준으로 공간을 띄우니 `minLength`에 값을 줘서 조절한다.

* Text View가 차지하는 공간을 넓히면서 띄우고 싶다면 `padding`수정자를 사용한다.

* ForEach는 `Creates an instance that computes views on demand over a *constant* range.`해야한다.
  
* ForEach에서 `Non-constant range: argument must be an integer literal`에러는 `id:\.self`를 사용하면 된다.
