<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/bootstrap/helper.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<!-- 
<style>
	#one{float:left;}
	#two{float:right;}
	p{clear:both;}
</style>
 -->

</head>
<body>
	<div class="container">
	<h1>helper class test</h1>
		<div class="bg-info clearfix">
			<button id="one" class="btn btn-secondary float-start">왼쪽 버튼</button>
			<button id="two" class="btn btn-secondary float-end">오른쪽 버튼</button>
		</div>
		<p class="bg-warning">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore culpa repudiandae eligendi voluptates tempore. Facere dicta laboriosam sint dolor amet exercitationem animi adipisci omnis vitae tempore quas nobis labore ut.</p>
	<h2>color link</h2>
	<a href="#" class="link-primary">Primary link</a>
	<a href="#" class="link-secondary">Secondary link</a>
	<a href="#" class="link-success">Success link</a>
	<a href="#" class="link-danger">Danger link</a>
	<a href="#" class="link-warning">Warning link</a>
	<a href="#" class="link-info">Info link</a>
	<a href="#" class="link-light">Light link</a>
	<a href="#" class="link-dark">Dark link</a>
	
	<h2>ratio</h2>
		<div class="row">
			<div class="col">
				<div class="ratio ratio-16x9">
				  	<iframe src="https://www.youtube.com/watch?v=ysSxxIqKNN0" title="YouTube video" allowfullscreen></iframe>
				</div>			
			</div>
			<div class="col">
				<div class="ratio ratio-16x9">
				  	<iframe src="https://www.youtube.com/watch?v=efh1bjAfYBc" title="YouTube video" allowfullscreen></iframe>
				</div>			
			</div>
		</div>
		<div class="fixed-top bg-dark p-3 text-white">fixed-top</div>
		<div class="fixed-bottom bg-dark p-3 text-white">fixed-top</div>
		<img class="sticky-top" src="../images/1.jpg" alt="" />
		<button class="btn btn-primary">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
		  	<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
		  	<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
			<span class="visually-hidden">추가</span>
		</button>
		<div class="bg-secondary" style="height: 1000px;"></div>
	</div>
</body>
</html>