<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/scroll.jsp</title>
<style>
	.spacer{
		height: 500px;
		background-color: #999;
		border: 1px solid red;
	}
</style>
</head>
<body>
	<div class="spacer"></div>
	<div class="spacer"></div>
	<div class="spacer"></div>
	<script>
		/*
			window.scrollY : 위쪽으로 scroll 된 높이
			window.innerHeight : web browser 창의 높이
			document.body.offsetHeight : body의 높이 (문서 객체가 차지하는 높이)
		*/
		window.addEventListener("scroll", function(){
			console.log("scroll");
			
			// 바닥까지 scroll 했는지의 여부
			const beBottom=
				window.innerHeight+window.scrollY >= document.body.offsetHeight;
			
			if(beBottom){
				console.log("바닥이네?");
			}
		});
	</script>
</body>
</html>