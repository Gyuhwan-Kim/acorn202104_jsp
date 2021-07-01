<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");
	
	TodoDao dao=TodoDao.getInstance();
	TodoDto dto=new TodoDto();
	dto.setNum(num);
	dto.setContent(content);
	dto.setRegdate(regdate);
	boolean beSuccess=dao.update(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(beSuccess){ %>
		<script>
			alert("<%=num %> 번에 대한 할 일이 수정되었습니다.");
			location.href="list.jsp";
		</script>
	<%} else {%>
		<script>
			alert("수정에 실패하였습니다.");
			location.href="/Step02_DataBase/todo/list.jsp";
		</script>
	<%} %>
	
</body>
</html>