<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>항공기 정보수정</title>
    <style>
        input {
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
            <h2>update.jsp</h2>
            <form action="/airplane/update" method="post" enctype="multipart/form-data">
                항공기 번호<input class="form-control mb-2" type="text" name="id" value="${airplane.id}" readonly>
                항공기 기종<input class="form-control mb-2" type="text" name="airplaneModel"
                             value="${airplane.airplaneModel}">
                항공기 총 좌석 수<input class="form-control mb-2" type="text" name="airplaneMaxSeats"
                                 value="${airplane.airplaneMaxSeats}">
                항공기 상태<input class="form-control mb-2" type="text" name="airplaneStatus"
                             value="${airplane.airplaneStatus}">
                <img src="${pageContext.request.contextPath}/upload/${airplane.airplaneFileName}" alt="" height="100"
                     width="100">
                항공기 사진<input type="file" name="airplaneFile">
                <input class="btn btn-primary" type="submit" value="정보수정">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
