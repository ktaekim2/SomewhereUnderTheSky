<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>항공권 예매 | 한국항공</title>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
    <script src="/resources/js/jquery.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row mb-5 mt-5">
        <h1>항공권 예매</h1>
    </div>
    <div class="row">
        <img src="../../../resources/img/booking--edge.svg" height="4">
    </div>
    <div class="row m-5">
        <div class="col-sm-8">
            <div class="text-center mb-2">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal"
                        data-bs-target="#departureModal">
                    <span id="departureAirport">ICN<br>서울/인천</span>
                </button>
                ---------------
                <img src="../../../resources/img/booking__swap.svg">
                ---------------
                <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal"
                        data-bs-target="#arrivalModal">
                    <span id="arrivalAirport">PUS<br>부산/김해</span>
                </button>
            </div>
            <div class="d-grid gap-2 m-2">
                <button class="btn btn-light" type="button" data-bs-toggle="modal"
                        data-bs-target="#dateModal"><span style="font-weight: bold" id="departureDate">탑승일</span>
                    <span style="font-weight: bold" id="wave"></span>
                    <span style="font-weight: bold" id="arrivalDate">선택</span>
                </button>
            </div>
        </div>
        <div class="col-sm-auto">
            <div class="d-grid gap-2">
                <button class="btn btn-outline-secondary" data-bs-toggle="modal"
                        data-bs-target="#passengerModal">
                    성인: <span id="passengerAdult">1</span>
                    소아: <span id="passengerChild"></span>
                    유아: <span id="passengerInfant"></span>
                </button>
            </div>
            <label style="font-size: 15px; color: gray">좌석 등급</label>
            <select class="form-select" aria-label="Default select example" id="cabinClass">
                <option selected>일반석</option>
                <option value="1">프레스티지석</option>
                <option value="2">일등석</option>
            </select>
        </div>
    </div>
    <div class="row m-5">
        <div class="d-grid gap-2 col-3 mx-auto">
            <button class="btn btn-primary btn-lg" type="button" onclick="searchFlight()">항공편 검색</button>
        </div>
    </div>
    <!-- departureModal -->
    <div class="modal fade" id="departureModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">출발 지역과 도시 선택</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-4">
                            <div class="list-group" id="list-tab" role="tablist">
                                <a class="list-group-item list-group-item-action active" id="list-home-list"
                                   data-bs-toggle="list" href="#list-home" role="tab" aria-controls="list-home">대한민국</a>
                                <a class="list-group-item list-group-item-action" id="list-profile-list"
                                   data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">동북아시아</a>
                                <a class="list-group-item list-group-item-action" id="list-messages-list"
                                   data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="list-messages">동남아시아/서남아시아</a>
                                <a class="list-group-item list-group-item-action" id="list-settings-list"
                                   data-bs-toggle="list" href="#list-settings" role="tab" aria-controls="list-settings">미주</a>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="list-home" role="tabpanel"
                                     aria-labelledby="list-home-list">
                                    <div class="list-group">
                                        <button type="button" class="list-group-item list-group-item-action" id="icn"
                                                value="ICN<br>서울/인천" onclick="selectDeparture(this.id)"
                                                data-bs-dismiss="modal">ICN 서울/인천
                                        </button>
                                        <button type="button" class="list-group-item list-group-item-action" id="gmp"
                                                value="GMP<br>서울/김포" onclick="selectDeparture(this.id)"
                                                data-bs-dismiss="modal">GMP 서울/김포
                                        </button>
                                        <button type="button" class="list-group-item list-group-item-action" id="pus"
                                                value="PUS<br>부산/김해" onclick="selectDeparture(this.id)"
                                                data-bs-dismiss="modal">PUS 부산/김해
                                        </button>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="list-profile" role="tabpanel"
                                     aria-labelledby="list-profile-list">...
                                </div>
                                <div class="tab-pane fade" id="list-messages" role="tabpanel"
                                     aria-labelledby="list-messages-list">...
                                </div>
                                <div class="tab-pane fade" id="list-settings" role="tabpanel"
                                     aria-labelledby="list-settings-list">...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- arrivalModal -->
<div class="modal fade" id="arrivalModal" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">출발 지역과 도시 선택</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-4">
                        <div class="list-group" id="list-tab2" role="tablist">
                            <a class="list-group-item list-group-item-action active" id="list-home-list2"
                               data-bs-toggle="list" href="#list-home" role="tab" aria-controls="list-home">대한민국</a>
                            <a class="list-group-item list-group-item-action" id="list-profile-list2"
                               data-bs-toggle="list" href="#list-profile" role="tab"
                               aria-controls="list-profile">동북아시아</a>
                            <a class="list-group-item list-group-item-action" id="list-messages-list2"
                               data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="list-messages">동남아시아/서남아시아</a>
                            <a class="list-group-item list-group-item-action" id="list-settings-list2"
                               data-bs-toggle="list" href="#list-settings" role="tab"
                               aria-controls="list-settings">미주</a>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="tab-content" id="nav-tabContent2">
                            <div class="tab-pane fade show active" id="list-home2" role="tabpanel"
                                 aria-labelledby="list-home-list">
                                <div class="list-group">
                                    <button type="button" class="list-group-item list-group-item-action" id="icn2"
                                            value="ICN<br>서울/인천" onclick="selectArrival(this.id)"
                                            data-bs-dismiss="modal">ICN 서울/인천
                                    </button>
                                    <button type="button" class="list-group-item list-group-item-action" id="gmp2"
                                            value="GMP<br>서울/김포" onclick="selectArrival(this.id)"
                                            data-bs-dismiss="modal">GMP 서울/김포
                                    </button>
                                    <button type="button" class="list-group-item list-group-item-action" id="pus2"
                                            value="PUS<br>부산/김해" onclick="selectArrival(this.id)"
                                            data-bs-dismiss="modal">PUS 부산/김해
                                    </button>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="list-profile2" role="tabpanel"
                                 aria-labelledby="list-profile-list">...
                            </div>
                            <div class="tab-pane fade" id="list-messages2" role="tabpanel"
                                 aria-labelledby="list-messages-list">...
                            </div>
                            <div class="tab-pane fade" id="list-settings2" role="tabpanel"
                                 aria-labelledby="list-settings-list">...
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- passengerModal -->
<div class="modal fade" id="passengerModal" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel3">승객 선택</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <span>성인</span>
                        <input type="text" id="adultNumber">
                    </div>
                    <div class="col">
                        <span>소아</span>
                        <input type="text" id="childNumber">
                    </div>
                    <div class="col">
                        <span>유아</span>
                        <input type="text" id="infantNumber">
                    </div>
                </div>
                <div class="row m-5">
                    <div class="d-grid gap-2 col-3 mx-auto">
                        <button class="btn btn-primary btn-lg" type="button" onclick="passenger()"
                                data-bs-dismiss="modal">확인
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- dateModal -->
<div class="modal fade" id="dateModal" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel4">승객 선택</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <span>가는 날</span>
                        <input type="text" id="datepicker">
                    </div>
                    <div class="col">
                        <span>오는 날</span>
                        <input type="text" id="datepicker2">
                    </div>
                </div>
                <div class="row m-5">
                    <div class="d-grid gap-2 col-3 mx-auto">
                        <button class="btn btn-primary btn-lg" type="button" onclick="selectDate()"
                                data-bs-dismiss="modal">선택
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<img src="../../../resources/img/booking-visual--pc.jpg">
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    function selectDeparture(id) {
        const airportName = document.getElementById(id).value;
        document.getElementById("departureAirport").innerHTML = airportName;
    }

    function selectArrival(id) {
        const airportName = document.getElementById(id).value;
        document.getElementById("arrivalAirport").innerHTML = airportName;
    }

    function passenger() {
        const passengerAdult = document.getElementById("adultNumber").value;
        const passengerChild = document.getElementById("childNumber").value;
        const passengerInfant = document.getElementById("infantNumber").value;
        document.getElementById("passengerAdult").innerHTML = passengerAdult;
        document.getElementById("passengerChild").innerHTML = passengerChild;
        document.getElementById("passengerInfant").innerHTML = passengerInfant;
    }

    // datepicker
    $(function () {
        //모든 datepicker에 대한 공통 옵션 설정
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            , showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
            , changeYear: true //콤보박스에서 년 선택 가능
            , changeMonth: true //콤보박스에서 월 선택 가능
            , showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
            , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            , buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            , buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
            , yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            , monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
            , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
            , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
            , dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
            , minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            , maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        });

        //input을 datepicker로 선언
        $("#datepicker").datepicker();
        $("#datepicker2").datepicker();

        //From의 초기값을 오늘 날짜로 설정
        $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        //To의 초기값을 내일로 설정
        $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    });

    function selectDate() {
        const datepicker = document.getElementById("datepicker").value;
        const datepicker2 = document.getElementById("datepicker2").value;
        document.getElementById("departureDate").innerHTML = datepicker;
        document.getElementById("wave").innerHTML = "~";
        document.getElementById("arrivalDate").innerHTML = datepicker2;
    }

    function searchFlight() {
        const departureAirport = document.getElementById("departureAirport").textContent;
        const arrivalAirport = document.getElementById("arrivalAirport").textContent;
        const departureDate = document.getElementById("departureDate").textContent;
        const arrivalDate = document.getElementById("arrivalDate").textContent;
        const passengerAdult = document.getElementById("passengerAdult").textContent;
        const passengerChild = document.getElementById("passengerChild").textContent;
        const passengerInfant = document.getElementById("passengerInfant").textContent;
        const cabinClass = document.getElementById("cabinClass").value;
        console.log(departureAirport, arrivalAirport, departureDate, arrivalDate, passengerAdult, passengerChild, passengerInfant, cabinClass);
        $.ajax({
            type: "post",
            url: "/book/search",
            data: {
                "departureAirport": departureAirport,
                "arrivalAirport": arrivalAirport,
                "departureDate": departureDate,
                "arrivalDate": arrivalDate,
                "passengerAdult": passengerAdult,
                "passengerChild": passengerChild,
                "passengerInfant": passengerInfant,
                "cabinClass": cabinClass
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                alert("성공");
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    }
</script>
</html>
