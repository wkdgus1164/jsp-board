<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
%>
<script>
    alert("로그아웃되었습니다.");
    location.href = 'signin.jsp';
</script>