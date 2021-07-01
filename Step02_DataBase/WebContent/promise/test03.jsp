<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test03.jsp</title>
</head>
<body>
	<script>
		new Promise(function(resolve, b){
			// 1. 무언가 원하는 작업을 하고
			console.log("resolve는 function type이다.")
			console.log(resolve);
			// 2. function의 첫 번째 인자로 전달된 function을 호출해주면
			resolve();
		}).then(function(){
			// 3. then 안에 있는 함수가 호출된다.
			console.log("then 안에 있는 function이 호출되었습니다.");
		});
	</script>
</body>
</html>