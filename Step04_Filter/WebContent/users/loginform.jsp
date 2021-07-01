<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
</head>
<body>
<%
	// get 방식 parameter url 이라는 이름으로 전달되는 값이 있는지 읽어본다.
	String url=request.getParameter("url");
	// 만일 넘어오는 값이 없다면
	if(url==null){
		// login 후에 index.jsp page로 갈 수 있도록 절대 경로를 구성한다.
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
%>
	<h1>login이 필요합니다.</h1>
	<form action="login.jsp" method="post">
		<%-- login 후에 이동할 목적지 정보를 url 이라는 parameter로 전송될 수 있도록 한다. --%>
		<input type="hidden" name="url" value="<%=url%>"/>
		<input type="text" name="id" placeholder="아이디 입력..."/>
		<button type="submit">login</button>
	</form>
</body>
</html>