<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: 오전 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2 class="display-4 fw-normal">myPage.jsp</h2>
            <button class="btn btn-outline-success" onclick="update()">회원정보 수정</button>
            <br>
            <button class="btn btn-outline-success" onclick="deleteMyself()">회원탈퇴</button>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    function update() {
        location.href = "/member/update";
    }

    function deleteMyself() {
        location.href = "/member/deleteMyself?id=${sessionScope.loginId}";
    }
</script>
</html>
