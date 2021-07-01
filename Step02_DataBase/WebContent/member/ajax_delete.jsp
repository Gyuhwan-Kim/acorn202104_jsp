<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// 1. 요청 parameter로 전달되는 삭제할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	
	// 2. MemberDao 객체를 이용해서 삭제하고 성공 여부를 return 받는다.
	boolean beSuccess=MemberDao.getInstance().delete(num);
			
	// 3. 작업 성공 여부를 json 문자열로 응답한다.
	// contentType을 application/json
%>
{"beSuccess":<%=beSuccess%>}