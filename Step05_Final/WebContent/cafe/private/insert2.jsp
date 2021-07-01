<%@page import="test.fine.dto.FineDto"%>
<%@page import="test.fine.dao.FineDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");

	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	FineDto dto=new FineDto();
	dto.setWriter(id);
	dto.setTitle(title);
	dto.setContent(content);

	boolean beSuccess=FineDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert2.jsp</title>
</head>
<body>
<script>
	<%if(beSuccess){%>
		alert("글이 등록되었습니다.");
		location.href="${pageContext.request.contextPath}/cafe/list2.jsp";
	<%} else {%>
		alert("글 등록에 실패하였습니다. 다시 작성해주세요.");
		location.href="${pageContext.request.contextPath}/cafe/private/insertform2.jsp";
	<%} %>
</script>
</body>
</html>