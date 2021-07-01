<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. form 전송되는 수정할 회원의 정보를 읽어온다.
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	// 2. DB에 수정을 반영한다.
	//MemberDao dao=MemberDao.getInstance();
	MemberDto dto=new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	boolean beSuccess=MemberDao.getInstance().update(dto);
	
	// 3. 응답한다.
	// 이번엔 javascript로 응답해볼 것
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<%if(beSuccess){%>
		<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
			<symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    			<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
  			</symbol>
		</svg>
		<div class="alert alert-success d-flex align-items-center" role="alert">
			<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
		  		<div>
		    		<%=num%> 번 회원의 정보를 수정했습니다.
		  		</div>
		  		<a class="alert-ling" href="list.jsp">확인</a>
		</div>
		<%-- client가 해석할 javascript를 응답하고 싶으면 --%>
		<%-- script 요소 안에 javascript를 작성한다. --%>
		<!--
		<script>
			alert("<%=num%> 번 회원의 정보를 수정했습니다.");
			// javascript로 페이지 이동을 시킬 수 있다.
			location.href="/Step02_DataBase/member/list.jsp"
		</script>
		-->
	<%}else{%>
		<script>
			alert("회원 정보 수정 실패");
			location.href="list.jsp"
		</script>
	<%} %>
</body>
</html>