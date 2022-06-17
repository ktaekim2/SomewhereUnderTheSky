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
- 필수: 아이디, 비밀번호, 영문성, 영문이름, 여권번호
- 선택: 생년월일, 성별, 이메일주소, 주소, 거주국가

### 로그인
- 로그인
- 로그아웃
- 아이디 찾기
  - 영문성, 영문이름, 여권번호를 입력받고 일치하면 알려줌
- 비밀번호 찾기
  - 아이디, 영문성, 영문이름, 여권번호를 입력받고 일치하면 알려줌

### 항공권 예약
- 출발지, 도착지 선택 + 뒤바꾸기 기능
- 탑승일: 가는날, 오는날(편도, 왕복 선택) 선택
- 인원: 성인, 소아, 유아 인원 선택(총 4인으로 제한) + 나이계산기 기능
- 좌석 등급: 일반석, 프레스티지석, 일등석 중 선택
- 가까운 날짜 함께 조회 기능
- 프레스티지석, 일등석은 좌석 예약 가능(+좌석 예약 변경 기능)
- 일반석은 체크인 시 좌석 선택 가능

### 예약 조회
- 예약한 항공권 리스트를 조회
- 상세 조회
- 예약 취소

### 체크인
- 예약한 항공권을 탑승 전 48시간 ~ 1시간 까지 온라인 체크인
- 원하는 좌석 지정 기능(+좌석 변경 기능)
- pdf 출력 또는 웹, 모바일에서 확인 가능한 보딩패스(탑승권) 발급

## 기타
### 마이페이지
- 회원정보 수정
- 회원 탈퇴

### 관리자페이지
- 회원 목록 조회
- 회원 상세 조회
- 회원 계정 삭제
- 운항 정보 등록, 조회, 수정, 삭제
  - 편명, 날짜, 구간, 운항상태 등
- 항공기 등록, 조회, 수정, 삭제
  - 기종, 구입일자, 렌트기간, 정비스케줄 등
- 회원 예약 조회, 수정, 삭제

### 항공편 현황
- 출도착: 실시간 운항 정보 확인(날짜 선택)
  - 출/도착지: 출/도착지 기준 조회
  - 편명: 항공기 편명 기준 조회
- 스케줄: 사전 고지된 운항스케줄을 주간 단위로 확인

### 공지사항 게시판
- 코로나19, 운항관련 각종 공지사항
- 최근 공지사항을 index에서 슬라이드 이미지 배너 또는 header를 통해 볼 수 있다.
- 일반 회원은 조회, 댓글만 가능
- admin 계정만 작성, 삭제 가능
- 검색, 페이징 기능
  - 검색 결과 페이징 처리
  - 페이징 목록에서 한화면에서 볼 수 있는 글 갯수 선택하기
  - 조회수 순으로 목록 보여주기
- 첨부파일 기능
  - 파일 여려개 첨부
- 댓글 기능
  - 댓글 삭제 기능(댓글 쓴 계정으로 로그인 시)
  - 댓글 좋아요, 싫어요 기능

## 완성 후 추가하고 싶은 기능
- SNS로그인(구글, 카카오톡, 네이버, 페이스북)
- 항공운항api(국내 또는 전세계 실시간 운항 정보)를 활용해서 db에 연결
- 구글맵api를 활용해서 운항정보에 비행 루트와 시간 표시
- 결제시스템 만들기(아임포트)
  - 마일리지 시스템(결제 시 10%마일리지가 회원 db에 저장)
  - 장바구니 기능
    - 유료 좌석 구매 기능
    - 기내 서비스(기내식, 기내면세품 사전 구입)
- 예약 달력 만들기
- 아이디찾기, 비밀번호 찾기 휴대폰 인증 api

# console
<details>
<summary>
<b>console</b>
</summary>
drop table comment_table;
drop table  board_table;
drop table book_table;
drop table passenger_table;
drop table member_table;
create table member_table
(
id                   bigint auto_increment,
memberAccount        varchar(20) not null,
memberPassword       varchar(20) not null,
memberLastName       varchar(10) not null,
memberFirstName      varchar(10) not null,
memberPassportNumber varchar(20),
memberBirthdate      varchar(10),
memberGender         varchar(5),
memberEmail          varchar(30),
memberNation         varchar(20),
memberPhone          varchar(20),
constraint pk_member primary key (id),
constraint unique (memberAccount),
constraint unique (memberPassportNumber)
);
select *
from member_table;

insert into member_table(memberAccount, memberPassword, memberLastName, memberFirstName)
values ('admin', '1234', 'a', 'dmin');

insert into member_table(memberAccount, memberPassword, memberLastName, memberFirstName, memberGender, memberEmail, memberPhone)
values ('a', '1234', 'Hong', 'Gildong', 'male', 'kill@gmail.com', '010-2323-2211');

drop table board_table;
create table board_table
(
id               bigint auto_increment,
boardWriter      varchar(20) not null,
boardTitle       varchar(50) not null,
boardContents    varchar(500),
boardHits        int default 0,
boardCreatedDate datetime,
boardFileName    varchar(50),
constraint pk_board primary key (id),
constraint foreign key (boardWriter) references member_table (memberAccount) on delete cascade
);
select *
from board_table;

drop table comment_table;
create table comment_table
(
id                 bigint auto_increment,
commentWriter      varchar(20)  not null,
commentContents    varchar(200) not null,
commentCreatedDate datetime,
boardId            bigint,
commentLikes       bigint default 0,
commentDislikes    bigint default 0,
constraint pk_comment primary key (id),
constraint foreign key (commentWriter) references member_table (memberAccount) on delete cascade,
constraint foreign key (boardId) references board_table (id) on delete cascade
);
select *
from comment_table;

drop table airplane_table;
create table airplane_table
(
id               bigint auto_increment,
airplaneModel    varchar(20) not null,
airplaneMaxSeats int         not null,
airplaneStatus   varchar(20) not null,
airplaneFileName varchar(50),
constraint pk_airplane primary key (id)
);

insert into airplane_table(airplaneModel, airplaneMaxSeats, airplaneStatus)
values ('Airbus A220-300', 140, '운용중');

select *
from airplane_table;

drop table book_table;
drop table flight_table;
create table flight_table
(
id               bigint auto_increment,
flightNumber     varchar(10) not null,
flightAirline    varchar(20) not null,
airplaneId       bigint      not null,
departureAirport varchar(20) not null,
arrivalAirport   varchar(20) not null,
departureDate    datetime    not null,
arrivalDate      datetime    not null,
gateNumber       int         not null,
flightFare       bigint      not null,
constraint pk_flight primary key (id),
constraint foreign key (airplaneId) references airplane_table (id) on delete cascade
);
select *
from flight_table;

# 서울/김포 -> 부산/김해
insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1101', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-13 07:00:00', '2022-06-13 08:05:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1103', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-13 08:05:00', '2022-06-13 09:10:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1101', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-14 07:00:00', '2022-06-14 08:05:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1103', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-14 08:05:00', '2022-06-14 09:10:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1101', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-15 07:00:00', '2022-06-15 08:05:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1103', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-15 08:05:00', '2022-06-15 09:10:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1101', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-16 07:00:00', '2022-06-16 08:05:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1103', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-16 08:05:00', '2022-06-16 09:10:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1101', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-17 07:00:00', '2022-06-17 08:05:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1103', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-17 08:05:00', '2022-06-17 09:10:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1101', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-18 07:00:00', '2022-06-18 08:05:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1103', '대한항공', 3,
'GMP(서울/김포)', 'PUS(부산/김해)', '2022-06-18 08:05:00', '2022-06-18 09:10:00', 4, 97600);


# 부산/김해 -> 서울/김포
insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1102', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-13 08:45:00', '2022-06-13 09:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1106', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-13 10:45:00', '2022-06-13 11:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1102', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-14 08:45:00', '2022-06-14 09:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1106', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-14 10:45:00', '2022-06-14 11:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1102', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-15 08:45:00', '2022-06-15 09:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1106', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-15 10:45:00', '2022-06-15 11:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1102', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-16 08:45:00', '2022-06-16 09:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1106', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-16 10:45:00', '2022-06-16 11:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1102', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-17 08:45:00', '2022-06-17 09:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1106', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-17 10:45:00', '2022-06-17 11:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1102', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-18 08:45:00', '2022-06-18 09:45:00', 4, 97600);

insert into flight_table(flightNumber, flightAirline, airplaneId, departureAirport, arrivalAirport,
departureDate, arrivalDate, gateNumber, flightFare)
values ('KE1106', '대한항공', 3,
'PUS(부산/김해)', 'GMP(서울/김포)', '2022-06-18 10:45:00', '2022-06-18 11:45:00', 4, 97600);

drop table passenger_table;
drop table book_table;
create table book_table
(
id                bigint auto_increment,
memberId          bigint,
departureFlightId bigint,
returnFlightId    bigint,
passengerAdult    int,
passengerChild    int,
passengerInfant   int,
cabinClass        varchar(10) not null,
seatNumber        varchar(10),
returnDate        datetime,
constraint pk_book primary key (id),
constraint foreign key (memberId) references member_table (id) on delete cascade,
constraint foreign key (departureFlightId) references flight_table (id) on delete cascade,
constraint foreign key (returnFlightId) references flight_table (id) on delete cascade
);
select *
from book_table;

drop table passenger_table;
create table passenger_table
(
id                 bigint auto_increment,
passengerLastName  varchar(20) not null,
passengerFirstName varchar(20) not null,
passengerGender    varchar(10) not null,
passengerBirthdate varchar(10) not null,
bookId             bigint      not null,
constraint pk_passenger primary key (id),
constraint foreign key (bookId) references book_table (id) on delete cascade
);
select *
from passenger_table;
<div markdown="1">
</div>
</details>





