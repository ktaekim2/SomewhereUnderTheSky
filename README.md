# 프로젝트 기획안
**작성일 : 2022. 05. 31**  
**작성자 : 김경태**  
**프로젝트 명 :  SomewhereUnderTheSky**

## 기획 의도 
- 항공권 예약 사이트
- 가고자 하는 목적지의 항공권을 조회, 예약, 체크인이 가능하다.

## 벤치마킹
- 대한항공 예매 사이트
  
## 주요 기능
### 회원가입
- 필수: 아이디, 비밀번호, 영문성, 영문이름
- 선택: 생년월일, 성별, 이메일주소, 주소, 거주국가, 여권번호

### 로그인
- 일반 로그인
- 아이디찾기, 비밀번호 찾기

### 항공권 예약
- 출발지, 도착지 선택 + 뒤바꾸기 기능
- 탑승일: 가는날, 오는날(편도, 왕복 선택) 선택
- 인원: 성인, 소아, 유아 인원 선택 + 나이계산기 기능
- 좌석 등급: 일반석, 프레스티지석, 일등석 중 선택
- 가까운 날짜 함께 조회 기능

### 예약 조회
- 예약한 항공권 리스트를 조회
- 상세 조회
- 예약 취소

### 체크인
- 예약한 항공권을 탑승 전 48시간 ~ 1시간 까지 온라인 체크인
- 원하는 좌석 지정 기능
- pdf 출력 또는 웹, 모바일에서 확인 가능한 보딩패스 발급

## 기타
### 마이페이지
- 회원정보 수정
- 회원 탈퇴

### 관리자페이지
- 회원 목록 조회
- 회원 상세 조회
- 회원 계정 삭제
- 항공기 리스트 조회, 세부 정보 조회, 수정(기종, 구입일자, 렌트기간, 정비스케줄 등)
- 운항 정보를 조회, 수정 가능(편명, 날짜, 구간, 운항상태 등)

### 항공편 현황
- 출도착: 실시간 운항 정보 확인(날짜 선택)
  - 출/도착지: 출/도착지 기준 조회
  - 편명: 항공기 편명 기준 조회
- 스케줄: 사전 고지된 운항스케줄을 주간 단위로 확인

### 공지사항 게시판
- 코로나19, 운항관련 각종 공지사항
- 최근 공지사항을 메인 페이지(슬라이드 이미지 배너) 또는 header를 통해 볼 수 있다.
- 일반 회원은 조회, 댓글만 가능
- admin 계정만 작성, 삭제 가능
- 검색, 페이징 기능
  - 검색 결과 페이징 처리
  - 페이징 목록에서 한화면에서 볼 수 있는 글 갯수 선택하기
  - 조회수 순으로 목록 보여주기
- 첨부파일 기능
  - 파일 여려개 첨부
- 댓글 기능
  - 댓글 삭제 기능
  - 댓글 좋아요, 싫어요 기능

## 완성 후 추가하고 싶은 기능
- SNS로그인(구글, 카카오톡, 네이버, 페이스북)
- 항공운항api(국내 또는 전세계 실시간 운항 정보)를 활용해서 db에 연결
- 구글맵api를 활용해서 운항정보에 비행 루트와 시간 표시
- 결제시스템 만들기(항공권 결제)
  - 마일리지 시스템(결제 시 10%마일리지가 회원 db에 저장)
  - 장바구니 기능
    - 유료 좌석 구매 기능
    - 기내 서비스(기내식, 기내면세품 사전 구입)
- 예약 달력 만들기