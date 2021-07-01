<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request에 "dto" 라는 key 값으로 담긴 MemberDto type 객체 얻어오기
	MemberDto dto=(MemberDto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 한 명의 정보입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=dto.getNum() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getAddr() %></td>
			</tr>
		</tbody>
	</table>
</body>
</html>