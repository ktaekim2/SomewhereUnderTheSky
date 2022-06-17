<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오후 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        input:not(.ratio-1x1) {
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
            <h2 class="display-4 fw-normal">save.jsp</h2>
            <form action="/member/save" method="post">
                아이디<input type="text" name="memberAccount" id="memberAccount" onblur="duplicateCheck()">
                <span id="dup-check-result"></span><br>
                비밀번호<input type="password" name="memberPassword" id="memberPassword" onblur="passwordCheck()"
                           placeholder="8~16, 영문대소문자">
                <p id="passwordCheckResult"></p>
                비밀번호 재확인<input type="password" name="pwReCheck" id="pwReCheck" onblur="pwReCheck()"
                               placeholder="8~16, 영문대소문자">
                <p id="pwReCheckResult"></p>
                영문 성<input type="text" name="memberLastName" onblur="LastNameCheck()">
                <p id="LastNameCheck"></p>
                영문 이름<input type="text" name="memberFirstName" onblur="FirstNameCheck()">
                <p id="FirstNameCheck"></p>
                여권 번호<input type="text" name="memberPassportNumber">
                생년월일<input type="text" name="memberBirthdate">
                성별<br>
                <input type="radio" name="memberGender" class="ratio-1x1" value="남">남<br>
                <input type="radio" name="memberGender" class="ratio-1x1" value="여">여<br>
                이메일<input type="text" name="memberEmail">
                전화번호<input type="text" name="memberPhone">
                거주 국가<br><select name="memberNation">
                <option value="South Korea">South Korea</option>
                <option value="Japan">Japan</option>
                <option value="United State">United State</option>
                <option value="Taiwan">Taiwan</option>
            </select>
                <input class="btn btn-primary" type="submit" value="회원가입">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    const duplicateCheck = () => {
        const memberAccount = document.getElementById("memberAccount").value;
        const checkResult = document.getElementById("dup-check-result");
        if (memberAccount == 0) {
            checkResult.innerHTML = "필수입력입니다.";
            checkResult.style.color = "red";
        } else {
            $.ajax({
                type: "post",
                url: "duplicate-check",
                data: {"memberAccount": memberAccount},
                dataType: "text",
                success: function (result) {
                    if (result == "ok") {
                        checkResult.innerHTML = "사용가능한 아이디";
                        checkResult.style.color = "green";
                    } else {
                        checkResult.innerHTML = "이미 사용중인 아이디";
                        checkResult.style.color = "red";
                    }
                },
                error: function () {
                }
            });
        }
    }

    function passwordCheck() {
        const memberPassword = document.getElementById("memberPassword").value;
        const passwordCheckResult = document.getElementById("passwordCheckResult");
        const exp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[A-Za-z\d]{8,16}$/;
        if (memberPassword == 0) {
            passwordCheckResult.innerHTML = "필수입력입니다.";
            passwordCheckResult.style.color = "red";
        } else if (memberPassword.match(exp)) {
            passwordCheckResult.innerHTML = "올바른 비밀번호 형식";
            passwordCheckResult.style.color = "green";
        } else {
            passwordCheckResult.innerHTML = "잘못된 비밀번호 형식";
            passwordCheckResult.style.color = "red";
        }
    }

    function pwReCheck() {
        const memberPassword = document.getElementById("memberPassword").value;
        const pwReCheck = document.getElementById("pwReCheck").value;
        const pwReCheckResult = document.getElementById("pwReCheckResult");
        if (memberPassword == pwReCheck && memberPassword != 0) {
            pwReCheckResult.innerHTML = "비밀번호가 일치합니다.";
            pwReCheckResult.style.color = "green";
        } else if (memberPassword != pwReCheck) {
            pwReCheckResult.innerHTML = "비밀번호가 일치하지 않습니다.";
            pwReCheckResult.style.color = "red";
        } else {
            pwReCheckResult.innerHTML = "필수입력입니다.";
            pwReCheckResult.style.color = "red";
        }
    }

    function LastNameCheck() {
        const memberLastName = document.getElementById("memberLastName").value;
        const LastNameCheck = document.getElementById("LastNameCheck");
        if (memberLastName == 0) {
            LastNameCheck.innerHTML = "필수입력입니다.";
            LastNameCheck.style.color = "red";
        }
    }

    function FirstNameCheck() {
        const memberFirstName = document.getElementById("memberFirstName").value;
        const FirstNameCheck = document.getElementById("FirstNameCheck");
        if (memberFirstName == 0) {
            FirstNameCheck.innerHTML = "필수입력입니다.";
            FirstNameCheck.style.color = "red";
        }
    }
</script>
</html>
