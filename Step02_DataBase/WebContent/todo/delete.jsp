<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));

	TodoDao dao=TodoDao.getInstance();
	boolean beSuccess=dao.delete(num);
	
	/*
		절대 경로 이동할 때 필요한 context path는 나중에 제거되거나 변경할 예정이기 때문에
		HttpServletRequest 객체의 getContextPath method를 이용해서 얻어와서 써야 한다.
	*/
	String cPath=request.getContextPath();
	
	// client에게 특정 경로로 요청을 다시 하라고 응답한다.(redirect 이동 응답)
	// 이동할 절대경로를 문자열로 전달하면 client web browser가 전달한 경로로 다시 요청을 한다.
	// 이게 있으면 아래는 필요가 없음.
	//response.sendRedirect("/Step02_DataBase/todo/list.jsp");
	response.sendRedirect(cPath+"/todo/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(beSuccess){ %>
		<p>
			<%=num %> 번 할 일을 삭제했습니다.
			<a href="list.jsp">할 일 목록으로 돌아가기</a>
		</p>
	<%} else {%>
		<p>
			할 일 삭제에 실패하였습니다.
			<a href="list.jsp">다시 시도</a>
		</p>
	<%} %>
</body>
</html>