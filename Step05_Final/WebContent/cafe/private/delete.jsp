<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. get 방식 parameter로 전달되는 삭제할 글 번호를 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
		
	CafeDto dto=new CafeDto();
	dto.setNum(num);
	// 2. 삭제할 글의 작성자와 로그인 id가 같은지 비교해서
	String id=(String)session.getAttribute("id");
	String writer=CafeDao.getInstance().getData(dto).getWriter();
	
	// 3. 만일 글 작성자와 로그인된 id가 다르면
	if(!writer.equals(id)){
		// 금지된 요청이라고 응답하고
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 글을 지우면 혼난다.");
		return;	// 여기에서 method 종료
	}
	
	// 4. 같으면 DB에서 삭제하고 응답
	boolean beDeleted=CafeDao.getInstance().delete(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		<%if(beDeleted){%>
			alert("삭제 했습니다.");
	        location.href="${pageContext.request.contextPath }/cafe/list.jsp";
		<%} else {%>
			alert("삭제 실패!");
	        location.href="detail.jsp?num=<%=num%>";
		<%}%>
	</script>
</body>
</html>