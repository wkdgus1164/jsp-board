<%@ page import="java.sql.*" %>
<%@ page import="com.example.jsp_final.DatabaseManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String board_idx = request.getParameter("board_idx");

    try {
        DatabaseManager databaseManager = DatabaseManager.getInstance();
        Connection connection = databaseManager.open();
        String sql = "delete from t_board where board_idx = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, board_idx);
        preparedStatement.executeUpdate();
%>
<script>
    alert('정상 삭제되었습니다.');
    location.href = 'board.jsp';
</script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
