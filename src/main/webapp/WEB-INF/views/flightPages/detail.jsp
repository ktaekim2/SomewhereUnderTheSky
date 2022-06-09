<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>운항 상세조회</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>detail.jsp</h2>
    <table class="table">
        <tr>
            <th>id</th>
            <th>flightNumber</th>
            <th>flightAirline</th>
            <th>airplaneId</th>
            <th>departureAirport</th>
            <th>arrivalAirport</th>
            <th>departureDate</th>
            <th>arrivalDate</th>
            <th>gateNumber</th>
            <th>flightFare</th>
        </tr>
        <tr>
            <td>${flight.id}</td>
            <td>${flight.flightNumber}</td>
            <td>${flight.flightAirline}</td>
            <td>${flight.airplaneId}</td>
            <td>${flight.departureAirport}</td>
            <td>${flight.arrivalAirport}</td>
            <td>${flight.departureDate}</td>
            <td>${flight.arrivalDate}</td>
            <td>${flight.gateNumber}</td>
            <td>${flight.flightFare}</td>
        </tr>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
