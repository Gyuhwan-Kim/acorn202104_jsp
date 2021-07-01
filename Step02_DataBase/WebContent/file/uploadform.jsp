<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/uploadform.jsp</title>
</head>
<body>
	<h1>file upload test</h1>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="comment" placeholder="설명..."/>
		<br>
		<input type="file" name="myFile"/>
		<br>
		<button type="submit">upload</button>
	</form>
	<h2>image upload test</h2>
	<form action="upload_image.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="comment" placeholder="설명..."/>
		<br>
		<label for="image">image 선택</label>
		<input type="file" id="image" name="image" accept=".jpg, .JPG, .JPEG, .png, .gif"/>
		<br>
		<button type="submit">upload</button>
	</form>
	<h2>file upload test Ajax</h2>
	<form action="ajax_upload.jsp" id="myForm" method="post" enctype="multipart/form-data">
		<input type="text" id="comment" name="comment" placeholder="설명..."/>
		<br>
		<input type="file" id="myFile" name="myFile"/>
		<br>
		<button type="submit">upload</button>
	</form>
	<h2>image upload test Ajax</h2>
	<form id="imageForm" action="ajax_upload_image.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="comment" placeholder="설명..."/>
		<br>
		<label for="image">image 선택</label>
		<input type="file" id="image" name="image" accept=".jpg, .JPG, .JPEG, .png, .gif"/>
		<br>
		<button type="submit">upload</button>
	</form>
	<h3>upload 된 image</h3>
	<img id="resultImage"/>
	<script>
		document.querySelector("#myForm").addEventListener("submit", function(e){
			// form이 제출되지 않도록 기본 동작을 막아준다.
			e.preventDefault();
			/*
			// 입력한 comment 읽어오기
			let comment=document.querySelector("#comment").value;
			// 선택한 file 객체 얻어오기
			let file=document.querySelector("#myFile").files[0];
			// 전송할 FormData 구성하기
			let data=new FormData();
			*/
			// new FormData(form의 참조값) 해서 객체를 생성하면
			// form에 입력한 내용, 선택한 내용이 FormData 객체에 저장이 된다.
			let data=new FormData(this);
			// fetch function 을 이용해서 ajax 전송하기
			fetch("ajax_upload.jsp", {
				method:"post",
				body:data
			})
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
			})
		});
		
		document.querySelector("#imageForm").addEventListener("submit", function(e){
			e.preventDefault();
			// form에 입력한 내용
			let data=new FormData(this);
			// form을 제출할 url
			let url=this.getAttribute("action");
			fetch(url, {
				method:"post",
				body:data
			}).then(function(response){
				return response.json();
			}).then(function(data){
				// data는 {saveFileName:"xxx"} 형식의 object이다.
				console.log(data);
				let imagePath="<%=request.getContextPath()%>/upload/"+data.saveFileName;
				document.querySelector("#resultImage").setAttribute("src", imagePath);
			});
		});
		
		
	</script>
</body>
</html>