<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session scope에 id라는 key로 저장된 문자열 읽어오기
	// (null이 아니면 login 된 것이다. )
	String id=(String)request.getSession().getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<jsp:include page="/include/resource.jsp"></jsp:include>
<jsp:include page="/include/navbar.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<%if(id!=null){ %>
		<!-- 
			<p>
				<a href="users/private/info.jsp"><%=id %></a> 님이 로그인 중입니다.
				<a href="users/logout.jsp">로그아웃</a>
			</p>
		 -->	
		<%} %>
		<h1>index page입니다.</h1>
		<!-- 
		<ul>
			<li><a href="users/signup_form.jsp">회원 가입</a></li>
			<li><a href="users/loginform.jsp">로그인</a></li>
			<li><a href="cafe/list.jsp">카페 글 목록 보기</a></li>
			<li><a href="file/list.jsp">자료실 목록 보기</a></li>
			<li><a href="cafe/home.jsp">가쥬아~</a></li>
		</ul>
		 -->
	</div>
	<%
		// 쿠키 읽어오기
		Cookie[] cookies=request.getCookies();
		// 팝업을 띄울지 여부
		boolean bePopup=true;
		if(cookies!=null){
			for(Cookie tmp:cookies){
				// bePopup 이라는 이름으로 저장된 쿠키가 있으면
				if(tmp.getName().equals("bePopup")){
					// 팝업을 띄우지 않게 한다.
					bePopup=false;
				}
			}
		}
	%>
	<script>
		/*
			[ 팝업창 띄우기 ]
			
			window 객체의 .open() 함수를 이용해서 팝업창을 띄울 수 있다.
			
			.open(띄울 페이지, 제목(동작은 안함), 옵션)
		*/
		<%if(bePopup){%>
			window.open("sale.jsp", "창의 제목", "width=400, height=400, top=100, left=100");
		<%} %>
	</script>
</body>
</html>