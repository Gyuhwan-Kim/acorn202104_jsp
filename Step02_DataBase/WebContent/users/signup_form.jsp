<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
	<div class="container form-check">
		<h1>회원가입 form 입니다.</h1>
		<form action="signup.jsp" method="post">
		    <div class="form-group">
			    <label class="form-label" for="nick">닉네임</label>
			    <input class="form-control" type="text" name="nick" id="nick" />
		    </div>
		    <br/>
		    
		    <fieldset>
			   	<legend>이메일 수신 여부</legend>
			    <div class="form-check form-check-inline">
				    <input class="form-check-input" type="radio" name="email" value="yes" id="email1" checked/>
					<label class="form-check-label" for="email1">네</label>	
				</div>
				<div class="form-check form-check-inline">    
			        <input class="form-check-input" type="radio" name="email" value="no" id="email2" />
			    	<label class="form-check-label" for="email2">아니오</label>		    
			    </div>
		    </fieldset>
		    <br/>
		    
		    <div class="form-group">
			    <label for="concern" class="form-label">관심사</label>
			    <select class="form-select" name="concern">
			    	<option value="">선택</option>
			        <option value="game">게임</option>
			        <option value="movie">영화</option>
			        <option value="etc">기타</option>
			    </select>		    
		    </div>
		    <br/>
		    <fieldset>
		    	<legend>배우고 싶은 언어 체크</legend>
		    	<div class="form-check form-check-inline">
		    		<input class="form-check-input" type="checkbox" name="language" id="lang1" value="Java"/>
		    		<label class="form-check-label" for="lang1">자바</label>
		    	</div>
		    	<div class="form-check form-check-inline">
		    		<input class="form-check-input" type="checkbox" name="language" id="lang2" value="Python"/>
		    		<label class="form-check-label" for="lang2">파이썬</label>
		    	</div>
		    	<div class="form-check form-check-inline">
		    		<input class="form-check-input" type="checkbox" name="language" id="lang3" value="C++"/>
		    		<label class="form-check-label" for="lang3">C++</label>
		    	</div>
		    </fieldset>
		    <br/>
		    
		    <div class="form-group">
		    	<label class="form-label" for="comment">남기고 싶은 말</label>
		    	<textarea class="form-control" name="comment" id="comment" cols="30" rows="10"></textarea>
		    </div>
		    <br/>
		    <button class="btn btn-primary" type="submit">가입</button>
		</form>		
	</div>
</body>
</html>