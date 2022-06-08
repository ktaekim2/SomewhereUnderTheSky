<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
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
    <h2>airplaneList.jsp</h2>
    <table class="table">
        <tr>
            <th>항공기 번호</th>
            <th>항공기 기종</th>
            <th>항공기 총 좌석 수</th>
            <th>항공기 상태</th>
            <th>항공기 사진</th>
        </tr>
        <c:forEach var="airplane" items="${airplaneList}">
            <tr>
                <td>${airplane.id}</td>
                <td>${airplane.airplaneModel}</td>
                <td>${airplane.airplaneMaxSeats}</td>
                <td>${airplane.airplaneStatus}</td>
                <td>${airplane.airplaneFileName}</td>
                <td><a href="/member/detail?id=${airplane.id}">상세조회</a></td>
                <td><a href="/member/delete?id=${airplane.id}">회원삭제</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
