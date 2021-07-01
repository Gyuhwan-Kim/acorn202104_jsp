<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<%-- navbar.jsp 포함시키기 --%>
<jsp:include page="include/navbar.jsp"></jsp:include>
	<div class="container">
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
	    	<div class="carousel-item active">
	      	<img src="images/top01.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      	<img src="images/top02.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      	<img src="images/top03.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      	<img src="images/top04.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item">
	      	<img src="images/top05.jpg" class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    	<span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
	    	<span class="visually-hidden">Next</span>
	  </button>
	</div>	
	<h1>여름 맞이 신상품 <span class="badge bg-primary">30% SALE</span></h1>
	<div class="row align-items-center">
		<div class="col-sm-6 col-lg-3">
			<div class="card">
		  		<img src="images/canada.png" class="card-img-top img-fluid" alt="...">
		  		<div class="card-body">
		    		<h5 class="card-title">Card title</h5>
		    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		    		<a href="#" class="btn btn-primary">Go somewhere</a>
		  		</div>
			</div>
		</div>
				<div class="col-sm-6 col-lg-3">
			<div class="card">
		  		<img src="images/mongolia.png" class="card-img-top img-fluid" alt="...">
		  		<div class="card-body">
		    		<h5 class="card-title">Card title</h5>
		    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		    		<a href="#" class="btn btn-primary">Go somewhere</a>
		  		</div>
			</div>
		</div>
				<div class="col-sm-6 col-lg-3">
			<div class="card">
		  		<img src="images/nepal.png" class="card-img-top img-fluid" alt="...">
		  		<div class="card-body">
		    		<h5 class="card-title">Card title</h5>
		    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		    		<a href="#" class="btn btn-primary">Go somewhere</a>
		  		</div>
			</div>
		</div>
				<div class="col-sm-6 col-lg-3">
			<div class="card">
		  		<img src="images/georgia.png" class="card-img-top img-fluid" alt="...">
		  		<div class="card-body">
		    		<h5 class="card-title">Card title</h5>
		    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		    		<a href="#" class="btn btn-primary">Go somewhere</a>
		  		</div>
			</div>
		</div>
	</div>
		<h1>index page입니다.</h1>
		<ul>
			<li><a href="member/list.jsp">회원 목록 보기</a></li>
			<li><a href="todo/list.jsp">할 일 목록 보기</a></li>
			<li><a href="bootstrap/hello.html">bootstrap hello 테스트</a></li>
		</ul>
	</div>
</body>
</html>