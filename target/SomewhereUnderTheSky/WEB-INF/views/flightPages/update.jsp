<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>운항 정보수정</title>
    <style>
        input {
            display: block;
        }
    </style>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2>update.jsp</h2>
            <form action="/flight/update" method="post" enctype="multipart/form-data">
                운항 번호<input class="form-control mb-2" type="text" name="id" value="${flight.id}" readonly>
                편명<input class="form-control mb-2" type="text" name="flightNumber"
                             value="${flight.flightNumber}">
                항공사<input class="form-control mb-2" type="text" name="flightAirline"
                                 value="${flight.flightAirline}">
                항공기 번호<input class="form-control mb-2" type="text" name="airplaneId"
                             value="${flight.airplaneId}">
                출발 공항<input class="form-control mb-2" type="text" name="departureAirport"
                             value="${flight.departureAirport}">
                도착 공항<input class="form-control mb-2" type="text" name="arrivalAirport"
                             value="${flight.arrivalAirport}">
                출발 날짜<input class="form-control mb-2" type="text" name="departureDate"
                             value="${flight.departureDate}">
                도착 날짜<input class="form-control mb-2" type="text" name="arrivalDate"
                             value="${flight.arrivalDate}">
                탑승 게이트 번호<input class="form-control mb-2" type="text" name="gateNumber"
                             value="${flight.gateNumber}">
                운임 요금<input class="form-control mb-2" type="text" name="flightFare"
                             value="${flight.flightFare}">
                <input class="btn btn-primary" type="submit" value="정보수정">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
