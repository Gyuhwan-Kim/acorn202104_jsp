<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object result=application.getAttribute("count");
	int count=1;	
	// 만일 첫 번째 출석이라면
	if(result==null){
		// application scope에 count라는 key로 1을 담는다.
		application.setAttribute("count", count);
	} else {
		// 원래 type으로 casting
		count=(int)result;
		// count를 1 증가시키고
		count++;
		// application scope에 count라는 key로 담는다.
		application.setAttribute("count", count);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/check.jsp</title>
</head>
<body>
	<p><strong><%=count %></strong>번째 출석이군요!</p>
</body>
</html>