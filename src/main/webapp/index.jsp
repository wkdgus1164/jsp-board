<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP 웹 게시판</title>
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
            <li class="d-flex nav-item">
                <%
                    if (session.getAttribute("id") == null) {
                %>
                <a class="nav-link" href="${pageContext.request.contextPath}/signin.jsp">로그인</a>
                <%
                } else {
                %>
                <a class="nav-link" href="${pageContext.request.contextPath}/signoutAction.jsp">로그아웃</a>
                <%
                    }
                %>
            </li>
        </div>
    </div>
</nav>
<div class="container">
    <br><br>
    <h3>201844035 한장현 JSP 게시판 프로젝트</h3>
    <br><br>
    <ol>
        <li>기능 기획</li>
        <ul>
            <li>회원가입 : 회원인 사람만 게시판에 접속할 수 있으며, 각자의 아이디로 게시글을 작성할 수 있다.</li>
            <li>게시판 : 회원은 게시판에 글을 작성할 수 있으며, 수정, 삭제할 수 있다. (CRUD)</li>
            <li>마이페이지 : 회원은 자신이 쓴 글을 별도의 페이지에서 조회할 수 있다.</li>
        </ul>
        <br><br>
        <li>사용 기술</li>
        <ul>
            <li>JSP (Java Server Page) : 웹 페이지의 동적 활용을 위해 자바 기반 백엔드 구성</li>
            <li>HTML, CSS, JavaScript : 기본적인 페이지 마크업 및 디자인을 위한 HTML5표준, CSS3표준 문법 사용, 이벤트 처리를 위한 소량의 JavaScript ES6+ 문법
                사용
            </li>
            <li>MySQL 8.0 (With Connector Driver) : 데이터베이스 연동을 위한 DBMS, Driver 사용</li>
            <li>Bootstrap 5 : 보다 편리한 레이아웃 구성을 위한 프론트엔드 구성 라이브러리 사용</li>
            <li>DataTables : 테이블(Table)의 페이징 및 비동기 검색, 행 정렬 등 기능을 제공하는 플러그인 사용</li>
            <li>CKEditor 4 : 글 작성 시 서식을 지정할 수 있는 라이브러리 사용</li>
        </ul>
        <br><br>
        <li>개발 환경</li>
        <ul>
            <li>Windows 10 64-bit</li>
            <li>IntelliJ IDEA</li>
            <li>MySQL Workbench</li>
        </ul>
        <br><br>
        <li>바로가기</li>
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/board.jsp">게시판</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/my-page.jsp">마이페이지</a>
            </li>
        </ul>
    </ol>
</div>
</body>
</html>