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
        <%--       bootstrap-listgroup, 항공권 선택 css --%>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        /**/
        #price {
            font-size: larger;
            color: #00256C;
            font-weight: bold;
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="../../../resources/css/list-groups.css" rel="stylesheet">

<body>
<%--    bootstrap-listgroup,  항공권 선택 css--%>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="bootstrap" viewBox="0 0 118 94">
        <title>Bootstrap</title>
        <path fill-rule="evenodd" clip-rule="evenodd"
              d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
    </symbol>

    <symbol id="calendar-event" viewBox="0 0 16 16">
        <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
        <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
    </symbol>

    <symbol id="alarm" viewBox="0 0 16 16">
        <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z"/>
        <path d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z"/>
    </symbol>

    <symbol id="list-check" viewBox="0 0 16 16">
        <path fill-rule="evenodd"
              d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
    </symbol>
</svg>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2><b>가는 편</b> ${departureAirport} -> ${arrivalAirport}</h2>
    <div class="row">
        <div class="col-12">
            <ul class="list-group list-group-horizontal">
                <a class="list-group-item list-group-item-action" id="list-threeDaysAgo-list" data-bs-toggle="list"
                   href="#list-threeDaysAgo"><span id="threeDaysAgo"></span></a>
                <a class="list-group-item list-group-item-action" id="list-twoDaysAgo-list" data-bs-toggle="list"
                   href="#list-twoDaysAgo"><span id="twoDaysAgo"></span></a>
                <a class="list-group-item list-group-item-action" id="list-aDayAgo-list" data-bs-toggle="list"
                   href="#list-aDayAgo"><span id="aDayAgo"></span></a>
                <a class="list-group-item list-group-item-action active" id="list-today-list" data-bs-toggle="list"
                   href="#list-today"><span id="today"></span></a>
                <a class="list-group-item list-group-item-action" id="list-aDayLater-list" data-bs-toggle="list"
                   href="#list-aDayLater"><span id="aDayLater"></span></a>
                <a class="list-group-item list-group-item-action" id="list-twoDaysLater-list" data-bs-toggle="list"
                   href="#list-twoDaysLater"><span id="twoDaysLater"></span></a>
                <a class="list-group-item list-group-item-action" id="list-threeDaysLater-list" data-bs-toggle="list"
                   href="#list-threeDaysLater"><span id="threeDaysLater"></span></a>
            </ul>
        </div>
    </div>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade" id="list-threeDaysAgo" role="tabpanel"
             aria-labelledby="list-threeDaysAgo-list">
        </div>
        <div class="tab-pane fade" id="list-twoDaysAgo" role="tabpanel" aria-labelledby="list-twoDaysAgo-list">
        </div>
        <div class="tab-pane fade" id="list-aDayAgo" role="tabpanel" aria-labelledby="list-aDayAgo-list">
        </div>
        <div class="tab-pane fade show active" id="list-today" role="tabpanel"
             aria-labelledby="list-today-list">
        </div>
        <div class="tab-pane fade" id="list-aDayLater" role="tabpanel" aria-labelledby="list-aDayLater-list">
        </div>
        <div class="tab-pane fade" id="list-twoDaysLater" role="tabpanel"
             aria-labelledby="list-twoDaysLater-list">
        </div>
        <div class="tab-pane fade" id="list-threeDaysLater" role="tabpanel"
             aria-labelledby="list-threeDaysLater-list">
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

<%--sticky bottom--%>
<c:choose>
    <c:when test="${sessionScope.loginMemberId eq null}">
        <div class="sticky-xxl-bottom" style="background-color: white; border-top:1px solid lightgrey">
            <div class="container">
                <div class="row">
                    <div class="col-6 mt-2">
                        <span style="font-size: larger"><b>예상 결제 금액:</b></span>
                    </div>
                    <div class="col-2 mt-2">
                        <span id="price">0 원</span>
                    </div>
                    <div class="col">
                        <div class="btn-group btn-group-lg" role="group" aria-label="...">
                            <button type="button" class="btn btn-outline-primary" style="color: #00256C"
                                    onclick="payment()" id="nonMemNxtBtn">비회원으로 진행
                            </button>
                            <button type="button" class="btn btn-primary" style="background-color: #00256C">회원으로
                                진행
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="sticky-xxl-bottom" style="background-color: white; border-top:1px solid gray; box-shadow: 0px 5px 30px 5px">
            <div class="container">
                <div class="row">
                    <div class="col-8 mt-2">
                        <span style="font-size: larger"><b>예상 결제 금액:</b></span>
                    </div>
                    <div class="col-2 mt-2">
                        <span style="font-size: larger"><b style="color: blue">0 원</b></span>
                    </div>
                    <div class="col">
                        <div class="btn-group btn-group-lg col-12 mx-auto" role="group" aria-label="...">
                            <button type="button" class="btn btn-primary" style="background-color: #00256C"
                                    onclick="payment()" id="nxtBtn">다음
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
<%--submit용 form태그--%>
<form action="/book/payment" method="get" name="submitForm" hidden>
    <input name="bookId" id="inputBookId" value="${bookId}">
    <input name="flightId" id="inputFlightId" value="null">
</form>
</body>
<script>
    // 상단 날짜 리스트
    const threeDaysAgo = moment(new Date('${departureDate}')).subtract("3", "d").format('MM월 DD일');
    const twoDaysAgo = moment(new Date('${departureDate}')).subtract("2", "d").format('MM월 DD일');
    const aDayAgo = moment(new Date('${departureDate}')).subtract("1", "d").format('MM월 DD일');
    const today = moment(new Date('${departureDate}')).format('MM월 DD일');
    const aDayLater = moment(new Date('${departureDate}')).add("1", "d").format('MM월 DD일');
    const twoDaysLater = moment(new Date('${departureDate}')).add("2", "d").format('MM월 DD일');
    const threeDaysLater = moment(new Date('${departureDate}')).add("3", "d").format('MM월 DD일');
    document.getElementById("threeDaysAgo").innerHTML = threeDaysAgo;
    document.getElementById("twoDaysAgo").innerHTML = twoDaysAgo;
    document.getElementById("aDayAgo").innerHTML = aDayAgo;
    document.getElementById("today").innerHTML = today;
    document.getElementById("aDayLater").innerHTML = aDayLater;
    document.getElementById("twoDaysLater").innerHTML = twoDaysLater;
    document.getElementById("threeDaysLater").innerHTML = threeDaysLater;

    // 가격 바꾸는 함수
    function changePrice(price) {
        console.log(price);
        document.getElementById("price").innerHTML = price + " 원";
    }

    // 다음 버튼 온클릭  form태그 실행 함수
    function payment() {
        if (document.getElementById("inputFlightId").value == "null") {
            alert("항공권을 선택하십시오.")
        } else {
            submitForm.submit();
        }
    }

    // 항공권 온클릭 시 발생
    function getFlightId(flightId) {
        document.getElementById("inputFlightId").value = flightId;
    }

    // list-threeDaysAgo
    $("#list-threeDaysAgo-list").click(function () {
        const departureDate = moment(new Date('${departureDate}')).subtract("3", "d").format('YYYY-MM-DD HH:mm:ss');
        const departureAirport = "${departureAirport}";
        const arrivalAirport = "${arrivalAirport}";
        console.log(departureDate);
        $.ajax({
            type: "get",
            url: "/book/findByDate",
            data: {
                "departureDate": departureDate,
                "departureAirport": departureAirport,
                "arrivalAirport": arrivalAirport,
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<div class='list-group list-group-checkable'>";
                for (let i in result) {
                    output += "<input class='list-group-item-check' onclick='changePrice(" + result[i].flightFare + "); getFlightId(" + result[i].id + ")' type='radio' name='flightId' id='" + result[i].id + "'>" +
                        "<label class='list-group-item py-3' for='" + result[i].id + "'>";
                    output += moment(result[i].departureDate).format("HH:mm")
                        + "&nbsp;->&nbsp;" + moment(result[i].arrivalDate).format("HH:mm");
                    output += "<span class='d-block small opacity-50'>" + result[i].flightAirline + "&nbsp;&nbsp;" + result[i].flightNumber + "&nbsp;&nbsp;" + result[i].flightFare + "</span>" +
                        "</label>";
                }
                output += "</div>";
                document.getElementById("list-threeDaysAgo").innerHTML = output;
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    });

    // list-twoDaysAgo
    $("#list-twoDaysAgo-list").click(function () {
        const departureDate = moment(new Date('${departureDate}')).subtract("2", "d").format('YYYY-MM-DD HH:mm:ss');
        const departureAirport = "${departureAirport}";
        const arrivalAirport = "${arrivalAirport}";
        console.log(departureDate);
        $.ajax({
            type: "get",
            url: "/book/findByDate",
            data: {
                "departureDate": departureDate,
                "departureAirport": departureAirport,
                "arrivalAirport": arrivalAirport,
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<div class='list-group list-group-checkable'>";
                for (let i in result) {
                    output += "<input class='list-group-item-check' onclick='changePrice(" + result[i].flightFare + "); getFlightId(" + result[i].id + ")' type='radio' name='flightId' id='" + result[i].id + "'>" +
                        "<label class='list-group-item py-3' for='" + result[i].id + "'>";
                    output += moment(result[i].departureDate).format("HH:mm")
                        + "&nbsp;->&nbsp;" + moment(result[i].arrivalDate).format("HH:mm");
                    output += "<span class='d-block small opacity-50'>" + result[i].flightAirline + "&nbsp;&nbsp;" + result[i].flightNumber + "&nbsp;&nbsp;" + result[i].flightFare + "</span>" +
                        "</label>";
                }
                output += "</div>";
                document.getElementById("list-twoDaysAgo").innerHTML = output;
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    });

    // list-aDayAgo
    $("#list-aDayAgo-list").click(function () {
        const departureDate = moment(new Date('${departureDate}')).subtract("1", "d").format('YYYY-MM-DD HH:mm:ss');
        const departureAirport = "${departureAirport}";
        const arrivalAirport = "${arrivalAirport}";
        console.log(departureDate);
        $.ajax({
            type: "get",
            url: "/book/findByDate",
            data: {
                "departureDate": departureDate,
                "departureAirport": departureAirport,
                "arrivalAirport": arrivalAirport,
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<div class='list-group list-group-checkable'>";
                for (let i in result) {
                    output += "<input class='list-group-item-check' onclick='changePrice(" + result[i].flightFare + "); getFlightId(" + result[i].id + ")' type='radio' name='flightId' id='" + result[i].id + "'>" +
                        "<label class='list-group-item py-3' for='" + result[i].id + "'>";
                    output += moment(result[i].departureDate).format("HH:mm")
                        + "&nbsp;->&nbsp;" + moment(result[i].arrivalDate).format("HH:mm");
                    output += "<span class='d-block small opacity-50'>" + result[i].flightAirline + "&nbsp;&nbsp;" + result[i].flightNumber + "&nbsp;&nbsp;" + result[i].flightFare + "</span>" +
                        "</label>";
                }
                output += "</div>";
                document.getElementById("list-aDayAgo").innerHTML = output;
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    });

    $().ready(function () {
        const departureDate = moment(new Date('${departureDate}')).format('YYYY-MM-DD HH:mm:ss');
        const departureAirport = "${departureAirport}";
        const arrivalAirport = "${arrivalAirport}";
        $.ajax({
            type: "get",
            url: "/book/findByDate",
            data: {
                "departureDate": departureDate,
                "departureAirport": departureAirport,
                "arrivalAirport": arrivalAirport,
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<div class='list-group list-group-checkable'>";
                for (let i in result) {
                    output += "<input class='list-group-item-check' onclick='changePrice(" + result[i].flightFare + "); getFlightId(" + result[i].id + ")' type='radio' name='flightId' id='" + result[i].id + "'>" +
                        "<label class='list-group-item py-3' for='" + result[i].id + "'>";
                    output += moment(result[i].departureDate).format("HH:mm")
                        + "&nbsp;->&nbsp;" + moment(result[i].arrivalDate).format("HH:mm");
                    output += "<span class='d-block small opacity-50'>" + result[i].flightAirline + "&nbsp;&nbsp;" + result[i].flightNumber + "&nbsp;&nbsp;" + result[i].flightFare + "</span>" +
                        "</label>";
                }
                output += "</div>";
                document.getElementById("list-today").innerHTML = output;
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    });

    // list-aDayLater
    $("#list-aDayLater-list").click(function () {
        const departureDate = moment(new Date('${departureDate}')).add("1", "d").format('YYYY-MM-DD HH:mm:ss');
        const departureAirport = "${departureAirport}";
        const arrivalAirport = "${arrivalAirport}";
        console.log(departureDate);
        $.ajax({
            type: "get",
            url: "/book/findByDate",
            data: {
                "departureDate": departureDate,
                "departureAirport": departureAirport,
                "arrivalAirport": arrivalAirport,
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<div class='list-group list-group-checkable'>";
                for (let i in result) {
                    output += "<input class='list-group-item-check' onclick='changePrice(" + result[i].flightFare + "); getFlightId(" + result[i].id + ")' type='radio' name='flightId' id='" + result[i].id + "'>" +
                        "<label class='list-group-item py-3' for='" + result[i].id + "'>";
                    output += moment(result[i].departureDate).format("HH:mm")
                        + "&nbsp;->&nbsp;" + moment(result[i].arrivalDate).format("HH:mm");
                    output += "<span class='d-block small opacity-50'>" + result[i].flightAirline + "&nbsp;&nbsp;" + result[i].flightNumber + "&nbsp;&nbsp;" + result[i].flightFare + "</span>" +
                        "</label>";
                }
                output += "</div>";
                document.getElementById("list-aDayLater").innerHTML = output;
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    });

    // list-twoDaysLater
    $("#list-twoDaysLater-list").click(function () {
        const departureDate = moment(new Date('${departureDate}')).add("2", "d").format('YYYY-MM-DD HH:mm:ss');
        const departureAirport = "${departureAirport}";
        const arrivalAirport = "${arrivalAirport}";
        console.log(departureDate);
        $.ajax({
            type: "get",
            url: "/book/findByDate",
            data: {
                "departureDate": departureDate,
                "departureAirport": departureAirport,
                "arrivalAirport": arrivalAirport,
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<div class='list-group list-group-checkable'>";
                for (let i in result) {
                    output += "<input class='list-group-item-check' onclick='changePrice(" + result[i].flightFare + "); getFlightId(" + result[i].id + ")' type='radio' name='flightId' id='" + result[i].id + "'>" +
                        "<label class='list-group-item py-3' for='" + result[i].id + "'>";
                    output += moment(result[i].departureDate).format("HH:mm")
                        + "&nbsp;->&nbsp;" + moment(result[i].arrivalDate).format("HH:mm");
                    output += "<span class='d-block small opacity-50'>" + result[i].flightAirline + "&nbsp;&nbsp;" + result[i].flightNumber + "&nbsp;&nbsp;" + result[i].flightFare + "</span>" +
                        "</label>";
                }
                output += "</div>";
                document.getElementById("list-twoDaysLater").innerHTML = output;
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    });

    // list-threeDaysLater
    $("#list-threeDaysLater-list").click(function () {
        const departureDate = moment(new Date('${departureDate}')).add("3", "d").format('YYYY-MM-DD HH:mm:ss');
        const departureAirport = "${departureAirport}";
        const arrivalAirport = "${arrivalAirport}";
        console.log(departureDate);
        $.ajax({
            type: "get",
            url: "/book/findByDate",
            data: {
                "departureDate": departureDate,
                "departureAirport": departureAirport,
                "arrivalAirport": arrivalAirport,
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<div class='list-group list-group-checkable'>";
                for (let i in result) {
                    output += "<input class='list-group-item-check' onclick='changePrice(" + result[i].flightFare + "); getFlightId(" + result[i].id + ")' type='radio' name='flightId' id='" + result[i].id + "'>" +
                        "<label class='list-group-item py-3' for='" + result[i].id + "'>";
                    output += moment(result[i].departureDate).format("HH:mm")
                        + "&nbsp;->&nbsp;" + moment(result[i].arrivalDate).format("HH:mm");
                    output += "<span class='d-block small opacity-50'>" + result[i].flightAirline + "&nbsp;&nbsp;" + result[i].flightNumber + "&nbsp;&nbsp;" + result[i].flightFare + "</span>" +
                        "</label>";
                }
                output += "</div>";
                document.getElementById("list-threeDaysLater").innerHTML = output;
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    });
</script>
</html>

