<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. form이 전송되는 id와 pwd를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	// 2. DB에 저장된 id pwd와 일치하는지 확인해서
	boolean beValid=false;
	if(id.equals("gura") && pwd.equals("1234")){ // 가상으로 확인
		// id pwd가 모두 일치하면 유요한 정보라고 가정
		beValid=true;
	}
	
	// 3. 일치하면 로그인 처리 후 응답, 틀리면 id or pwd가 틀려요! 하고 응답.

	// save라는 parameter로 넘어오는 값이 있는지 확인해서
	String save=request.getParameter("save");
	// 만약 넘어오는 값이 있다면
	if(save!=null){
		// 쿠키에 id와 pwd를 특정 key 값으로 담아서 cookie도 응답되도록
		Cookie idCookie=new Cookie("savedId", id);
		idCookie.setMaxAge(60); // cookie 유지시간 (초단위)
		response.addCookie(idCookie);
		
		Cookie pwdCookie=new Cookie("savedPwd", pwd);
		pwdCookie.setMaxAge(60); // cookie 유지시간 (초단위)
		response.addCookie(pwdCookie);
	} else { // 체크를 안하면 cookie를 삭제하도록
		Cookie idCookie=new Cookie("savedId", id);
		idCookie.setMaxAge(0); // cookie 유지시간 (초단위)
		response.addCookie(idCookie);
		
		Cookie pwdCookie=new Cookie("savedPwd", pwd);
		pwdCookie.setMaxAge(0); // cookie 유지시간 (초단위)
		response.addCookie(pwdCookie);		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<%if(beValid==true){ %>
			<div class="alert">
				<strong><%=id %></strong>님 로그인 되었습니다.
				<a href="<%=request.getContextPath()%>/" class="alert-link">확인</a>
			</div>
		<%} else { %>
			<div class="alert alert-danger">
				아이디 혹은 비밀번호가 틀려요!
				<a href="<%=request.getContextPath()%>/users/loginform.jsp" class="alert-link">확인</a>
			</div>
		<%} %>
	</div>
</body>
</html>