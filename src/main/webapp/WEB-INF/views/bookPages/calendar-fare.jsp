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
    <h2>calendar-fare.jsp</h2>
    <table class="table">
        <tr>
            <td></td>
            <th colspan="7">오는 날</th>
        </tr>
            <tr>
                <td>가는 날</td>
                <td>${returnDate}</td>
                <td>${returnDate}</td>
                <td>${returnDate}</td>
                <td>${returnDate}</td>
                <td>${returnDate}</td>
                <td>${returnDate}</td>
                <td>${returnDate}</td>

<%--                <c:forEach var="returnF" items="${departFlight}">--%>
<%--                <td>${returnF.departureDate}</td>--%>
<%--                </c:forEach>--%>
            </tr>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    const asd = new Date();
    const yesterday = new Date(asd.setDate(asd.${returnDate} - 1));
    console.log(asd)
</script>
</html>

