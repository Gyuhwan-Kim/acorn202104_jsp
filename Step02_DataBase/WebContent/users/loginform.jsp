<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청과 함께 전달되는 쿠키 정보 얻어내기
	Cookie[] cookies=request.getCookies();
	
	String savedId=null;
	String savedPwd=null;
	if(cookies!=null){
		// 반복문 돌면서 cookie 객체를 하나씩 참조
		for(Cookie tmp:cookies){
			// cookie의 key value를 읽어와서
			String key=tmp.getName();
			if(key.equals("savedId")){ // 저장된 id 라면
				savedId=tmp.getValue();
			} else if(key.equals("savedPwd")){ // 저장된 pwd 라면
				savedPwd=tmp.getValue();
			}
		}
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
</style>
<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">
	<main class="form-signin">
        <form action="login.jsp" method="post">
          	<img class="mb-4" src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
          	<h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>
          	<%if(savedId==null){ %>
	          	<div class="form-floating">
	               	<input type="text" name="id" class="form-control" id="id" placeholder="아이디 입력...">
	               	<label for="id">아이디</label>
	          	</div>
	          	<div class="form-floating">
	             	<input type="password" name="pwd" class="form-control" id="pwd" placeholder="비밀번호 입력...">
	               	<label for="pwd">비밀번호</label>
	          	</div>
	      	
	          	<div class="checkbox mb-3">
	              	<label>
	                 	<input type="checkbox" name="save" value="yes"> 로그인 정보 저장
	               	</label>
	          	</div>
			<%} else { %>
	          	<div class="form-floating">
	               	<input type="text" value="<%=savedId %>" name="id" class="form-control" id="id" placeholder="아이디 입력...">
	               	<label for="id">아이디</label>
	          	</div>
	          	<div class="form-floating">
	             	<input type="password" value="<%=savedPwd %>" name="pwd" class="form-control" id="pwd" placeholder="비밀번호 입력...">
	               	<label for="pwd">비밀번호</label>
	          	</div>
	      
	          	<div class="checkbox mb-3">
	              	<label>
	                 	<input type="checkbox" name="save" value="yes" checked> 로그인 정보 저장
	               	</label>
	          	</div>          
			<%} %>
          	<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
          	<p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
        </form>
   	</main>
</body>
</html>