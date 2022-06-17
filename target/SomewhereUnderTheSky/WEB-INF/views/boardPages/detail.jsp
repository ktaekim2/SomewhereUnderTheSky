<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container">
    <h2>detail.jsp</h2>
    <table class="table">
        <tr>
            <td>번호 | ${board.id}</td>
            <th>제목 | ${board.boardTitle}</th>
        </tr>
        <tr>
            <td>작성자 | ${board.boardWriter}</td>
            <td>작성시간 | ${board.boardCreatedDate}</td>
            <td>조회수 | ${board.boardHits}</td>
        </tr>
        <tr>
            <td><img src="${pageContext.request.contextPath}/upload/${board.boardFileName}" alt="" height="200"
                     width="200"><br>
                ${board.boardContents}</td>
        </tr>
    </table>
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <button class="btn btn-primary" onclick="boardDelete()">글삭제</button>
        <button class="btn btn-primary" onclick="boardUpdate()">글수정</button>
    </c:if>
    <button class="btn btn-primary" onclick="paging()">목록</button>
</div>
<div class="container mt-3">
    <c:if test="${sessionScope.loginMemberId ne null}">
        <div id="comment-write" class="input-group mb-3">
            <input type="text" id="commentWriter" class="form-control" value="${sessionScope.loginMemberId}" readonly>
            <input type="text" id="commentContents" class="form-control" placeholder="내용">
            <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
        </div>
    </c:if>
    <div id="comment-list">
        <table class="table">
            <tr>
                <th>댓글번호</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성시간</th>
                <th>좋아요</th>
                <th>싫어요</th>
                <th>수정</th>
                <th>삭제</th>

            </tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.commentWriter}</td>
                    <td>${comment.commentContents}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                        value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                    <td>
                        <button class="btn-group"><img src="../../../resources/img/hand-thumbs-up.svg"
                                                       onclick="updateLikes(${comment.id})">
                        </button>
                        <span>${comment.commentLikes}</span>
                    </td>
                    <td>
                        <button class="btn-group"><img
                                src="../../../resources/img/hand-thumbs-down.svg"
                                onclick="updateDislikes(${comment.id})">
                        </button>
                        <span>${comment.commentDislikes}</span></td>
                    <td><button type="button" class="btn-outline" onclick="commentUpdate('${comment.commentWriter}', '${comment.id}')">수정</button></td>
                    <td><button type="button" class="btn-outline" onclick="commentDelete('${comment.commentWriter}', '${comment.id}')">삭제</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>

<script>
    $("#comment-write-btn").click(function () { // jquery
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = $("#commentContents").val();
        const boardId = '${board.id}';
        console.log(commentWriter, commentContents, boardId);
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "commentWriter": commentWriter,
                "commentContents": commentContents,
                "boardId": boardId
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th>";
                output += "<th>좋아요</th>";
                output += "<th>싫어요</th>";
                output += "<th>수정</th>";
                output += "<th>삭제</th></tr>";
                for (let i in result) {
                    output += "<tr>";
                    output += "<td>" + result[i].id + "</td>";
                    output += "<td>" + result[i].commentWriter + "</td>";
                    output += "<td>" + result[i].commentContents + "</td>";
                    output += "<td>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                    output += "<td>" + "<button class='btn-group'>" + "<img src='../../../resources/img/hand-thumbs-up.svg' onclick='updateLikes(" + result[i].id + ")'>" + "</button>" +
                        "<span>" + result[i].commentLikes + "</span>" + "</td>";
                    output += "<td>" + "<button class='btn-group'>" + "<img src='../../../resources/img/hand-thumbs-down.svg' onclick='updateDislikes(" + result[i].id + ")'>" + "</button>" +
                        "<span>" + result[i].commentDislikes + "</span>" + "</td>";
                    output += "<td>" + "<button type='button' class='btn-outline' onclick=\"commentUpdate('" + result[i].commentWriter + "', '" + result[i].id + "')\">" + "수정" + "</button>" + "</td>";
                    output += "<td>" + "<button type='button' class='btn-outline' onclick=\"commentDelete('" + result[i].commentWriter + "', '" + result[i].id + "')\">" + "삭제" + "</button>" + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value = '';
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    });

    const boardDelete = () => {
        location.href = '/board/delete?id=${board.id}'
    }

    const boardUpdate = () => {
        location.href = '/board/update?id=${board.id}'
    }

    const paging = () => {
        location.href = '/board/paging?page=${page}';
    }

    // 좋아요 ajax
    function updateLikes(id) {
        const boardId = '${board.id}';
        $.ajax({
            type: "post",
            url: "/comment/updateLikes",
            data: {
                "boardId": boardId,
                "id": id
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th>";
                output += "<th>좋아요</th>";
                output += "<th>싫어요</th>";
                output += "<th>수정</th>";
                output += "<th>삭제</th></tr>";
                for (let i in result) {
                    output += "<tr>";
                    output += "<td>" + result[i].id + "</td>";
                    output += "<td>" + result[i].commentWriter + "</td>";
                    output += "<td>" + result[i].commentContents + "</td>";
                    output += "<td>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                    output += "<td>" + "<button class='btn-group'>" + "<img src='../../../resources/img/hand-thumbs-up.svg' onclick='updateLikes(" + result[i].id + ")'>" + "</button>" +
                        "<span>" + result[i].commentLikes + "</span>" + "</td>";
                    output += "<td>" + "<button class='btn-group'>" + "<img src='../../../resources/img/hand-thumbs-down.svg' onclick='updateDislikes(" + result[i].id + ")'>" + "</button>" +
                        "<span>" + result[i].commentDislikes + "</span>" + "</td>";
                    output += "<td>" + "<button type='button' class='btn-outline' onclick=\"commentUpdate('" + result[i].commentWriter + "', '" + result[i].id + "')\">" + "수정" + "</button>" + "</td>";
                    output += "<td>" + "<button type='button' class='btn-outline' onclick=\"commentDelete('" + result[i].commentWriter + "', '" + result[i].id + "')\">" + "삭제" + "</button>" + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value = '';
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    };

    // 싫어요 ajax
    function updateDislikes(id) {
        const boardId = '${board.id}';
        $.ajax({
            type: "post",
            url: "/comment/updateDislikes",
            data: {
                "boardId": boardId,
                "id": id
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th>";
                output += "<th>좋아요</th>";
                output += "<th>싫어요</th>";
                output += "<th>수정</th>";
                output += "<th>삭제</th></tr>";
                for (let i in result) {
                    output += "<tr>";
                    output += "<td>" + result[i].id + "</td>";
                    output += "<td>" + result[i].commentWriter + "</td>";
                    output += "<td>" + result[i].commentContents + "</td>";
                    output += "<td>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                    output += "<td>" + "<button class='btn-group'>" + "<img src='../../../resources/img/hand-thumbs-up.svg' onclick='updateLikes(" + result[i].id + ")'>" + "</button>" +
                        "<span>" + result[i].commentLikes + "</span>" + "</td>";
                    output += "<td>" + "<button class='btn-group'>" + "<img src='../../../resources/img/hand-thumbs-down.svg' onclick='updateDislikes(" + result[i].id + ")'>" + "</button>" +
                        "<span>" + result[i].commentDislikes + "</span>" + "</td>";
                    output += "<td>" + "<button type='button' class='btn-outline' onclick=\"commentUpdate('" + result[i].commentWriter + "', '" + result[i].id + "')\">" + "수정" + "</button>" + "</td>";
                    output += "<td>" + "<button type='button' class='btn-outline' onclick=\"commentDelete('" + result[i].commentWriter + "', '" + result[i].id + "')\">" + "삭제" + "</button>" + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value = '';
            },
            error: function () {
                alert("어디가 틀렸을까");
            }
        })
    };

    // 댓글 수정
    function commentUpdate(commentWriter, id) {
        console.log("함수호출");
        console.log(commentWriter);
        console.log(id);
        console.log('${sessionScope.loginMemberId}');
        const loginMemberId = '${sessionScope.loginMemberId}';
        if (loginMemberId === commentWriter) {
            location.href = '/comment/update?boardId=${board.id}&id=' + id;
        } else {
            alert("댓글 작성자가 아닙니다.")
        }
    }

    // 댓글 삭제
    function commentDelete(commentWriter, id) {
        console.log("함수호출");
        console.log(commentWriter);
        console.log(id);
        console.log('${sessionScope.loginMemberId}');
        const loginMemberId = '${sessionScope.loginMemberId}';
        if (loginMemberId === commentWriter) {
            location.href = '/comment/delete?boardId=${board.id}&id=' + id;
        } else {
            alert("댓글 작성자가 아닙니다.")
        }
    }
</script>
</html>
