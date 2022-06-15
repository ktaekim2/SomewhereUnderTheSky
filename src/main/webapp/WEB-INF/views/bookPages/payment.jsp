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
            <div class="list-group">
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
            <div class="row">
                <h4 style="color: #00256C"><b>승객 정보</b></h4>
            </div>
            <div class="accordion" id="accordionExample">
                <c:forEach begin="1" end="${book.passengerAdult}" var="i" step="1">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="adultHeading${i}">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#adultCollapse${i}" aria-expanded="true"
                                    aria-controls="adultCollapse${i}">
                                성인 ${i}
                            </button>
                        </h2>
                        <div id="adultCollapse${i}" class="accordion-collapse collapse show"
                             aria-labelledby="adultHeading${i}" data-bs-parent="#accordionExample">
                            <div class="accordion-body" style="padding: 32px 40px">
                                <div>
                                    <p style="background-color: whitesmoke; margin: 0px 0px 40px;padding: 16px 32px; color: #555555">
                                        예약 후 성명 변경은 <span style="color: #0064DE">불가</span>하오니 실제 탑승하실 분의 <span
                                            style="color: #0064DE">신분증상 성명</span>으로 입력하시기 바랍니다.
                                    </p>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div>
                                            <label style="font-size: small;color: #767676;display: block">영문 성</label>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control"
                                                       aria-label="Sizing example input"
                                                       aria-describedby="inputGroup-sizing-default">
                                            </div>
                                            <p style="color: #0064DE; font-size: small">* 공항에서 제시할 신분증 상 언어와 반드시 일치해야
                                                합니다.</p>
                                        </div>
                                        <div>
                                            <label style="font-size: small;color: #767676;display: block">성별</label>
                                            <div class="row">
                                            <div class="col-sm-6">
                                                <div class="d-grid gap-2">
                                                    <input type="radio" class="btn-check" name="options" id="male"
                                                           autocomplete="off">
                                                    <label class="btn btn-outline-dark" for="male">남자</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="d-grid gap-2">
                                                    <input type="radio" class="btn-check" name="options" id="female"
                                                           autocomplete="off">
                                                    <label class="btn btn-outline-dark" for="female">여자</label>
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
                                                       aria-describedby="inputGroup-sizing-default">
                                            </div>
                                            <p style="color: #0064DE; font-size: small">* 공항에서 제시할 신분증 상 언어와 반드시 일치해야
                                                합니다.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="col-sm-3">
            <div class="followquick">
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
                <div style="border-bottom:solid 1px lightgrey; margin: 10px 5px; padding: 30px 0px 20px">
                    <span style="font-weight: bold">총액</span>
                    <button><span>${departureFlight.flightFare + returnFlight.flightFare} 원</span></button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--sticky bottom--%>
<div class="sticky-bottom" style="background-color: white; border-top:1px solid lightgrey">
    <div class="container">
        <div class="row">
            <div class="col-6 mt-2">
                <span style="font-size: larger"><b>최종 결제 금액:</b></span>
            </div>
            <div class="col-2 mt-2">
                <span id="price"
                      style="font-size: larger; color: #00256C; font-weight: bold">${departureFlight.flightFare + returnFlight.flightFare} 원</span>
            </div>
            <div class="col">
                <div class="btn-group btn-group-lg col-12 mx-auto" role="group" aria-label="...">
                    <button type="button" class="btn btn-outline-primary" style="color: #00256C"
                            onclick="payment()" id="nonMemNxtBtn">결제하기
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    //follow quick menu
    $(window).scroll(function () {
        var scrollTop = $(document).scrollTop();
        if (scrollTop < 180) {
            scrollTop = 180;
        }
        $("#followquick").stop();
        $("#followquick").animate({"top": scrollTop});
    });
</script>
</html>
