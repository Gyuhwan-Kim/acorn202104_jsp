<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");

	TodoDao dao=TodoDao.getInstance();
	TodoDto dto=new TodoDto();
	
	dto.setContent(content);
	dto.setRegdate(regdate);
	boolean beSuccess=dao.insert(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<%if(beSuccess){ %>
		<p>
			할 일을 추가하였습니다.
			추가한 할 일 : <strong><%=content %></strong>
			<a href="list.jsp">할 일 목록으로 돌아가기</a>
		</p>
	<%} else { %>
		<p>할 일 추가에 실패하였습니다
			<a href="insertform.jsp">다시 작성하기</a>
		</p>
	<% } %>
</body>
</html>