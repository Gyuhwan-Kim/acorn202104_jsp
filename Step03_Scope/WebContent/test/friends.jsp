<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> names=(List<String>)request.getAttribute("names");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>친구 목록입니다.</h1>
	<ul>
		<%for(int i=0; i<names.size(); i++){ %>
			<li><%=names.get(i) %></li>
		<%} %>
	</ul>
</body>
</html>