<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// post 방식 전송했을 때 한글 깨지지 않도록
	request.setCharacterEncoding("utf-8");
	//parameter 추출
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	// MemberDto에 담고
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	// MemberDao 객체를 이용해서 DB에 저장
	boolean beSuccess=MemberDao.getInstance().insert(dto);
%>
{"beSuccess":<%=beSuccess%>}