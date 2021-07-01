<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// logout은 session scope에 저장된 id 값을 삭제하면 된다.
	session.removeAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
	<script>
		alert("성공적으로 로그아웃 되었습니다.");
		// javascript를 활용해서 index.jsp 페이지로 redirect 시키기
		location.href="<%=request.getContextPath()%>/index.jsp";
	</script>
</body>
</html>