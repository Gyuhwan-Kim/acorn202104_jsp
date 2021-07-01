<%@page import="test.fine.dto.FineDto"%>
<%@page import="test.fine.dao.FineDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String id=(String)session.getAttribute("id");

	FineDto dto=FineDao.getInstance().getData(num);
	
	if(!dto.getWriter().equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "당신은 삭제할 수 없습니다.");
		return;
	}

	boolean beDeleted=FineDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/delete2.jsp</title>
</head>
<body>
	<script>
	 <%if(beDeleted){%>
	 	alert("성공적으로 삭제하였습니다.");
	 	location.href="${pageContext.request.contextPath}/cafe/list2.jsp";
	 <%} else {%>
	 	alert("삭제에 실패하였습니다.");
	 	location.href="${pageContext.request.contextPath}/detail2.jsp?num=<%=num%>";
	 <%}%>
	</script>
</body>
</html>