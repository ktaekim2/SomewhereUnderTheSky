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
    <h2>가는 편</h2>
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
            aDayAgo
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
</body>
<script>
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
                let output = "<table class='table'>";
                output += "<tr><th>운항시간</th>";
                output += "<th>항공사</th>";
                output += "<th>편명</th>";
                output += "<th>가격</th>";
                for (let i in result) {
                    output += "<tr>";
                    output += "<td>" + moment(result[i].departureDate).format("HH:mm")
                        + "~" + moment(result[i].arrivalDate).format("HH:mm") + "</td>";
                    output += "<td>" + result[i].flightAirline + "</td>";
                    output += "<td>" + result[i].flightNumber + "</td>";
                    output += "<td>" + result[i].flightFare + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('list-today').innerHTML = output;
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    });

</script>
</html>

