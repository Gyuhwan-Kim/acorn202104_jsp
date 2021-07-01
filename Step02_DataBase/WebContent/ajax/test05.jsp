<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test05.jsp</title>
</head>
<body>
	<input type="text" id="inputMsg" placeholder="전송할 문자열 입력..."/>
	<button id="sendBtn">전송</button>
	<script>
		// 메세지를 입력하고 전송 버튼을 눌렀을 때,
		// 페이지 전환 없이 post 방식으로 send2.jsp 페이지에 전송하기
		document.querySelector("#sendBtn").addEventListener("click", function(){
			// 입력한 문자열을 읽어온다.
			let msg=document.querySelector("#inputMsg").value;
			
			// 특수 문자를 post방식으로 전송 가능하게 encoding하기
			const encodedMsg=encodeURIComponent(msg);
			// encoding 후 모양을 console 창에서 확인하기
			console.log("encodedMsg: "+encodedMsg);
			// encoding된 문자열을 query string 형식으로 만들기
			const queryString="msg="+encodedMsg;
			
			fetch("send2.jsp", {
				method:"post",
				headers:{
					"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"
				},
				body:queryString
			})
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
			
		});
	</script>
</body>
</html>