<%@ page import="java.sql.*" %>
<%@ page import="com.example.jsp_final.DatabaseManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String board_idx = request.getParameter("board_idx");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    try {
        DatabaseManager databaseManager = DatabaseManager.getInstance();
        Connection connection = databaseManager.open();
        String sql = "update t_board set title = ?, content = ? where board_idx = ?;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, title);
        preparedStatement.setString(2, content);
        preparedStatement.setString(3, board_idx);
        preparedStatement.executeUpdate();
%>
<script>
    alert('정상 수정되었습니다.');
    location.href = 'board-detail.jsp?q=<%=board_idx%>';
</script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
