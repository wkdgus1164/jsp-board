<%@ page import="com.example.jsp_final.DatabaseManager" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 수정하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
<%
    if (session.getAttribute("id") == null) {
%>
<script>
    alert('로그인하셔야 합니다.');
    location.href = 'signin.jsp';
</script>
<%
    }
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">게시판 웹 프로젝트</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/board.jsp">게시판</a>
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
    <%
        try {
            DatabaseManager databaseManager = DatabaseManager.getInstance();
            Connection connection = databaseManager.open();
            String sql = "select * from t_board where board_idx = ? limit 1";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, request.getParameter("board_idx"));
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
    %>
    <form action="modifyAction.jsp" method="post">
        <br><br>
        <h3>글 수정하기</h3>
        <br><br>
        <input type="hidden" name="board_idx" value="<%=request.getParameter("board_idx")%>"/>
        <input type="hidden" name="user_idx" value="<%=session.getAttribute("idx")%>"/>
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목 입력"
                   value="<%=resultSet.getString("title")%>"/>
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">내용</label>
            <textarea class="form-control" name="content" id="content" cols="30" rows="10"
                      placeholder="내용 입력"><%=resultSet.getString("content")%></textarea>
        </div>
        <div class="mb-3">
            <input type="submit" class="btn btn-primary" value="작성하기"/>
        </div>
    </form>
    <%
            }
            resultSet.close();
            connection.close();
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    %>
</div>
<script>
    CKEDITOR.replace('content');
</script>
</body>
</html>
