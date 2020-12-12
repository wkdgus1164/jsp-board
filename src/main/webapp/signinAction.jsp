<%@ page import="java.sql.*" %>
<%@ page import="com.example.jsp_final.DatabaseManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    try {
        DatabaseManager databaseManager = DatabaseManager.getInstance();
        Connection connection = databaseManager.open();
        String sql = "select id, user_idx from t_user where id = ? and pw = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, id);
        preparedStatement.setString(2, pw);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
%>
<script>
    alert('로그인되었습니다.');
    location.href = 'index.jsp';
</script>
<%
    session.setAttribute("id", id);
    session.setAttribute("idx", resultSet.getInt("user_idx"));
} else {
%>
<script>
    alert('아이디 또는 비밀번호를 확인해 주세요.');
    location.href = 'signin.jsp';
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
