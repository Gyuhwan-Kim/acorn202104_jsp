<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	TodoDao dao=TodoDao.getInstance();
	TodoDto dto=dao.getData(num);
	String cPath=request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/updateform.jsp</title>
</head>
<body>
	<div class="container">
	<h1>할 일 수정 form</h1>
		<form action="<%=cPath%>/update.jsp">
			<input type="hidden" name="num" value="<%=num %>"/>
			<input type="hidden" name="regdate" value=<%=dto.getRegdate() %>/>
			<div>
				<label for="num">번호</label>
				<input type="text" name="num" id="num" value=<%=num %> disabled/>
			</div>
			<div>
				<label for="content">할 일</label>
				<input type="text" name="content" id="content" value=<%=dto.getContent() %>/>
			</div>
			<div>
				<label for="regdate">할 일</label>
				<input type="text" name="regdate" id="regdate" value=<%=dto.getRegdate() %> disabled/>
			</div>
			<button type="submit">수정하기</button>
		</form>
	</div>
</body>
</html>