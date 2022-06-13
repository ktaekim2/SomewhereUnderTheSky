<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.3/moment.min.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>calendar-fare.jsp</h2>
    <table class="table">
        <tr>
            <td></td>
            <th colspan="7">오는 날</th>
        </tr>
<%--        <tr>--%>
<%--            <td>가는 날</td>--%>
<%--            <td id="threeDaysAgo"></td>--%>
<%--            <td id="twoDaysAgo"></td>--%>
<%--            <td id="aDayAgo"></td>--%>
<%--            <td id="today"></td>--%>
<%--            <td id="aDayLater"></td>--%>
<%--            <td id="twoDaysLater"></td>--%>
<%--            <td id="threeDaysLater"></td>--%>
<%--        </tr>--%>
        <tr>
            <td>가는 날</td>
            <c:forEach var="returnF" items="${returnFlight}">
                <td>${returnF.departureDate}</td>
            </c:forEach>
        </tr>
        <c:forEach var="departF" items="${departFlight}">
            <tr>
                <td>${departF.departureDate}</td>
                <td>${departF.flightFare}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    // 오는날
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

    // 가는날
    var threeDaysAgoD = moment(new Date('${departureDate}')).subtract("3", "d").format('MM월 DD일');
    var twoDaysAgoD = moment(new Date('${departureDate}')).subtract("2", "d").format('MM월 DD일');
    var aDayAgoD = moment(new Date('${departureDate}')).subtract("1", "d").format('MM월 DD일');
    var todayD = moment(new Date('${departureDate}')).format('MM월 DD일');
    var aDayLaterD = moment(new Date('${departureDate}')).add("1", "d").format('MM월 DD일');
    var twoDaysLaterD = moment(new Date('${departureDate}')).add("2", "d").format('MM월 DD일');
    var threeDaysLaterD = moment(new Date('${departureDate}')).add("3", "d").format('MM월 DD일');
    document.getElementById("threeDaysAgoD").innerHTML = threeDaysAgoD;
    document.getElementById("twoDaysAgoD").innerHTML = twoDaysAgoD;
    document.getElementById("aDayAgoD").innerHTML = aDayAgoD;
    document.getElementById("todayD").innerHTML = todayD;
    document.getElementById("aDayLaterD").innerHTML = aDayLaterD;
    document.getElementById("twoDaysLaterD").innerHTML = twoDaysLaterD;
    document.getElementById("threeDaysLaterD").innerHTML = threeDaysLaterD;
</script>
</html>

