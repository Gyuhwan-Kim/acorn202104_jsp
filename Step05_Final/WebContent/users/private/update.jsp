<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// form 전송되는 profile image path와 email을 읽어온다
	String profile=request.getParameter("profile");
	
	// 만약 profile image를 한 번도 바꾸지 않았다면 empty가 넘어온다.
	if(profile.equals("empty")){
		profile=null; // profile column을 비워놓기 위해 null을 대입.
	}
	String email=request.getParameter("email");
	
	// session scope에 저장된 id를 읽어온다.
	String id=(String)session.getAttribute("id");
	
	// UsersDto 객체에 담아서
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setProfile(profile);
	dto.setEmail(email);
	
	// DB에 수정 반영하고
	UsersDao.getInstance().update(dto);
	
	// 응답한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
	<script>
		alert("<%=id%> 님 정보가 수정되었습니다.");
		location.href="info.jsp";
	</script>
</body>
</html>