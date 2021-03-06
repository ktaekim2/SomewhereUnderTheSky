<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>

    <%--    jquery--%>
    <script src="/resources/js/jquery.js"></script>

    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

    <%--    momentjs--%>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.3/moment.min.js"></script>
    <style>
        #followquick {
            position: absolute;
            top: 180px;
            right: 50%;
            margin-right: -670px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row">
        <div class="row"><h4 style="color: #00256C"><b>여정 정보</b></h4></div>
        <div class="col-sm-9">
            <div class="list-group list-group-checkable">
                <div class="row" style="border: solid 1px lightgrey; margin: 10px 5px; padding: 30px 20px">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1"><b>가는 편 ${departureFlight.departureAirport}
                            &nbsp;<img
                                    src="../../../resources/img/departure-info__to.svg">&nbsp; ${departureFlight.arrivalAirport}
                        </b></h5>
                        <%--                        <small>3 days ago</small>--%>
                    </div>
                    <p class="mb-1"></p>
                    <small>${departureFlight.departureDate} &nbsp;<img
                            src="../../../resources/img/departure-info__to.svg">&nbsp; ${departureFlight.arrivalDate}
                        &nbsp; <b>${departureFlight.flightNumber}</b> &nbsp; ${book.cabinClass}</small>
                </div>

                <c:if test="${book.returnDate ne '1991-09-24 00:00:00'}">
                    <div class="row" style="border: solid 1px lightgrey; margin: 10px 5px; padding: 30px 20px">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1"><b>오는 편 ${returnFlight.departureAirport}
                                &nbsp;<img
                                        src="../../../resources/img/departure-info__to.svg">&nbsp; ${returnFlight.arrivalAirport}
                            </b></h5>
                                <%--                        <small>3 days ago</small>--%>
                        </div>
                        <p class="mb-1"></p>
                        <small>${returnFlight.departureDate} &nbsp;<img
                                src="../../../resources/img/departure-info__to.svg">&nbsp; ${returnFlight.arrivalDate}
                            &nbsp; <b>${returnFlight.flightNumber}</b> &nbsp; ${book.cabinClass}</small>
                    </div>
                </c:if>
            </div>

            <%--            승객 정보--%>
            <%--            성인--%>
            <div class="row">
                <h4 style="color: #00256C"><b>승객 정보</b></h4>
            </div>
            <div class="accordion">
                <c:forEach begin="0" end="${book.passengerAdult - 1}" var="i" step="1">
                    <div class="accordion-item" id="adultAccordion${i}">
                        <h2 class="accordion-header" id="adultHeading${i}">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#adultCollapse${i}" aria-expanded="true"
                                    aria-controls="adultCollapse${i}" id="adultAccordionButton${i}">
                                성인 ${i + 1}
                            </button>
                        </h2>
                        <div id="adultCollapse${i}" class="accordion-collapse collapse"
                             aria-labelledby="adultHeading${i}" data-bs-parent="#accordionExample">
                            <div class="accordion-body" style="padding: 32px 40px">
                                <div>
                                    <p style="background-color: whitesmoke; margin: 0px 0px 40px;padding: 16px 32px; color: #555555">
                                        예약 후 성명 변경은 <span style="color: #0064DE">불가</span>하오니 실제 탑승하실 분의 <span
                                            style="color: #0064DE">여권상 성명</span>으로 입력하시기 바랍니다.
                                    </p>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div>
                                            <label style="font-size: small;color: #767676;display: block">영문 성</label>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control"
                                                       aria-label="Sizing example input"
                                                       aria-describedby="inputGroup-sizing-default" id="lastName${i}"
                                                       style="text-transform: uppercase">
                                            </div>
                                            <p style="color: #0064DE; font-size: small">* 여권상 영문 성과 반드시 일치해야
                                                합니다.</p>
                                        </div>
                                        <div>
                                            <label style="font-size: small;color: #767676;display: block">성별</label>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="d-grid gap-2">
                                                        <input type="radio" class="btn-check" name="gender${i}"
                                                               id="male${i}"
                                                               autocomplete="off" value="male">
                                                        <label class="btn btn-outline-secondary"
                                                               for="male${i}">남자</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="d-grid gap-2">
                                                        <input type="radio" class="btn-check" name="gender${i}"
                                                               id="female${i}"
                                                               autocomplete="off" value="female">
                                                        <label class="btn btn-outline-secondary"
                                                               for="female${i}">여자</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div>
                                            <label style="font-size: small;color: #767676;display: block">영문 이름</label>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control"
                                                       aria-label="Sizing example input"
                                                       aria-describedby="inputGroup-sizing-default" id="firstName${i}"
                                                       style="text-transform: uppercase">
                                            </div>
                                            <p style="color: #0064DE; font-size: small">* 여권상 영문 이름과 반드시 일치해야
                                                합니다.</p>
                                        </div>
                                        <div>
                                            <label style="font-size: small;color: #767676;display: block">생년월일
                                                (YYYY-MM-DD)</label>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control"
                                                       aria-label="Sizing example input"
                                                       aria-describedby="inputGroup-sizing-default" id="birthDate${i}">
                                            </div>
                                                <%--                                            <div class="d-grid gap-2 col-4 mx-auto" style="float: right">--%>
                                                <%--                                                <button type="button" class="btn btn-primary btn-lg">확인--%>
                                                <%--                                                </button>--%>
                                                <%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


                <%--            연락처 정보--%>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="contactHeading">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#contactCollapse" aria-expanded="true" aria-controls="contactCollapse">
                            연락처 정보
                        </button>
                    </h2>
                    <div id="contactCollapse" class="accordion-collapse collapse" aria-labelledby="contactHeading"
                         data-bs-parent="#contactAccordion">
                        <div class="accordion-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <label style="font-size: small;color: #767676;display: block">연락처</label>
                                        <select class="form-select"
                                                aria-label="Default select example">
                                            <option value="1" selected>휴대폰</option>
                                            <option value="2">집</option>
                                            <option value="3">회사</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <label style="font-size: small;color: #767676;display: block">국가번호</label>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="d-grid gap-2">
                                                    <input type="button" class="btn btn-outline-secondary" value="국가번호">
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="input-group mb-3">
                                                    <input type="text" class="form-control"
                                                           aria-label="Sizing example input"
                                                           aria-describedby="inputGroup-sizing-default" value="82">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <label style="font-size: small;color: #767676;display: block">전화번호</label>
                                        <div class="row">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control"
                                                       aria-label="Sizing example input"
                                                       aria-describedby="inputGroup-sizing-default">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label style="font-size: small;color: #767676;display: block">이메일</label>
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control"
                                                   aria-label="Sizing example input"
                                                   aria-describedby="inputGroup-sizing-default"
                                                   value="email${member.memberEmail}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--            유의사항--%>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            유의사항
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <ul style="font-size: small;color: #767676; font-weight: bold">
                                <li>예약 후 성명 변경은 <span style="color: #0064DE">불가</span>하오니 실제 탑승하실 분의 <span
                                        style="color: #0064DE">여권상 성명</span>으로 입력하시기 바랍니다.
                                </li>
                                <li>입력하신 회원번호로 탑승 마일리지가 적립되며, 마일리지 적립율은 선택하신 항공사에 따라 상이할 수 있습니다.</li>
                                <li>스카이패스 마일리지 적립을 원하시는 경우, 탑승 전까지 회원가입을 하시기 바랍니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--우측 퀵메뉴--%>
        <div class="col-sm-3">
            <div class="position-fixed">
                <div style="border-top: solid 1px lightgrey; border-bottom:solid 1px lightgrey; margin: 10px 5px; padding: 30px 0px 20px">
                    <div>
                        <b>항공 운송료</b>
                        <ul class="list-group list-group-flush" style="font-size: small">
                            <li class="list-group-item">
                                <span>운임</span>
                                <span>${(departureFlight.flightFare + returnFlight.flightFare) * 0.8} 원</span>
                            </li>
                            <li class="list-group-item">
                                <span>유류할증료</span>
                                <span>${(departureFlight.flightFare + returnFlight.flightFare) * 0.15} 원</span>
                            </li>
                            <li class="list-group-item">
                                <span>세금, 수수료 및 기타 요금</span>
                                <span>${(departureFlight.flightFare + returnFlight.flightFare) * 0.05} 원</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row" style="border-bottom:solid 1px lightgrey; padding: 32px 0px">
                    <div class="col-sm-4">
                    <span style="font-weight: bold; float: left">총액</span>
                    </div>
                    <div class="col-sm-8">
                    <button type="button" class="btn btn-link"><span
                            style="color:#0064DE; font-weight: bold;font-size: x-large; float: right">${departureFlight.flightFare + returnFlight.flightFare} 원</span>
                    </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--sticky bottom--%>
<div class="sticky-bottom" style="background-color: white; border-top:1px solid lightgrey">
    <div class="container">
        <div class="row">
            <div class="col-4 mt-3">
                <span style="font-size: larger"><b>최종 결제 금액:</b></span>
            </div>
            <div class="col-3 mt-2">
                <span id="price"
                      style="font-size: x-large; color: #00256C; font-weight: bold; float: right">${departureFlight.flightFare + returnFlight.flightFare} 원</span>
            </div>
            <div class="col">
                <div class="d-grid col-6 mx-auto" style="float: right">
                    <button type="button" class="btn btn-primary btn-lg"
                            style="background-color: #00256C; font-size: large;font-weight: bold; padding: 15px"
                            onclick="savePassenger()">결제하기
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
<script>
    // // 아임포트
    // var IMP = window.IMP; // 생략 가능
    // IMP.init("{imp66752664}"); // 예: imp00000000

    // 페이지 로딩이 끝나면 로그인 멤버 정보를 자동 기입
    $().ready(function () {
        console.log("레디펑션")
        document.getElementById("lastName0").value = "${member.memberLastName}";
        $('input:text[id="lastName0"]').prop('disabled', true);
        document.getElementById("firstName0").value = "${member.memberFirstName}";
        $('input:text[id="firstName0"]').prop('disabled', true);
        if (${member.memberGender == "남"}) {
            $('input:radio[id="male0"]').prop('checked', true);
            $('input:radio[id="female0"]').prop('disabled', true);
        } else {
            $('input:radio[id="female0"]').prop('checked', true);
            $('input:radio[id="male0"]').prop('disabled', true);
        }
        document.getElementById("birthDate0").value = "${member.memberBirthdate}";
        $('input:text[id="birthDate0"]').prop('disabled', true);
    })

    // 승객 모두를 list에 저장해서 ajax로 java로 보내기
    function savePassenger() {
        console.log("savePassenger함수호출");
        const passengerList = {};

        <c:forEach begin="0" end="${book.passengerAdult + book.passengerChild + book.passengerInfant - 1}" var="i" step="1">
        console.log("i: " + ${i});
        passengerList[`passengers[${i}].passengerLastName`] = document.getElementById("lastName${i}").value;
        passengerList[`passengers[${i}].passengerFirstName`] = document.getElementById("firstName${i}").value;
        passengerList[`passengers[${i}].passengerGender`] = $("input[name='gender${i}']:checked").val();
        passengerList[`passengers[${i}].passengerBirthdate`] = document.getElementById("birthDate${i}").value;
        passengerList[`passengers[${i}].bookId`] = ${book.id};
        </c:forEach>
        console.log(passengerList);

        $.ajax({
            url: "/book/passengerSave",
            type: "POST",
            data: passengerList,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
            dataType: 'json',
            success: function (result) {
                alert(result);
            },
            error: function () {
                const departureFlightId = '${departureFlight.id}';
                const returnFlightId = '${returnFlight.id}';
                const bookId = '${book.id}'
                $.ajax({
                    url: "/book/reservation",
                    type: "POST",
                    data: {
                        "departureFlightId": departureFlightId,
                        "returnFlightId": returnFlightId,
                        "id": bookId
                    },
                    dataType: 'json',
                    success: function (result) {
                        alert("예약 성공");
                    },
                    error: function () {
                        alert("예약 실패");
                    }
                })
                location.href = "../";
            },
            Complete: function () {
                <%--// IMP.request_pay(param, callback) 결제창 호출--%>
                <%--IMP.request_pay({ // param--%>
                <%--    pg: "html5_inicis",--%>
                <%--    pay_method: "card",--%>
                <%--    merchant_uid: ${book.paymentId},--%>
                <%--    name: "항공권 결제",--%>
                <%--    amount: "${departureFlight.flightFare + returnFlight.flightFare}",--%>
                <%--    buyer_email: "${member.memberEmail}",--%>
                <%--    buyer_name: "${member.memberLastName + member.memberFirstName}",--%>
                <%--    buyer_tel: "${member.memberPhone}",--%>
                <%--    buyer_addr: "서울특별시 강남구 신사동",--%>
                <%--    buyer_postcode: "01181"--%>
                <%--}, function (rsp) { // callback--%>
                <%--    if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우--%>
                <%--        // jQuery로 HTTP 요청--%>
                <%--        jQuery.ajax({--%>
                <%--            url: "{/book/paymentCompleted}", // 예: https://www.myservice.com/payments/complete--%>
                <%--            method: "POST",--%>
                <%--            headers: { "Content-Type": "application/json" },--%>
                <%--            data: {--%>
                <%--                imp_uid: rsp.imp_uid,--%>
                <%--                merchant_uid: rsp.merchant_uid--%>
                <%--            }--%>
                <%--        }).done(function (data) {--%>
                <%--            // 가맹점 서버 결제 API 성공시 로직--%>
                <%--        })--%>
                <%--    } else {--%>
                <%--        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);--%>
                <%--    }--%>
                <%--});--%>
            }
        });
    }
</script>
</html>
