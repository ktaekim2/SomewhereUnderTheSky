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
        <div class="col-4">
            <div class="list-group" id="list-tab" role="tablist">
                <a class="list-group-item list-group-item-action active" id="list-home-list" data-bs-toggle="list" href="#list-home" role="tab" aria-controls="list-home">Home</a>
                <a class="list-group-item list-group-item-action" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">Profile</a>
                <a class="list-group-item list-group-item-action" id="list-messages-list" data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="list-messages">Messages</a>
                <a class="list-group-item list-group-item-action" id="list-settings-list" data-bs-toggle="list" href="#list-settings" role="tab" aria-controls="list-settings">Settings</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-8">
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">...</div>
                <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">...</div>
                <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">...</div>
                <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">...</div>
            </div>
        </div>
    </div>


    <div class="btn-group btn-group-lg" role="group" aria-label="Basic outlined example">
        <button type="button" class="btn btn-outline-" onclick="">
            <span id="threeDaysAgo"></span>
        </button>
        <button type="button" class="btn btn-outline-dark" onclick="">
            <span id="twoDaysAgo"></span>
        </button>
        <button type="button" class="btn btn-outline-dark" onclick="">
            <span id="aDayAgo"></span>
        </button>
        <button type="button" class="btn btn-outline-dark" onclick="">
            <span id="today"></span>
        </button>
        <button type="button" class="btn btn-outline-dark" onclick="">
            <span id="aDayLater"></span>
        </button>
        <button type="button" class="btn btn-outline-dark" onclick="">
            <span id="twoDaysLater"></span>
        </button>
        <button type="button" class="btn btn-outline-dark" onclick="">
            <span id="threeDaysLater"></span>
        </button>
    </div>
    <table class="table">
        <tr>
            <th>운항시간</th>
            <th>항공사</th>
            <th>편명</th>
            <th>가격</th>
        </tr>
        <tr>
            <c:forEach var="departF" items="${departFlight}">
            <td>${departF.departureDate} ~ ${departF.arrivalDate}</td>
            <td>${departF.flightAirline}</td>
            <td>${departF.flightNumber}</td>
            <td>${departF.flightFare}</td>
        </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    var threeDaysAgo = moment(new Date('${returnDate}')).subtract("3", "d").format('MM월 DD일');
    var twoDaysAgo = moment(new Date('${returnDate}')).subtract("2", "d").format('MM월 DD일');
    var aDayAgo = moment(new Date('${returnDate}')).subtract("1", "d").format('MM월 DD일');
    var today = moment(new Date('${returnDate}')).format('MM월 DD일');
    var aDayLater = moment(new Date('${returnDate}')).add("1", "d").format('MM월 DD일');
    var twoDaysLater = moment(new Date('${returnDate}')).add("2", "d").format('MM월 DD일');
    var threeDaysLater = moment(new Date('${returnDate}')).add("3", "d").format('MM월 DD일');
    document.getElementById("threeDaysAgo").innerHTML = threeDaysAgo;
    document.getElementById("twoDaysAgo").innerHTML = twoDaysAgo;
    document.getElementById("aDayAgo").innerHTML = aDayAgo;
    document.getElementById("today").innerHTML = today;
    document.getElementById("aDayLater").innerHTML = aDayLater;
    document.getElementById("twoDaysLater").innerHTML = twoDaysLater;
    document.getElementById("threeDaysLater").innerHTML = threeDaysLater;
</script>
</html>

