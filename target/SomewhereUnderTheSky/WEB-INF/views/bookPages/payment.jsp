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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row">
        <div class="row"><h4 style="color: #00256C"><b>여정 정보</b></h4></div>
        <div class="col-sm-9">
            <div class="list-group">
                <div class="row" style="border: solid 1px darkgray; margin: 10px 5px; padding: 30px 20px">
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
                    <div class="row" style="border: solid 1px darkgray; margin: 10px 5px; padding: 30px 20px">
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
        </div>
        <div class="col-sm-3">
            <div style="border-top: solid 1px darkgray; border-bottom:solid 1px darkgray; margin: 10px 5px; padding: 30px 20px">
                <div>
                    <b>항공 운송료</b>
                    <ul>
                        <li>
                            <span>운임</span>
                            <span>${(departureFlight.flightFare + returnFlight.flightFare) * 0.8} 원</span>
                        </li>
                        <li>
                            <span>유류할증료</span>
                            <span>${(departureFlight.flightFare + returnFlight.flightFare) * 0.15} 원</span>
                        </li>
                        <li>
                            <span>세금, 수수료 및 기타 요금</span>
                            <span>${(departureFlight.flightFare + returnFlight.flightFare) * 0.05} 원</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div style="border-bottom:solid 1px darkgray; margin: 10px 5px; padding: 30px 20px">
                <span>총액</span>
                <button><span>${departureFlight.flightFare + returnFlight.flightFare} 원</span></button>
            </div>
        </div>
    </div>
</div>
<%--sticky bottom--%>
<div class="sticky-bottom" style="background-color: white; border-top:1px solid gray; box-shadow: 0px 5px 30px 5px">
    <div class="container">
        <div class="row">
            <div class="col-6 mt-2">
                <span style="font-size: larger"><b>최종 결제 금액:</b></span>
            </div>
            <div class="col-2 mt-2">
                <span id="price" style="font-size: larger; color: #00256C; font-weight: bold">0 원</span>
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
    $(document).ready(function () {
        var currentPosition = parseInt($(".col-sm-2").css("top"));
        $(window).scroll(function () {
            var position = $(window).scrollTop();
            $(".col-sm-2").stop().animate({"top": position + currentPosition + "px"}, 1000);
        });
    });
</script>
</html>
