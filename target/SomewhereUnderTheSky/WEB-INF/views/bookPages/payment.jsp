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
            <div class="accordion" id="adultAccordion">
                <c:forEach begin="1" end="${book.passengerAdult}" var="i" step="1">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="adultHeading${i}">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#adultCollapse${i}" aria-expanded="true"
                                    aria-controls="adultCollapse${i}">
                                성인 ${i}
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
                                                       aria-describedby="inputGroup-sizing-default" id="lastName${i}" style="text-transform: uppercase">
                                            </div>
                                            <p style="color: #0064DE; font-size: small">* 여권상 영문 성과 반드시 일치해야
                                                합니다.</p>
                                        </div>
                                        <div>
                                            <label style="font-size: small;color: #767676;display: block">성별</label>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="d-grid gap-2">
                                                        <input type="radio" class="btn-check" name="options"
                                                               id="male${i}"
                                                               autocomplete="off">
                                                        <label class="btn btn-outline-secondary"
                                                               for="male${i}">남자</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="d-grid gap-2">
                                                        <input type="radio" class="btn-check" name="options"
                                                               id="female${i}"
                                                               autocomplete="off">
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
                                                       aria-describedby="inputGroup-sizing-default" id="firstName${i}" style="text-transform: uppercase">
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
                                            <div class="d-grid gap-2 col-4 mx-auto" style="float: right">
                                                <button type="button" class="btn btn-primary btn-lg">확인</button>
                                            </div>
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
                                        <label style="font-size: small;color: #767676;display: block">국가 번호</label>
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
                <div style="border-bottom:solid 1px lightgrey; padding: 32px 0px">
                    <span style="font-weight: bold; float: left; vertical-align: middle">총액</span>
                    <button type="button" class="btn btn-link"><span
                            style="color:#0064DE; font-weight: bold;font-size: x-large; float: right">${departureFlight.flightFare + returnFlight.flightFare} 원</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<%--sticky bottom--%>
<div class="fixed-bottom" style="background-color: white; border-top:1px solid lightgrey">
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
                            onclick="payment()">결제하기
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
<script>
    // 페이지 로딩이 끝나면 로그인 멤버 정보를 자동 기입
    $().ready(function () {
        console.log("레디펑션")
        document.getElementById("lastName1").value = "${member.memberLastName}";
        $('input:text[id="lastName1"]').prop('disabled', true);
        document.getElementById("firstName1").value = "${member.memberFirstName}";
        $('input:text[id="firstName1"]').prop('disabled', true);
        if (${member.memberGender == "남"}) {
            $('input:radio[id="male1"]').prop('checked', true);
            $('input:radio[id="female1"]').prop('disabled', true);
        } else {
            $('input:radio[id="female1"]').prop('checked', true);
            $('input:radio[id="male1"]').prop('disabled', true);
        }
        document.getElementById("birthDate1").value = "${member.memberBirthdate}";
        $('input:text[id="birthDate1"]').prop('disabled', true);
    })
</script>
</html>
