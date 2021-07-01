<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// 여기는 servlet의 service() method 안쪽이라고 생각하면 된다.
    	String num=request.getParameter("num");
    	String type=request.getParameter("type");
    	System.out.println(num+"번 물건 "+type+"을(를) 샀습니다.");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>구매 성공!!</h1>
	<p><%=num+"번 물건 "+type+"를 Flex~ 했습니다." %></p>
	<p>
		<strong><%=num %></strong> 번 상품
		<strong><%=type %></strong> 물품을 구매했습니다.
	</p>
	<script>
		alert("구매에 성공했습니다.");
	</script>
</body>
</html>