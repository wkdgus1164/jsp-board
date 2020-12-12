<%@ page import="java.sql.*" %>
<%@ page import="com.example.jsp_final.DatabaseManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
<%
    int userIdx = 0;
    int boardIdx = 0;
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
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">게시판 웹 프로젝트</a>
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
<h2>게시판 상세</h2>
<table class='table detail table-bordered'>
    <%
        try {
            DatabaseManager databaseManager = DatabaseManager.getInstance();
            Connection connection = databaseManager.open();
            String sql = "select a.*, b.name, b.user_idx from t_board a, t_user b where a.writer = b.user_idx and board_idx = ? limit 1";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, request.getParameter("q"));
            ResultSet resultSet = preparedStatement.executeQuery();
    %>
    <tbody>
    <%
        while (resultSet.next()) {
            userIdx = resultSet.getInt("user_idx");
            boardIdx = resultSet.getInt("board_idx");
    %>
    <tr>
        <td>
            글 번호
        </td>
        <td>
            <%= request.getParameter("q") %>
        </td>
    </tr>
    <tr>
        <td>
            제목
        </td>
        <td>
            <%=resultSet.getString("title") %>
        </td>
    </tr>
    <tr>
        <td>
            내용
        </td>
        <td>
            <%=resultSet.getString("content") %>
        </td>
    </tr>
    <tr>
        <td>
            작성자
        </td>
        <td>
            <%=resultSet.getString("name") %>
        </td>
    </tr>
    <tr>
        <td>
            작성일
        </td>
        <td>
            <%=resultSet.getString("regdate") %>
        </td>
    </tr>
    <%
            }
            resultSet.close();
            connection.close();
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    %>
    </tbody>
</table>
<%
    if (session.getAttribute("idx").equals(userIdx)) {
%>
<button class="btn btn-warning float-end" onclick="location.replace('modify.jsp?board_idx=<%=boardIdx%>')">수정하기</button>
<button class="btn btn-danger float-end" onclick="location.replace('deleteAction.jsp?board_idx=<%=boardIdx%>')">삭제하기
</button>
<%
    }
%>
</body>
</html>
