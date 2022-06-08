<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>운항 등록</title>
    <style>
        input {
            display: block;
        }
    </style>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2 class="display-4 fw-normal">save.jsp</h2>
            <form action="/flight/save" method="post">
                편명<input type="text" name="flightNumber">
                항공사<input type="text" name="flightAirline">
                항공기 번호<input type="text" name="airplaneId">
                출발 공항<input type="text" name="departureAirport">
                도착 공항<input type="text" name="arrivalAirport">
                출발 날짜<input type="text" name="departureDate">
                도착 날짜<input type="text" name="arrivalDate">
                탑승 게이트 번호<input type="text" name="gateNumber">
                <input class="btn btn-primary" type="submit" value="운항 등록">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
