<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
<%
    Connection conn = null;
    Statement stat = null;
    ResultSet rs = null;

    String server = "localhost:3306";
    String database = "jspDB";
    String user_name = "root";
    String password = "root";
    String sql = "select * from t_board";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?useSSL=false&serverTimezone=UTC", user_name, password);
        stat = conn.createStatement();
        rs = stat.executeQuery(sql);
        if (rs != null) System.out.println("정상적으로 연결되었습니다.");
        else System.out.println("실패");
%>
<table class='table'>
    <thead>
    <tr>
        <td>번호</td>
        <td>제목</td>
        <td>작성자</td>
        <td>작성일</td>
        <td>조회수</td>
    </tr>
    </thead>
    <%
        while (rs.next()) {
    %>
    <tbody>
    <tr>
        <td>
            <%= rs.getInt("board_idx") %>
        </td>
        <td>
            <%=rs.getString("title") %>
        </td>
        <td>
            <%=rs.getInt("writer") %>
        </td>
        <td>
            <%=rs.getString("regdate") %>
        </td>
        <td>
            <%=rs.getInt("view_cnt")%>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
        rs.close();
        conn.close();
    } catch (Exception throwables) {
        throwables.printStackTrace();
    }
%>
</body>
</html>
