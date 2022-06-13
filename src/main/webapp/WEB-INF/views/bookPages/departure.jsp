<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
    <h2>가는 편</h2>
    <div class="btn-group btn-group-lg" role="group" aria-label="Basic outlined example">
        <c:forEach var="departF" items="${departFlight}">
        <button type="button" class="btn btn-outline-dark" onclick="">
                <span>${departF.departureDate}</span>
        </button>
        </c:forEach>
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
            <td>${departF.departureDate} ~ ${departF.arrivalDate} </td>
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
</script>
</html>

