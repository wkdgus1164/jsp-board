<%@ page import="java.sql.*" %>
<%@ page import="com.example.jsp_final.DatabaseManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="//cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/board.jsp">게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/my-page.jsp">마이페이지</a>
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
<h2>게시판</h2>
<%
    try {
        DatabaseManager databaseManager = DatabaseManager.getInstance();
        Connection connection = databaseManager.open();
%>
<table class='table table-bordered table-hover'>
    <thead>
    <tr class="table-active">
        <th scope="col">번호</th>
        <th scope="col">제목</th>
        <th scope="col">작성일</th>
    </tr>
    </thead>
    <%
        String sql = "select a.*, b.name from t_board a, t_user b where a.writer = b.user_idx and a.writer = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, session.getAttribute("idx").toString());
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
    %>
    <tbody>
    <tr onclick="location.href='board-detail.jsp?q=<%=resultSet.getInt("board_idx")%>'">
        <th scope="row">
            <%= resultSet.getInt("board_idx") %>
        </th>
        <td>
            <%=resultSet.getString("title") %>
        </td>
        <td>
            <%=resultSet.getString("regdate") %>
        </td>
    </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </tbody>
</table>
<div class="container-fluid">
    <button type="submit" class="btn btn-primary float-end" onclick="location.replace('write.jsp')">글쓰기</button>
</div>
<script>
    $(".data").DataTable({
        "order": [[0, 'desc']]
    })
</script>
</body>
</html>
