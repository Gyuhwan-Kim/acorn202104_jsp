<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insertform2.jsp</title>
</head>
<body>
	<div class="container">
		<h1>새 글 작성 form</h1>
		<form action="${pageContext.request.contextPath}/cafe/private/insert2.jsp">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content"></textarea>
			</div>
			<button type="submit">등록</button>
		</form>
	</div>
</body>
</html>