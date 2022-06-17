<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-03
  Time: 오전 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>

    <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="true">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                    class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                    aria-label="Slide 4"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item">
                <img src="../../resources/img/readytogo_pc.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../../resources/img/keyvisual_pc_sherpa.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../../resources/img/mileageguide_pc.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item active">
                <img src="../../resources/img/KE_LJ_pc.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
<div class="container">
    <div class="row" style="padding: 100px">
        <div class="col-sm-4">
            <a href="/book/findAll"><span style="font-weight: bold; font-size: x-large"><img src="../../resources/css/mfnb__booking.svg">예약 조회</span></a>
        </div>
        <div class="col-sm-4">
            <span href="#"style="font-weight: bold; font-size: x-large"><img src="../../resources/css/mfnb__checkin.svg">체크인</span>
        </div>
        <div class="col-sm-4">
            <span href="#"style="font-weight: bold; font-size: x-large"><img src="../../resources/css/mfnb__schedule.svg">항공편 현황</span>
        </div>
    </div>
</div>
<jsp:include page="./layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
