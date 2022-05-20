# SeSACFarm

<div align="center">

  
<img width="263" alt="스크린샷 2022-04-27 오후 3 52 54" src="https://user-images.githubusercontent.com/56185581/165458977-a23defe4-d960-4f0b-9192-a608127bb945.png">

  ## 로그인 및 CRUD
  
  ![3333](https://user-images.githubusercontent.com/56185581/165773778-2ed9ec8b-5ad0-4bf2-b1c8-4b30bf92e6ed.gif)

  
  ## Used Skills
  URLSession, SnapKit, MVVM
  
  ## 구현 항목
  회원가입, 로그인, 게시글과 댓글 불러오기 및 CRUD 구현
  
  ## 개발기간
  7일
  
  ## 느낀점
  REST API 적용 목적으로 진행한 프로젝트 입니다.
별도의 라이브러리 대신 스위프트가 제공하는 URLSession을 사용했습니다.
실제 서버와 통신했기 때문에 네트워크 통신에 익숙해 지는데 도움이 되었고
로그인, 회원가입, 기존 게시글 불러오기 및 CRUD 기능을 구현했습니다.
Snapkit를 활용해 코드로 UI를 구현했습니다.
MVVM패턴을 적용했습니다.
Reactive Programming 에 대해 스스로 고민하고
코딩에 몰입할 수 있었던 프로젝트였습니다.
  
  ##Trouble shooting
  
  1. 로그인한 Id의 Token값에 따른 RootViewController 지정
View 구현에 문제가 있어 token값을 UserDefault로 관리하고
ViewModel에서 rootView를 분기처리해 해결했습니다.
2. Model 구성 중 변수명 착오로 인해 개발 시간을 소모했습니다.
이 후 변수명에 대한 직관성을 고민하며 새로 Model 작업을 했습니다.
  
  </div>
