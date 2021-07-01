<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test07.jsp</title>
</head>
<body>
	<script>
		console.log("Promise 시작");
	
		new Promise(function(resolve, reject){
			console.log("1단계 수행함");
			let beGo=confirm("다음 단계로 넘어갈까요?");
			if(beGo){
				resolve();
			} else {
				reject();
			}
		}).then(function(a){
			console.log("2단계 수행함");
			// 또다른 작업을 Promise로 시작하고 싶으면
			// Promise 객체를 return 해주면 된다.
			return new Promise(function(resolve, reject){
				let beGo=confirm("다음 단계로 넘어갈까요?");
				if(beGo){
					resolve();
				} else {
					reject();
				}				
			});
		}).then(function(a){
			console.log("3단계 수행함");	
			
		}).catch(function(){
			console.log("작업이 종료되었습니다.");
		});
		
		console.log("Primise 시작 후 다른 작업을 합니다.");
	</script>
</body>
</html>