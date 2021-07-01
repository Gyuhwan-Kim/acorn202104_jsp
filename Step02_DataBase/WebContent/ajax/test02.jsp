<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="inputMsg" placeholder="서버에 전송할 문자열 입력..."/>
	<button id="sendBtn">전송</button>
	<script>
		/*
			문자열을 입력하고 전송 버튼을 눌렀을 때, 입력한 문자열을 읽어와서
			페이지 전환 없이 get 방식으로 send.jsp 페이지에 요청과 함께 전달하려면
			어떻게 하면 될까?
		*/
		document.querySelector("#sendBtn").addEventListener("click", function(){
			let msg=document.querySelector("#inputMsg").value;
			fetch("send.jsp?msg="+msg)
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
				
			});
		})
		
	</script>
</body>
</html>