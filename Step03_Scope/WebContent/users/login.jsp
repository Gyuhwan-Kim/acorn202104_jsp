<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	session.setAttribute("id", id);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<p><%=id %> 님이 로그인했습니다.</p>
	<a href="<%=request.getContextPath() %>/index.jsp">index로 가기</a>
</body>
</html>