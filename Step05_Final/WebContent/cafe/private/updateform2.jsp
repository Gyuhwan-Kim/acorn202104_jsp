<%@page import="test.fine.dto.FineDto"%>
<%@page import="test.fine.dao.FineDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	FineDto dto=FineDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform2.jsp</title>
<style>
	#cancelLink{
		text-decoration: none;
		color: black;
	}
	#cancelBtn, #submitBtn{
		padding-top: 0px;
	    padding-right: 0px;
	    padding-bottom: 0px;
	    padding-left: 0px;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>내용 수정 form</h1>
		<form action="update2.jsp" method="post">
			<input type="hidden" name="num" value="<%=num%>"/>
			<div>
				<label for="writer">작성자</label>
				<input type="hidden" name="writer" value="<%=dto.getWriter() %>"/>
				<input type="text" name="writer" value="<%=dto.getWriter() %>" disabled/>
			</div>
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" value="<%=dto.getTitle()%>"/>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id=""><%=dto.getContent() %></textarea>
			</div>
			<button id="submitBtn" type="submit">수정</button>
			<button id="cancelBtn"><a id="cancelLink" href="javascript:history.back()">취소</a></button>
		</form>
	</div>
</body>
</html>