<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            <form action="/comment/update" method="post">
                댓글번호<input class="form-control mb-2" type="text" name="id" value="${comment.id}" readonly>
                게시판번호<input class="form-control mb-2" type="text" name="boardId" value="${comment.boardId}" readonly>
                작성자<input class="form-control mb-2" type="text" name="commentWriter" value="${comment.commentWriter}"
                          readonly>
                내용<textarea class="form-control" name="commentContents" id="commentContents" cols="30"
                            rows="10">${comment.commentContents}</textarea><br>
                <input class="btn btn-primary" type="submit" value="정보수정">
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
</html>
