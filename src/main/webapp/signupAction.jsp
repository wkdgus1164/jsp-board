<%@ page import="java.sql.*" %>
<%@ page import="com.example.jsp_final.DatabaseManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    try {
        DatabaseManager databaseManager = DatabaseManager.getInstance();
        Connection connection = databaseManager.open();
        String sql = "insert into t_user (name, id, pw, regdate) values (?, ?, ?, now());";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, id);
        preparedStatement.setString(3, pw);
        preparedStatement.executeUpdate();
%>
<script>
    alert('회원가입이 완료되었습니다. 입력 정보로 로그인해 주세요.');
    location.href = 'signin.jsp';
</script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
