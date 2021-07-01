<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/study.jsp</title>
</head>
<body>
	<%
		String id=(String)session.getAttribute("id");
		/*
		if(id==null){
			// 로그인 할 수 있는 page로 redirect 한다.
			String cPath=request.getContextPath();
			response.sendRedirect(cPath+"/users/loginform.jsp");
		}
		*/
	%>
	<h1>로그인한 회원의 전용 공간입니다.</h1>
	<p>
		<strong><%=id %></strong> 님 열심히 공부해요.
	</p>
</body>
</html>