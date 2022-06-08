<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>flightList.jsp</h2>
    <table class="table">
        <tr>
            <th>편명</th>
            <th>항공사</th>
            <th>출발 공항</th>
            <th>도착 공항</th>
            <th>출발 날짜</th>
            <th>도착 날짜</th>
            <th>탑승 게이트 번호</th>
            <th>상세조회</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <c:forEach var="flight" items="${flightList}">
            <tr>
                <td>${flight.flightNumber}</td>
                <td>${flight.flightAirline}</td>
                <td>${flight.departureAirport}</td>
                <td>${flight.arrivalAirport}</td>
                <td>${flight.departureDate}</td>
                <td>${flight.arrivalDate}</td>
                <td>${flight.gateNumber}</td>
                <td><a href="/flight/detail?id=${flight.id}">상세조회</a></td>
                <td><a href="/flight/update?id=${flight.id}">수정</a></td>
                <td><a href="/flight/delete?id=${flight.id}">삭제</a></td>
            </tr>
        </c:forEach>
    </table>
    <button onclick="save()">운항 등록</button>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    const save = () => {
        location.href = "/flight/save";
    }
</script>
</html>
