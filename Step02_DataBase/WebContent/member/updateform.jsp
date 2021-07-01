<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 요청 parameter로 전달되는 수정할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	System.out.println(num+" 번의 정보를 읽어왔습니다.");
	// 2. 번호에 해당하는 회원의 정보를 얻어온다. (MemberDto)
	MemberDao dao=MemberDao.getInstance();
	MemberDto dto=dao.getData(num);
	
	// 3. 수정할 양식(form)을 응답한다.
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<%--
	포함시킬 jsp page의 위치를 상대경로로 지정한다.
 --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="member" name="thisPage"/>
</jsp:include>
	<div class="container">
	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
		<ol class="breadcrumb">
	  		<li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/">Home</a></li>
	  		<li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/member/list.jsp">회원 목록</a></li>
	    	<li class="breadcrumb-item active" aria-current="page">회원 수정 form</li>
	  	</ol>
	</nav>		
		<h1>회원정보 수정 form</h1>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>주소</th>
					</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=dto.getNum() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getAddr() %></td>
				</tr>
			</tbody>
		</table>
		<br>
		<form action="update.jsp" method="post">
			<!-- 수정할 때 번호도 필요하기 때문에 input type="hidden" 으로 전송되도록 한다. -->
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			<div class="mb-3">
				<label class="form-label" for="num">번호</label>
				<%-- 이렇게도 주석 가능 --%>
				<%-- input 요소에 disabled 속성을 추가하면 수정도 불가하고 전송도 되지 않는다. --%>
				<input class="form-control" type="text" name="num" id="num" value="<%=dto.getNum() %>" disabled/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name" value="<%=dto.getName()%>"/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
			</div>
			<button class="btn btn-secondary" type="submit">수정 확인</button>
			<button class="btn btn-secondary" type="reset">취소</button>
		</form>
	</div>
</body>
</html>