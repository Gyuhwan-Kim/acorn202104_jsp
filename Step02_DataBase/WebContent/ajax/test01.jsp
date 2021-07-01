<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test01.jsp</title>
</head>
<body>
	<!-- <a href=".jsp">회원 목록</a> -->
	
	<button id="requestBtn">요청하기</button>
	<button id="requestBtn2">요청하기2</button>
	<button id="requestBtn3">요청하기3</button>
	<button id="requestBtn4">요청하기4</button>
	<button id="requestBtn5">요청하기5</button>
	<div id="result">
	
	</div>
	<script>
		document.querySelector("#requestBtn").addEventListener("click", function(){
			fetch("get_data.jsp")
			.then(function(response){
				// response는 응답 객체
				console.log(response);
				// 응답 객체체의 text() function을 호출해서 return되는 promise 객체를 return해준다.
				return response.text();
			})
			.then(function(data){
				// data는 server가 응답한 문자열이다.
				console.log(data);
			});
		})
		
		document.querySelector("#requestBtn2").addEventListener("click", function(){
			fetch("get_data2.jsp")
			.then(function(response){
				// response는 응답 객체
				console.log(response);
				// 응답 객체체의 text() function을 호출해서 return되는 promise 객체를 return해준다.
				return response.text();
			})
			.then(function(data){
				// data는 html 형식의 문자열이다.
				document.querySelector("#result").innerHTML=data;
			});
		})
		
		document.querySelector("#requestBtn3").addEventListener("click", function(){
			fetch("get_data3.jsp")
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				// data는 서버가 응답한 JSON 형식의 문자열이다.				
				console.log(data);
				// object로 바꾸기
				let obj=JSON.parse(data);
				let p1=document.createElement("p");
				p1.innerText="번호 : "+obj.num+" 이름 : "+obj.name+" 남자여부 : "+obj.beMan;
				document.querySelector("#result").append(p1);
			});
		})	
		
		document.querySelector("#requestBtn4").addEventListener("click", function(){
			fetch("get_data3.jsp")
			.then(function(response){
				// server가 JSON 형식의 문자열을 응답할 때는 .json() function 을 호출해서 return한다.
				return response.json();
			})
			.then(function(data){
				// data				
				console.log(data);
				let p1=document.createElement("p");
				p1.innerText="번호 : "+data.num+" 이름 : "+data.name+" 남자여부 : "+data.beMan;
				document.querySelector("#result").append(p1);
			});
		})			
		
		document.querySelector("#requestBtn5").addEventListener("click", function(){
			fetch("animals.jsp")
			.then(function(response){
				// server가 JSON 형식의 문자열을 응답할 때는 .json() function 을 호출해서 return한다.
				return response.json();
			})
			.then(function(data){
				// data는 array다
				console.log(data);
				// ul 요소를 만든다.
				let ul=document.createElement("ul");
				ul.setAttribute("id", "ulresult");
				document.querySelector("#result").append(ul);
				// 반복문 돌면서 li 요소를 만들고 array에 있는 문자열을 innerText로 출력해서 ul에 추가
				for(let i=0; i<data.length; i++){
					let li=document.createElement("li");
					li.innerText=data[i];
					document.querySelector("#ulresult").append(li);
				}
			});
		})	
	</script>
</body>
</html>