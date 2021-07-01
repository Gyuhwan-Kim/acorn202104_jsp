<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.col, .row > div{
		border:1px dotted red;
	}
</style>
</head>
<body>
	<div class="container-fluid border border-primary">
		<h1>.container-fluid</h1>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
	</div>
	<h2>모든 영역에 대해서 한 줄에 4개의 column으로 구성하기</h2>
	<div class="row">
		<div class="col">
			<img class="img-fluid" src="../images/image1.png" alt="" />
		</div>
		<div class="col">
			<img class="img-fluid" src="../images/image2.png" alt="" />
		</div>
		<div class="col">
			<img class="img-fluid" src="../images/image3.png" alt="" />
		</div>
		<div class="col">
			<img class="img-fluid" src="../images/image4.png" alt="" />
		</div>
	</div>
	<h2>특정 영역에서 column의 폭을 변화시키기</h2>
	<div class="row">
		<!-- col-sm-6 는 device 폭이 576px 이상에서 50%의 width를 가진다.
			 col-lg-3 는 device 폭이 992px 이상에서 25%의 width를 가진다.
		-->
		<div class="col-sm-1 col-lg-3">
			<img class="img-fluid" src="../images/image1.png" alt="" />
		</div>
		<div class="col-sm-1 col-lg-3">
			<img class="img-fluid" src="../images/image2.png" alt="" />
		</div>
		<div class="col-sm-1 col-lg-3">
			<img class="img-fluid" src="../images/image3.png" alt="" />
		</div>
		<div class="col-sm-1 col-lg-3">
			<img class="img-fluid" src="../images/image4.png" alt="" />
		</div>
	</div>	
	<div class="container border border-secondary">
		<h1>.container</h1>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>		
	</div>

</body>
</html>