<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: 오전 9:02
  To change this template use File | Settings | File Templates.
--%>
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
            <th>memberAccount</th>
            <th>memberPassword</th>
            <th>memberLastName</th>
            <th>memberFirstName</th>
            <th>memberPassportNumber</th>
            <th>memberBirthdate</th>
            <th>memberGender</th>
            <th>memberEmail</th>
            <th>memberNation</th>
        </tr>
        <tr>
            <td>${member.id}</td>
            <td>${member.memberAccount}</td>
            <td>${member.memberPassword}</td>
            <td>${member.memberLastName}</td>
            <td>${member.memberFirstName}</td>
            <td>${member.memberPassportNumber}</td>
            <td>${member.memberBirthdate}</td>
            <td>${member.memberGender}</td>
            <td>${member.memberEmail}</td>
            <td>${member.memberNation}</td>
        </tr>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
