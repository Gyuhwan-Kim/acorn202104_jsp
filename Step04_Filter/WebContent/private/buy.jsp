<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// get 방식 전송되는 parameter 추출
	int num=Integer.parseInt(request.getParameter("num"));
	int amount=Integer.parseInt(request.getParameter("amount"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/buy.jsp</title>
</head>
<body>
	<h1>상품 구매 결과 page 입니다.</h1>
	<p>
		<strong><%=num %></strong> 번 상품 <strong><%=amount %></strong> 개를 주문했습니다.
	</p>
</body>
</html>