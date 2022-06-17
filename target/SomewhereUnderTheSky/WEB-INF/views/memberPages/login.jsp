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
<div style="background-color: #E8F0FE">
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-lg-5 align-content-center" style="background-color: white; margin: 80px; padding: 50px">
                <h2>로그인</h2>
                <form action="/member/login" method="post">
                    <div class="row" style="margin-top: 40px">
                        <label style="font-size: small;color: #767676;display: block; font-weight: bold">아이디 또는 스카이패스
                            회원번호(12자리 숫자)</label>
                        <div class="input-group mb-3 input-group-lg">
                            <input type="text" class="form-control"
                                   aria-label="Sizing example input"
                                   aria-describedby="inputGroup-sizing-default"
                                   name="memberAccount" style="background-color: #E8F0FE">
                        </div>
                    </div>
                    <div class="row" style="margin-top: 30px">
                        <label style="font-size: small;color: #767676;display: block; font-weight: bold">비밀번호</label>
                        <div class="input-group mb-3 input-group-lg">
                            <input type="password" class="form-control"
                                   aria-label="Sizing example input"
                                   aria-describedby="inputGroup-sizing-default"
                                   name="memberPassword" style="background-color: #E8F0FE">
                        </div>
                    </div>
                    <div class="col" style="margin-top:30px">
                        <div class="d-grid col-12 mx-auto" style="float: right">
                            <button type="submit"
                                    style="background-color: #00256C; font-size: large;font-weight: bold; padding: 15px"
                                    class="btn btn-primary btn-lg"
                                    onclick="payment()">로그인
                            </button>
                        </div>
                    </div>
                </form>
                <div class="row" style="padding: 20px 60px; font-weight: bold">
                    <div class="col-lg-6">
                        <a href="#" style="color: #0064DE; text-decoration: none">아이디 찾기 ></a>
                    </div>
                    <div class="col-lg-6">
                        <a href="#" style="color: #0064DE; text-decoration: none">비밀번호 찾기 ></a>
                    </div>
                </div>
                <div class="row">
                    <span style="color: #555555;display: block; font-weight: bold; text-align: center">다음 계정으로 로그인</span>
                    <a href="#" style="padding: 0px 16px 0px 44px">네이버</a>
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
    </div>
</div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
