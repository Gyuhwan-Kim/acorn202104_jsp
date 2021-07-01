<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cPath=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.carousel-item > img{
		width: 100%;
		height: 100%;
	}

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
  		<div class="container">
   	 		<a class="navbar-brand text-light" href="index.jsp">
      			<img src="../images/b4.png" alt="" width="30" height="30">
    			My Favor
    		</a>
    		<div class="collapse navbar-collapse" id="navbarNav">
      			<ul class="navbar-nav">
        			<li class="nav-item">
          				<a class="nav-link active text-light" aria-current="page" href="#">Home</a>
        			</li>
        			<li class="nav-item">
          				<a class="nav-link text-light" href="#">Music</a>
        			</li>
			        <li class="nav-item">
			          	<a class="nav-link text-light" href="#">Movie</a>
			        </li>
			        <li class="nav-item">
			          	<a class="nav-link text-light" href="#" tabindex="-1">Game</a>
			        </li>
     			</ul>   			
    		</div>		   		
		    <a href="login.jsp">
			    <button class="btn btn-light bg-light ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#toggleId">
					<span>로그인</span>
	    		</button>
    		</a> 	    		      		 			
    		<form class="d-flex">
		      	<input class="form-control ms-2 me-2" type="search" placeholder="Search">
		      	<button class="btn btn-outline-light" type="submit">
		      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
		      	</button>
		    </form>	    
		    <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>      		    
  		</div>
	</nav>	
	<div class="container">
		<div class="row">
			<div class="col-sm-4 box border border-3 border-secondary mb-3 mt-3">
				공지사항
			</div>
			<div class="col-sm-4 mb-3 mt-3">
				<img src="../images/new/me2.jpg" width="350px" height="200px" alt="" />
			</div>
			<div class="col-sm-4 box border border-3 border-secondary mb-3 mt-3">
				<span>about me</span>
			</div>
		</div>
		<div class="row">
			<div class="col-center col-sm-4">
				<div id="music-carousel" class="carousel slide" data-bs-ride="carousel">
				  	<div class="carousel-indicators position-absolute top-0">
				    	<button type="button" data-bs-target="#music-carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    	<button type="button" data-bs-target="#music-carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    	<button type="button" data-bs-target="#music-carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
				 	</div>
				  	<div class="carousel-inner">
				    	<div class="carousel-item active">
				      		<img src="../images/new/1.jpg" class="d-block w-100 img-thumbnail" alt="...">
				    	      	<div class="card-body">
        							<h5 class="card-title">이석훈&로코베리의 신곡!!</h5>
						        	<p class="card-text">2021년 버전으로<br> '그대를 사랑하는 10가지 이유'를 만나보세요</p>
						      	</div>
				    	</div>
					    <div class="carousel-item">
					      	<img src="../images/new/2.jpg" class="d-block w-100 img-thumbnail" alt="...">
				    	      	<div class="card-body">
        							<h5 class="card-title">서울의 잠 못 이루는 밤</h5>
						        	<p class="card-text">10cm 의 첫 피쳐링 곡<br> 이수현씨와의 콜라보는 어떨까요?</p>
						      	</div>					    
					    </div>
					    <div class="carousel-item">
					      	<img src="../images/new/3.jpg" class="d-block w-100 img-thumbnail" alt="...">
				    	      	<div class="card-body">
        							<h5 class="card-title">Elbs의 첫 앨범, 첫 타이틀곡!</h5>
						        	<p class="card-text">앞으로의 그의 행보를 주목하라</p>
						      	</div>					    
					    </div>
					</div>
				  	<button class="carousel-control-prev" type="button" data-bs-target="#music-carousel" data-bs-slide="prev">
				    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    	<span class="visually-hidden">Previous</span>
				  	</button>
				  	<button class="carousel-control-next" type="button" data-bs-target="#music-carousel" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
				  	</button>
				</div>			
			</div>
			
			<div class="col-center col-sm-4">
				<div id="movie-carousel" class="carousel slide" data-bs-ride="carousel">
				  	<div class="carousel-indicators position-absolute top-0">
				    	<button type="button" data-bs-target="#movie-carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    	<button type="button" data-bs-target="#movie-carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    	<button type="button" data-bs-target="#movie-carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
				 	</div>
				  	<div class="carousel-inner">
				    	<div class="carousel-item active">
				      		<img src="../images/new/4.jpg" class="d-block img-thumbnail" alt="...">
				    	</div>
					    <div class="carousel-item">
					      	<img src="../images/new/5.jpg" class="d-block img-thumbnail" alt="...">
					    </div>
					    <div class="carousel-item">
					      	<img src="../images/new/6.jpg" class="d-block img-thumbnail" alt="...">
					    </div>
					</div>
				  	<button class="carousel-control-prev" type="button" data-bs-target="#movie-carousel" data-bs-slide="prev">
				    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    	<span class="visually-hidden">Previous</span>
				  	</button>
				  	<button class="carousel-control-next" type="button" data-bs-target="#movie-carousel" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
				  	</button>
				</div>			
			</div>
			
			<div class="col-center col-sm-4">
				<div id="game-carousel" class="carousel slide" data-bs-ride="carousel">
				  	<div class="carousel-indicators position-absolute top-0">
				    	<button type="button" data-bs-target="#game-carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    	<button type="button" data-bs-target="#game-carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    	<button type="button" data-bs-target="#game-carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
				 	</div>
				  	<div class="carousel-inner">
				    	<div class="carousel-item active">
					    	<a href="video1.jsp">
								<img src="../images/new/a.png" class="d-block w-100 img-thumbnail" alt="...">				    
						    </a>
					    </div>
					    <div class="carousel-item">
						    <a href="video2.jsp">
						      	<img src="../images/new/b.png" class="d-block w-100 img-thumbnail" alt="...">
						    </a>
					    </div>
					    <div class="carousel-item">
					    	<a href="video3.jsp">
					      		<img src="../images/new/c.png" class="d-block w-100 img-thumbnail" alt="...">
					    	</a>
					    </div>
					</div>
				  	<button class="carousel-control-prev" type="button" data-bs-target="#game-carousel" data-bs-slide="prev">
				    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    	<span class="visually-hidden">Previous</span>
				  	</button>
				  	<button class="carousel-control-next" type="button" data-bs-target="#game-carousel" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
				  	</button>
				</div>			
			</div>						
		</div>

	</div>	
	<div class="fixed-bottom sticky-bottom bg-dark p-1 text-light">
		<span class="float-start" >후원 계좌 : 기업은행 087-aaaaaa-bb-ccc 예금주 김규환</span>
		<span class="float-end">후원 문의 : 010-xxxx-yyyy</span>
	</div>
</body>
</html>