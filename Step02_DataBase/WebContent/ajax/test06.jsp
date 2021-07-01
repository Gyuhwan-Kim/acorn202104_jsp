<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test06.jsp</title>
<script src="../js/gura_util.js"></script>
</head>
<body>
	<h1>ajax 타이레놀 test</h1>
	<input type="text" id="inputMsg" placeholder="전송할 문자열 입력..."/>
	<button id="sendBtn">전송</button>
	
	<form action="send2.jsp" method="post" id="myForm">
		<input type="text" name="msg" placeholder="전송할 문자열 입력..."/>
		<button type="submit">form 전송</button>
	</form>
	
	<script>
	/*
		/js/gura_util.js 가 loading이 되어있으면
		function ajaxPromise(), ajaxFromPromise()
		를 사용할 수 있다. 해당 function은 fetch() function이
		promise 객체를 return해준다.
		따라서 then().then().catch() 형식으로 사용할 수 있다.
		
		- 사용 예시 -
		ajaxPromise("xxx.jsp", "get", "msg=xxx").then().then();
		ajaxPromise("xxx.jsp", "get", "msg=xxx").then().then().catch();
		ajaxPromise("xxx.jsp", "post", "msg=xxx").then().then();
		ajaxPromise("xxx.jsp", "post", "msg=xxx").then().then().catch();
		ajaxPromise("xxx.jsp", "post", {msg:msg}).then().then();
		ajaxPromise("xxx.jsp", "post", {msg:msg}).then().then().catch();
		ajaxPromise("xxx.jsp", "post", "num=1&name=kim").then().then();
		ajaxPromise("xxx.jsp", "post", {num:1, name:"kim"}).then().then().catch();
		
		ajaxFormPromise(ajax 전송할 form의 참조값).then().then();
		ajaxFormPromise(ajax 전송할 form의 참조값).then().then().catch();
	*/
		document.querySelector("#sendBtn").addEventListener("click", function(){
			let msg=document.querySelector("#inputMsg").value;
			
			ajaxPromise("send2.jsp", "post", {msg:msg})
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			})
		});
		
		document.querySelector("#myForm").addEventListener("submit", function(e){
			//form이 제출되지 않도록 막기
			e.preventDefault();
		
			ajaxFormPromise(this)
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			})
		});
	</script>
</body>
</html>