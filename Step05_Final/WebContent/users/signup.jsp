<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// form 전송되는 가입할 회원의 정보를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	
	// UsersDto에 정보를 담고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	// UsersDao 객체를 이용해서 DB에 저장
	boolean beSuccess=UsersDao.getInstance().insert(dto);
	
	// 응답하기

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/singup.jsp</title>
</head>
<body>
	<div class="container">
		<%if(beSuccess){ %>
			<p>
				<strong><%=id %>님. 가입되었습니다.</strong>
				<a href="loginform.jsp">로그인 하러 가기</a>
			</p>
		<%} else { %>
			<p>
				가입 실패!
				<a href="signup_form.jsp">다시 가입하러 가기</a>
			</p>
		<%} %>
	</div>
</body>
</html>