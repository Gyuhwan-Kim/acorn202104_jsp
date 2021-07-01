<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>할 일 추가하기</h1>
		<form action="insert.jsp" method="post">
			<div>
				<label for="content">할 일</label>
				<input type="text" name="content" id="content"/>
			</div>
			<div>
				<label for="regdate">등록일</label>
				<input type="text" name="regdate" id="regdate"/>
			</div>
			<button type="submit">추가하기</button>
		</form>	
	</div>
</body>
</html>