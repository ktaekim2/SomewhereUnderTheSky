<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-08
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>항공권 예매 | 한국항공</title>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="row m-5">
    <h2>항공권 예매</h2>
    </div>
    <div class="row m-5">
        <div class="col-sm-8">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <p id="departureAirport">ICN<br>서울/인천</p>
            </button>
        </div>
        <div class="col-sm-4">

        </div>
    </div>
    <div class="row m-5">
        <div class="d-grid gap-2 col-3 mx-auto">
            <button class="btn btn-primary btn-lg" type="button">항공편 검색</button>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">출발 지역과 도시 선택</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-4">
                            <div class="list-group" id="list-tab" role="tablist">
                                <a class="list-group-item list-group-item-action active" id="list-home-list"
                                   data-bs-toggle="list" href="#list-home" role="tab" aria-controls="list-home">대한민국</a>
                                <a class="list-group-item list-group-item-action" id="list-profile-list"
                                   data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">동북아시아</a>
                                <a class="list-group-item list-group-item-action" id="list-messages-list"
                                   data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="list-messages">동남아시아/서남아시아</a>
                                <a class="list-group-item list-group-item-action" id="list-settings-list"
                                   data-bs-toggle="list" href="#list-settings" role="tab" aria-controls="list-settings">미주</a>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="list-home" role="tabpanel"
                                     aria-labelledby="list-home-list">
                                    <div class="list-group">
                                        <button type="button" class="list-group-item list-group-item-action" id="icn" value="ICN<br>서울/인천" onclick="selectAirport(this.id)">ICN 서울/인천</button>
                                        <button type="button" class="list-group-item list-group-item-action" id="gmp" value="GMP<br>서울/김포" onclick="selectAirport(this.id)">GMP 서울/김포</button>
                                        <button type="button" class="list-group-item list-group-item-action" id="pus" value="PUS<br>부산/김해" onclick="selectAirport(this.id)">PUS 부산/김해</button>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="list-profile" role="tabpanel"
                                     aria-labelledby="list-profile-list">...
                                </div>
                                <div class="tab-pane fade" id="list-messages" role="tabpanel"
                                     aria-labelledby="list-messages-list">...
                                </div>
                                <div class="tab-pane fade" id="list-settings" role="tabpanel"
                                     aria-labelledby="list-settings-list">...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<img src="../../../resources/img/booking-visual--pc.jpg">
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    function selectAirport(id) {
    const airportName = document.getElementById(id).value;
    document.getElementById("departureAirport").innerHTML = airportName;
    }
</script>
</html>
