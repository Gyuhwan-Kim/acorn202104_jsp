<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String id=(String)session.getAttribute("id");
	
	FileDto dto=FileDao.getInstance().getData(num);
	
	if(!id.equals(dto.getWriter())){
		// 금지된 요청임을 응답
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일을 지울 수 없습니다.");
		// method 끝내기
		return;
	}
	
	// 1. file system에서 실제 file을 삭제
	// () 안에 삭제할 file의 절대경로(file system에서의 경로)
	String path=request.getServletContext().getRealPath("/upload")
				+File.separator+dto.getSaveFileName();
	
	File file=new File(path);
	file.delete();
	
	// 2. DB에서 file 정보 삭제
	boolean beDeleted=FileDao.getInstance().delete(num);

	// 3. 응답하기
	//String cPath=request.getContextPath();
	//response.sendRedirect(cPath+"/file/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/delete.jsp</title>
</head>
<body>
	<%if(beDeleted){%>
		<p><%=dto.getOrgFileName() %> file을 성공적으로 삭제하였습니다.</p>
		<a href="${pageContext.request.contextPath}/file/list.jsp">자료 목록으로 돌아가기</a>
	<%} else { %>
		<p><%=dto.getOrgFileName() %> file 삭제에 실패하였습니다.</p>
		<a href="${pageContext.request.contextPath}/file/list.jsp">자료 목록으로 돌아가기</a>
	<%} %>
</body>
</html>