<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/form_validation.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<form action="">
			<div>
				<label class="form-label" for="">아이디</label>
				<input id="one" type="text" class="form-control"/>
				<div class="valid-feedback">
					잘 입력했네
				</div>
			</div>
			<div>
				<label class="form-label" for="">비밀번호</label>
				<input type="text" class="form-control"/>
				<div class="invalid-feedback">
					잘못 입력했네
				</div>
			</div>
			<div>
				<label class="form-label" for="">아이디</label>
				<input type="text" class="form-control is-valid"/>
				<div class="valid-feedback">
					잘 입력했네
				</div>
			</div>
			<div>
				<label class="form-label" for="">비밀번호</label>
				<input type="text" class="form-control is-invalid"/>
				<div class="invalid-feedback">
					잘못 입력했네
				</div>
			</div>
		</form>
	</div>
	<script>
	
	</script>
</body>
</html>