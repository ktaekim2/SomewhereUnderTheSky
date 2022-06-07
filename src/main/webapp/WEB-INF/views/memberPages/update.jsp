<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: 오전 9:45
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
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <h2 class="display-4 fw-normal">update.jsp</h2>
            <form action="/member/update" method="post" name="updateForm">
                아이디<input class="form-control mb-2" type="text" name="memberAccount" id="memberAccount"
                          value="${updateMember.memberAccount}" readonly>
                비밀번호<input class="form-control mb-2" type="password" name="memberPassword" id="pwConfirm"
                           placeholder="비밀번호를 입력하세요">
                영문 성<input class="form-control mb-2" type="text" name="memberLastName"
                           value="${updateMember.memberLastName}">
                영문 이름<input class="form-control mb-2" type="text" name="memberFirstName"
                            value="${updateMember.memberFirstName}">
                여권 번호<input class="form-control mb-2" type="text" name="memberPassportNumber"
                            value="${updateMember.memberPassportNumber}">
                생년월일<input class="form-control mb-2" type="text" name="memberBirthdate"
                           value="${updateMember.memberBirthdate}">
                이메일<input class="form-control mb-2" type="text" name="memberEmail" value="${updateMember.memberEmail}">
                <input class="btn btn-primary" onclick="update()" type="button" value="정보수정">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    const update = () => {
        console.log("update함수 호출")
        const pw = document.getElementById("pwConfirm").value;
        const pwDB = '${updateMember.memberPassword}';
        if (pw == pwDB) {
            updateForm.submit(); // 노란줄 있지만 잘됨
        } else {
            alert("비밀번호 불일치")
        }
    }
</script>
</html>
