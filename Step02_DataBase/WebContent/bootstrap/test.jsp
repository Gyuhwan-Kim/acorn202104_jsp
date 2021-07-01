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

	<div class="row">
		<!-- col-sm-6 는 device 폭이 576px 이상에서 50%의 width를 가진다.
			 col-lg-3 는 device 폭이 992px 이상에서 25%의 width를 가진다.
		-->
		<div class="col col-sm-3">
			<img class="img-fluid" src="../images/image1.png" alt="" />
		</div>
		<div class="col col-sm-3">
			<img src="../images/image2.png" alt="" />
		</div>
		<div class="col col-sm-3">
			<img src="../images/image3.png" alt="" />
		</div>
		<div class="col col-sm-3">
			<img src="../images/image4.png" alt="" />
		</div>
	</div>	

</body>
</html>