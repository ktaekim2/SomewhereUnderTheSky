<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="row" style="border-bottom: 1px solid lightgrey; border-left: 1px solid lightgrey; border-right: 1px solid lightgrey">
        <img src="../../../resources/img/booking--edge.svg" height="4" style="float: top; object-fit: cover">
        <div class="row m-5">
            <div class="col-sm-8">
                <div class="text-center mb-2">
                    <button type="button" class="btn btn-outline" data-bs-toggle="modal"
                            data-bs-target="#departureModal" style="font-weight: bold; font-size: x-large; color: black">
                        <span id="departureAirport">GMP(서울/김포)</span>
                    </button>
                    <span style="color:dodgerblue">---------------</span>
                    <a href="#"><img src="../../../resources/img/booking__swap.svg" onclick="changeDestination()"></a>
                    <span style="color:dodgerblue">---------------</span>
                    <button type="button" class="btn btn-outline" data-bs-toggle="modal"
                            data-bs-target="#arrivalModal" style="font-weight: bold; font-size: x-large; color: black">
                        <span id="arrivalAirport">PUS(부산/김해)</span>
                    </button>
                </div>
                <div class="d-grid gap-2 m-2">
                    <button class="btn btn-outline" type="button" data-bs-toggle="modal"
                            data-bs-target="#dateModal" style="background-color: white"><span style="font-weight: bold" id="departureDate">탑승일</span>
                        <span style="font-weight: bold" id="wave"></span>
                        <span style="font-weight: bold" id="returnDate">선택</span>
                    </button>
                </div>
            </div>
            <div class="col-sm-auto">
                <div class="d-grid gap-2">
                    <button class="btn btn-outline-secondary" data-bs-toggle="modal"
                            data-bs-target="#passengerModal">
                        성인: <span id="passengerAdult">1</span>
                        소아: <span id="passengerChild">0</span>
                        유아: <span id="passengerInfant">0</span>
                    </button>
                </div>
                <label style="font-size: 15px; color: gray">좌석 등급</label>
                <select class="form-select" aria-label="Default select example" id="cabinClass" onclick="cabinClass()">
                    <option selected value="일반석">일반석</option>
                    <option value="프레스티지석">프레스티지석</option>
                    <option value="일등석">일등석</option>
                </select>
            </div>
        </div>
    </div>

    <div class="row m-5">
        <div class="d-grid gap-2 col-3 mx-auto">
            <button class="btn btn-primary btn-lg" type="button" onclick="searchFlight()" id="searchButton">항공편 검색
            </button>
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
                                        <button type="button" class="list-group-item list-group-item-action" id="gmp"
                                                value="GMP(서울/김포)" onclick="selectDeparture(this.id)"
                                                data-bs-dismiss="modal">ICN(서울/김포)
                                        </button>
                                        <button type="button" class="list-group-item list-group-item-action" id="icn"
                                                value="ICN(서울/인천)" onclick="selectDeparture(this.id)"
                                                data-bs-dismiss="modal">GMP(서울/인천)
                                        </button>
                                        <button type="button" class="list-group-item list-group-item-action" id="pus"
                                                value="PUS(부산/김해)" onclick="selectDeparture(this.id)"
                                                data-bs-dismiss="modal">PUS(부산/김해)
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
                                    <button type="button" class="list-group-item list-group-item-action" id="gmp2"
                                            value="GMP(서울/김포)" onclick="selectDeparture(this.id)"
                                            data-bs-dismiss="modal">ICN(서울/김포)
                                    </button>
                                    <button type="button" class="list-group-item list-group-item-action" id="icn2"
                                            value="ICN(서울/인천)" onclick="selectDeparture(this.id)"
                                            data-bs-dismiss="modal">GMP(서울/인천)
                                    </button>
                                    <button type="button" class="list-group-item list-group-item-action" id="pus2"
                                            value="PUS(부산/김해)" onclick="selectArrival(this.id)"
                                            data-bs-dismiss="modal">PUS(부산/김해)
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
                        <input type="text" id="adultNumber" value="1">
                    </div>
                    <div class="col">
                        <span>소아</span>
                        <input type="text" id="childNumber" value="0">
                    </div>
                    <div class="col">
                        <span>유아</span>
                        <input type="text" id="infantNumber" value="0">
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
                <h5 class="modal-title" id="exampleModalLabel4">탑승일 선택</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <span>가는 날</span>
                        <input type="text" id="datepicker">
                    </div>
                    <div class="col" id="return">
                        <span>오는 날</span>
                        <input type="text" id="datepicker2">
                    </div>
                </div>
                <div class="row m-5">
                    <div class="d-grid gap-2 col-3 mx-auto">
                        <button class="btn btn-primary btn-lg" type="button" onclick="selectTrip()" id="selectTrip"
                                value="편도">편도
                        </button>
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
<form action="/book/search" method="post" name="submitForm" hidden>
    <input name="departureAirport" id="inputDepartureAirport" value="GMP(서울/김포)">
    <input name="arrivalAirport" id="inputArrivalAirport" value="PUS(부산/김해)">
    <input name="departureDate" id="inputDepartureDate">
    <input name="passengerAdult" id="inputPassengerAdult" value="1">
    <input name="passengerChild" id="inputPassengerChild" value="0">
    <input name="passengerInfant" id="inputPassengerInfant" value="0">
    <input name="returnDate" id="inputReturnDate" value="1991-09-24">
    <input name="cabinClass" id="inputCabinClass" value="일반석">
</form>
<img src="../../../resources/img/booking-visual--pc.jpg">
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    // 편도/왕복
    function selectTrip() {
        const selectTrip = document.getElementById("selectTrip").value;
        if (selectTrip == "편도") {
            document.getElementById("selectTrip").innerHTML = "왕복";
            document.getElementById("selectTrip").value = "왕복";
            document.getElementById("return").style.display = "none";

        } else {
            document.getElementById("selectTrip").innerHTML = "편도";
            document.getElementById("selectTrip").value = "편도";
            document.getElementById("return").style.display = "block";
        }
    }

    // 출발지 선택
    function selectDeparture(id) {
        const airportName = document.getElementById(id).value;
        document.getElementById("departureAirport").innerHTML = airportName;
        document.getElementById("inputDepartureAirport").value = airportName;
    }

    // 도착지 선택
    function selectArrival(id) {
        const airportName = document.getElementById(id).value;
        document.getElementById("arrivalAirport").innerHTML = airportName;
        document.getElementById("inputArrivalAirport").value = airportName;
    }

    // 출도착지 바꾸기
    function changeDestination() {
        const departureAirport = document.getElementById("departureAirport").innerHTML;
        const arrivalAirport = document.getElementById("arrivalAirport").innerHTML;
        document.getElementById("departureAirport").innerHTML = arrivalAirport;
        document.getElementById("inputDepartureAirport").value = arrivalAirport;
        document.getElementById("arrivalAirport").innerHTML = departureAirport;
        document.getElementById("inputArrivalAirport").value = departureAirport;

    }

    // 승객 선택
    function passenger() {
        const passengerAdult = document.getElementById("adultNumber").value;
        const passengerChild = document.getElementById("childNumber").value;
        const passengerInfant = document.getElementById("infantNumber").value;
        document.getElementById("passengerAdult").innerHTML = passengerAdult;
        document.getElementById("passengerChild").innerHTML = passengerChild;
        document.getElementById("passengerInfant").innerHTML = passengerInfant;
        document.getElementById("inputPassengerAdult").value = passengerAdult;
        document.getElementById("inputPassengerChild").value = passengerChild;
        document.getElementById("inputPassengerInfant").value = passengerInfant;
    }

    // 탑승일 선택
    function selectDate() {
        const selectTrip = document.getElementById("selectTrip").value;
        const datepicker = document.getElementById("datepicker").value;
        const datepicker2 = document.getElementById("datepicker2").value;
        if (selectTrip == "편도") {
            document.getElementById("departureDate").innerHTML = datepicker;
            document.getElementById("wave").innerHTML = "~";
            document.getElementById("returnDate").innerHTML = datepicker2;
            document.getElementById("inputDepartureDate").value = datepicker;
            document.getElementById("inputReturnDate").value = datepicker2;
        } else {
            document.getElementById("departureDate").innerHTML = datepicker;
            document.getElementById("wave").innerHTML = "";
            document.getElementById("returnDate").innerHTML = null;
            document.getElementById("inputDepartureDate").value = datepicker;
            document.getElementById("inputReturnDate").value = "1991-09-24";
        }
    }

    // 좌석 등급 선택
    function cabinClass() {
        const cabinClass = document.getElementById("cabinClass").value;
        document.getElementById("inputCabinClass").value = cabinClass;
    }

    // 항공편 검색
    function searchFlight() {
        if (document.getElementById("inputDepartureDate").value != "") {
            submitForm.submit(); // 노란줄 있지만 잘됨
        } else {
            alert("탑승일을 선택하세요.")
        }
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

        //return날짜를 depart날짜보다 앞으로 설정 못하게, depart날짜를 과거 선택 못하게
        $('#datepicker').datepicker();
        $('#datepicker').datepicker('option', 'minDate', '0');
        $('#datepicker').datepicker("option", "maxDate", $("#datepicker2").val());
        $('#datepicker').datepicker("option", "onClose", function (selectedDate) {
            $("#datepicker2").datepicker("option", "minDate", selectedDate);
        });
        $('#datepicker2').datepicker();
        $('#datepicker2').datepicker("option", "minDate", $("#datepicker").val());
        $('#datepicker2').datepicker("option", "onClose", function (selectedDate) {
            $("#datepicker").datepicker("option", "maxDate", selectedDate);
        });
    });
</script>
</html>
