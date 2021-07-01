<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	    	<li class="breadcrumb-item active" aria-current="page">회원 추가 form</li>
	  	</ol>
	</nav>	
		<h1>회원 추가 form</h1>
		<div class="col-sm-6 offset-sm-3">
		<form action="insert.jsp" method="post">
			<div class="mb-3">
				<label class="form-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name"/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr"/>
			</div>
			<button class="btn btn-secondary" type="submit">추가</button>
		</form>
		</div>
	</div>		
</body>
</html>