<%@ page import="java.sql.*" %>
<%@ page import="com.example.jsp_final.DatabaseManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String user_idx = request.getParameter("user_idx");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    try {
        DatabaseManager databaseManager = DatabaseManager.getInstance();
        Connection connection = databaseManager.open();
        String sql = "insert into t_board (title, writer, content, regdate) values (?, ?, ?, now());";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, title);
        preparedStatement.setString(2, user_idx);
        preparedStatement.setString(3, content);
        preparedStatement.executeUpdate();
%>
<script>
    alert('정상 등록되었습니다.');
    location.href = 'board.jsp';
</script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
