<%@page import="test.cafe.dao.CafeCommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// 삭제할 댓글의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));

	// DB에서 삭제한다.
	boolean beDeleted=CafeCommentDao.getInstance().delete(num);
	
	// json으로 응답한다.
	
%>
{"beDeleted": <%=beDeleted%>}