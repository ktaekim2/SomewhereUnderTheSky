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
    <h2>memberList.jsp</h2>
    <table class="table">
        <tr>
            <th>예약번호</th>
            <th>편명</th>
            <th>항공사</th>
            <th>출발공항</th>
            <th>출발날짜</th>
            <th>도착공항</th>
            <th>도착날짜</th>
            <th>회원삭제</th>
        </tr>
        <c:forEach var="book" items="${bookList}">
            <tr>
                <td id="bookId">${book.id}</td>
                <td id="flightNumber">${book.id}</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    //
    $().ready(function () {
        console.log("레디펑션")

        document.getElementById("lastName0").value = "${member.memberLastName}";
        $('input:text[id="lastName0"]').prop('disabled', true);
        document.getElementById("firstName0").value = "${member.memberFirstName}";
        $('input:text[id="firstName0"]').prop('disabled', true);
        if (${member.memberGender == "남"}) {
            $('input:radio[id="male0"]').prop('checked', true);
            $('input:radio[id="female0"]').prop('disabled', true);
        } else {
            $('input:radio[id="female0"]').prop('checked', true);
            $('input:radio[id="male0"]').prop('disabled', true);
        }
        document.getElementById("birthDate0").value = "${member.memberBirthdate}";
        $('input:text[id="birthDate0"]').prop('disabled', true);
    })
</script>
</html>
