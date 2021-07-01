<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. form이 전송되는 회원의 이름과 주소를 읽어와서
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	// 이름과 주소를 객체에 담는다.
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	// 2. DB에 저장하고
	MemberDao dao=MemberDao.getInstance();
	// 작업의 성공 여부를 return 받는다.
	// 다음의 dao.insert(dto)가 수행되고 그 return 값이 대입되는 것
	boolean beSuccess=dao.insert(dto);
	
	// 3. 응답한다.

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
</head>
<body>
	<%if(beSuccess){ %>
		<p>
			<strong><%=name %></strong> 의 정보를 추가했습니다.
			<a href="list.jsp">확인</a>
		</p>
	<%}else{ %>
		<p>
			회원 정보 추가 실패!
			<a href="insertform.jsp">다시 작성</a>
		</p>
	<%} %>	
</body>
</html>