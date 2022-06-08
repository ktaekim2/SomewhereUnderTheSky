<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            <th>airplaneModel</th>
            <th>airplaneMaxSeats</th>
            <th>airplaneStatus</th>
            <th>airplaneFileName</th>
        </tr>
        <tr>
            <td>${airplane.id}</td>
            <td>${airplane.airplaneModel}</td>
            <td>${airplane.airplaneMaxSeats}</td>
            <td>${airplane.airplaneStatus}</td>
            <td>${airplane.airplaneFileName}</td>
        </tr>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
