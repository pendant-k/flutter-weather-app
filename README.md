# flutter_weather_app
간단한 날씨 정보 앱입니다.

### 실습의 목적 
기본적인 API 서버와 연동하는 과제입니다. 이번 스터디 과제는 다음의 주제들을 포함합니다. 과제를 진행하면서 다음의 내용들을 익혀볼 예정입니다.
- initState()
- Future<Object> 활용

### 실습 안내
- 해당 레포에는 실습에서 사용하는 에셋(이미지 및 애니메이션용 lottie 파일)이 기본적으로 제공 됩니다.
- 폴더 구조는 간단하게 `view`, `service`, `model`로 구성됩니다.
- 기본적으로 screen 파일들이 있으니 screen 파일부터 과제를 시작하면 됩니다.
- 필수적으로 구현해야하는 부분에는 주석으로 표시가 되어있습니다.
- 강요되는 구조나 사용해야하는 위젯에는 제한이 없으니 자유롭게 원하는대로 구현해주세요.
- 작업 중 구현하는 위젯들은 분리해서 각각 위젯 파일들로 관리해보는 것을 추천합니다.

### 구현 내용
- 서버로부터 데이터를 받아오는 코드를 `Service` 레이어로 작성합니다.
- 데이터에 따라서 날씨 애니메이션을 출력합니다.
- 기온과 날씨 상세정보(description)를 출력합니다.

### 추가 구현(옵션)
- 위도와 경도를 설정할 수 있는 페이지를 만들어서, 지역 설정을 가능하게 합니다.
- 앱 실행 시 디바이스의 위치 정보를 받아와서 이에 따른 날씨 정보를 출력합니다.


### 구현 예제
- 준비중
  
### 참고 자료
- Lottie는 Animation 파일 형식입니다. json 파일 확장자로 gif 파일처럼 애니메이션을 어플리케이션에 넣을 때 활용합니다.
gif 파일보다 용량이 낮아서 다양한 애니메이션을 부담없이 어플리케이션에 적용할 수 있습니다. Flutter에서는 lottie 파일을 사용하기 위해 Lottie 패키지가 필요합니다.

[Lottie 공식페이지](https://airbnb.io/lottie/#/)  
[Flutter Lottie 패키지](https://pub.dev/packages/lottie)  

- http 패키지를 이용하여, 서버로부터 데이터를 받아올 수 있습니다. HTTP 통신에 대해서는 다음의 자료를 참고합시다.
  
[Flutter http 패키지](https://pub.dev/packages/http)
[HTTP통신 MDN 문서](https://developer.mozilla.org/ko/docs/Web/HTTP)
