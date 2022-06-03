<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오후 2:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 | SUTS</title>
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
            <h2>login.jsp</h2>
            <form action="/member/login" method="post">
                <input type="text" name="memberAccount" placeholder="아이디"><br>
                <input type="password" name="memberPassword" placeholder="비밀번호"><br>
                <input type="submit" value="로그인">
            </form>
            <a href="#">아이디 찾기</a>
            <a href="#">비밀번호 찾기</a><br>
            다음 계정으로 로그인<br>
            <button>네이버</button>
            <button>카카오</button>
            <br>
            <button>구글</button>
            <button>페이스북</button>
            <br>
            <a href="/member/save">회원가입</a>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
