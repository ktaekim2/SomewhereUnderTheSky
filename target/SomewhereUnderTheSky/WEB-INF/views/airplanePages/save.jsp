<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>항공기 등록</title>
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
            <h2 class="display-4 fw-normal">save.jsp</h2>
            <form action="/airplane/save" method="post" enctype="multipart/form-data">
                항공기 기종<input type="text" name="airplaneModel">
                항공기 총 좌석 수<input type="text" name="airplaneMaxSeats">
                항공기 상태<input type="text" name="airplaneStatus">
                항공기 사진<input type="file" name="airplaneFile"><br>
                <input class="btn btn-primary" type="submit" value="항공기 등록">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
