<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// "inputId" parameter로 전달되는 문자열 읽어오기
	String inputId=request.getParameter("inputId");
	
	// DB에서 가입된 id가 이미 존재하고 있는지 여부를 얻어낸다.
	boolean beExist=UsersDao.getInstance().beExist(inputId);

	// 응답하기
	
%>
{"beExist" : <%=beExist%>}