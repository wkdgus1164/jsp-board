<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">게시판 웹 프로젝트</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/board.jsp">게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/my-page.jsp">마이페이지</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <form action="signupAction.jsp" method="post">
        <br><br>
        <h3>회원가입</h3>
        <br><br>
        <div class="mb-3">
            <label for="id" class="form-label">이름</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="이름 입력"/>
        </div>
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력"/>
        </div>
        <div class="mb-3">
            <label for="pw" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="pw" name="pw" placeholder="****"/>
        </div>
        <div class="mb-3">
            <input type="submit" class="btn btn-primary" value="회원가입"/>
        </div>
    </form>
</div>
</body>
</html>