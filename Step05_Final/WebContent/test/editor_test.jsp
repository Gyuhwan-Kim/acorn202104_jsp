<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/editor_test.jsp</title>
</head>
<body>
	<h1>editor test</h1>
	<input type="color" id="color"/>
	<select name="" id="size">
		<option>16</option>
		<option>20</option>
		<option>24</option>
	</select>
	<br/>
	<textarea id="area" cols="30" rows="10"></textarea>
	<div id="result">
		
	</div>
	<script>
		let selectedColor="#000000";
		let selectedSize=16;
		
		document.querySelector("#color").addEventListener("change", function(){
			selectedColor=this.value;
			transform();
		});
		document.querySelector("#size").addEventListener("change", function(){
			selectedSize=this.value;
			transform();
		});
		document.querySelector("#area").addEventListener("input", function(){
			transform();
		});
		
		function transform(){
			// 입력한 문자열을 읽어온다.
			let str=document.querySelector("#area").value;
			let result=str.replaceAll("\n","<br/>");
			let p=`<p style="color:\${selectedColor};font-size:\${selectedSize}px;">\${result}</p>`;
			document.querySelector("#result").innerHTML=p;
			
		}
	</script>
</body>
</html>