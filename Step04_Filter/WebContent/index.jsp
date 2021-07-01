<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<div class="container">
		<h1>index page입니다.</h1>
		<form action="send.jsp" method="post">
			<input type="text" name="msg" placeholder="메세지 입력..."/>
			<button type="submit">전송</button>
		</form>
	   	<%
	      	//session 영역에 id 라는 키값으로 저장된 값이 있는지 읽어와 본다.
	      	String id=(String)session.getAttribute("id");
	   		String cPath=request.getContextPath();
	   	%>
	   	<%if(id == null){ %>
	      	<h2>로그인 폼</h2>
	      	<form action="users/login.jsp" method="post">
	         	<input type="hidden" name="url" value="<%=cPath%>/"/>
	         	<input type="text" name="id" placeholder="아이디 입력..."/>
	         	<button type="submit">로그인</button>
	      	</form>
	   	<%}else{ %>
	      	<p>
	         	<strong><%=id %></strong> 님 로그인중 ...
	         	<a href="users/logout.jsp">로그아웃</a>
	      	</p>
	   	<%} %>
	   	<ul>
	   		<li><a href="private/play.jsp">놀러가기</a></li>
	   		<li><a href="private/study.jsp">공부하기</a></li>
	   		<li><a href="private/buy.jsp?num=1&amount=5">1번 상품 5개 구매하기</a></li>
	   		<li><a href="private/buy.jsp?num=2&amount=3">2번 상품 3개 구매하기</a></li>
	   	</ul>

	</div>
</body>
</html>