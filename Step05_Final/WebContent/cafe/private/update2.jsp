<%@page import="test.fine.dto.FineDto"%>
<%@page import="test.fine.dao.FineDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	FineDto dto=new FineDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	if(!writer.equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "당신은 수정할 수 없습니다.");
		return;
	}
	
	boolean beSuccess=FineDao.getInstance().update(dto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		<%if(beSuccess){%>
			alert("성공적으로 수정하였습니다.");
			location.href="${pageContext.request.contextPath}/cafe/detail2.jsp?num=<%=num%>";
		<%} else {%>
			alert("다시 수정해주세요.");
			location.href="${pageContext.request.contextPath}/cafe/private/updateform2.jsp?num=<%=num%>";
		<%}%>
	</script>
</body>
</html>