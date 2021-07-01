<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에서 login 된 id 얻어내기
	String id=(String)session.getAttribute("id");

	// form 전송되는 구 비밀번호, 새 비밀번호 읽어오기
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	
	// 구 비밀번호가 유효한 정보인지 알아낸다.
	UsersDto dto=UsersDao.getInstance().getData(id);
	boolean beValid=pwd.equals(dto.getPwd());
	
	// 구 비밀번호가 맞다면 비밀번호를 수정한다.
	if(beValid){
		// dto에 새 비밀번호를 담아서
		dto.setPwd(newPwd);
		// dao에 넘겨줘서 수정 반영한다.
		UsersDao.getInstance().updatePwd(dto);
		// 비밀번호를 수정했으면 logout 처리를 하고 새로 login 하도록 한다.
		session.removeAttribute("id");
	}
	
	// 응답한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%if(beValid){ %>
			<p>
				<strong><%=id %></strong> 님의 비밀번호를 성공적으로 변경하였습니다.
				자동으로 로그아웃 됩니다.
				<a href="<%=request.getContextPath()%>/users/loginform.jsp">다시 로그인 하기</a>
			</p>
		<%} else { %>
			<p>
				이전 비밀번호가 일치하지 않습니다.
				<a href="pwd_updateform.jsp">다시 시도</a>
			</p>
		<%} %>
	</div>
</body>
</html>