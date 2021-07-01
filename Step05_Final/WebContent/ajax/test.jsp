<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.link{
		text-decoration-line: none;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="alert alert-danger" role="alert">
			삭제했습니다.
		</div>
		<button class="btn btn-outline-success">전송</button>
		<div class="alert alert-secondary">
			<ol class="breadcrumb">
			    <li class="breadcrumb-item"><a class="link" href="#">home</a></li>
			    <li class="breadcrumb-item"><a class="link" href="#">game</a></li>
			    <li class="breadcrumb-item active">study</li>
		  	</ol>
		</div>
		<div>
			<label class="form-label" for="email">email</label>
			<input class="form-control" type="text" name="email" id="email"/>
		</div>
		<div>
			<label class="form-label" for="email">email</label>
			<input class="form-control is-invalid" type="text" name="email" id="email"/>
			<div class="invalid-feedback">
				형식이 달라요
			</div>
		</div>
	</div>
</body>
</html>