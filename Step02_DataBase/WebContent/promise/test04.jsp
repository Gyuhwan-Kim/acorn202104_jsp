<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test04.jsp</title>
</head>
<body>
	<script>
		console.log("Promise 시작");
		
		new Promise(function(resolve, reject){
			setTimeout(function(){
				// 1. 무언가 원하는 작업을 하고
				console.log("reject는 function type이다.")
				console.log(reject);
				// 2. 작업이 실패이거나 작업을 중지하고자 한다면 두 번째 인자로 전달된 함수를 호출한다.
				reject();
			}, 5000);
		}).then(function(){
			console.log("then 안에 있는 function이 호출되었습니다.");
		}).catch(function(){
			// reject function을 호출하면 실행순서가 여기로 들어온다.
			console.log("catch 안에 있는 fucntion가 호출되었습니다.");
		});
		
		console.log("Primise 시작 후 다른 작업을 합니다.");
	</script>
</body>
</html>