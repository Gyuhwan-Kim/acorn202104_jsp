<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session scope에 저장된 id를 이용해서
	String id=(String)session.getAttribute("id");
	
	// 개인 정보를 불러와서
	UsersDto dto=UsersDao.getInstance().getData(id);
	
	// 개인정보 수정 form에 출력해준다.
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
<style>
	/*
		profile image를 작은 원형으로 불러온다
	*/
	#profileImage{
		width: 50px;
      	height: 50px;
      	border: 1px solid #cecece;
      	border-radius: 50%;
	}
	#imageForm{
		display: none;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>가입 정보 수정 form 입니다.</h1>
		<a id="profileLink" href="javascript:">
			<%if(dto.getProfile()==null){ %>
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
	  				<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
	  				<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
			<%} else { %>
				<img id="profileImage" src="<%=request.getContextPath() %><%=dto.getProfile() %>" alt="" />
			<%} %>
		</a>
		<form action="update.jsp">
			<input type="hidden" name="profile" 
				value="<%=dto.getProfile()==null ? "empty" : dto.getProfile() %>"/>
			<div>
				<label for="id">아이디</label>
				<input type="text" id="id" name="id" value="<%=id%>" disabled/>
			</div>
			<div>
				<label for="email">이메일</label>
				<input type="text" id="email" name="email" value="<%=dto.getEmail()%>"/>
			</div>
			<button type="submit">수정 반영</button>
		</form>
		
		<form action="ajax_profile_upload.jsp" method="post"
			id="imageForm" enctype="multipart/form-data">
			<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif" />
		</form>
	</div>
	<script src="<%=request.getContextPath() %>/js/gura_util.js"></script>
	<script>
		document.querySelector("#profileLink").addEventListener("click", function(){
			// input type="file" 을 강제 클릭
			document.querySelector("#image").click();
		});
		
		// image를 선택했을 때 실행할 함수 등록
		document.querySelector("#image").addEventListener("change", function(){
			let form=document.querySelector("#imageForm");
			
			//ajax 전송할 form의 참조값을 전달한다.
			ajaxFormPromise(form)
			.then(function(response){
				return response.json();
			}).then(function(data){
				// data는 {imagePath:"/upload/xxx.jsp"} 형식의 object
				console.log(data);
				let img=`<img id="profileImage" src="<%=request.getContextPath()%>\${data.imagePath}"/>`;
				document.querySelector("#profileLink").innerHTML=img;
			
				// input name="profile" 요소의 value 값으로 image 경로 넣어주기
				document.querySelector("input[name=profile]").value=data.imagePath;
			});
		});
		
		/*
			util을 사용하지 않는 code는 아래와 같다
			
			let form=document.querySelector("#imageForm");
		    
			const url=form.getAttribute("action");
		    const method=form.getAttribute("method");
		    
		    //폼에 입력한 데이터를 FormData 에 담고 
		    let data=new FormData(form);
		    
		    // fetch() 함수가 리턴하는 Promise 객체를 
		    fetch(url,{
		    	method:method,
		        body:data
		    })
		    .then(function(response){
		    	return response.json();
		    })
		    .then(function(data){
		       	console.log(data);
		         
		    });

		*/
	</script>
</body>
</html>