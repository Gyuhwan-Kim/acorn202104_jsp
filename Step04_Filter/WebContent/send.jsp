<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 전송했을 때, 한글이 깨지지 않도록
	request.setCharacterEncoding("utf-8");
	// form 전송되는 parameter 읽어오기
	String msg=request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send.jsp</title>
</head>
<body>
	<p><%=msg %></p>
</body>
</html>