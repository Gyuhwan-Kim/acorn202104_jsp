<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<style>
	.invalid-feedback, .invalid-feedback2{
		display: none;
	}
</style>
<script src="../js/gura_util.js"></script>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<h1>회원 가입 form입니다.</h1>
		<form class="" action="signup.jsp" method="post" id="myForm">
			<div class="col-md-4">
				<label class="form-label" for="id">아이디</label>
				<input class="form-control is-invalid" type="text" name="id" id="id"/>
				<small>영문 소문자로 시작하고, 5~10 글자 이내로 입력하세요.</small>
				<div class="invalid-feedback1 valid-feedback invalid-feedback">사용할 수 없는 아이디입니다.</div>
			</div>
			<div class="col-md-4">
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control is-invalid" type="password" name="pwd" id="pwd"/>
				<small>5~10 글자 이내로 입력하세요.</small>
			</div>
			<div class="col-md-4">
				<label class="form-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control is-invalid" type="password" name="pwd2" id="pwd2"/>
				<div class="invalid-feedback2 valid-feedback invalid-feedback">비밀번호를 확인하세요</div>
			</div>
			<div class="col-md-4">
				<label class="form-label" for="email">이메일</label>
				<input class="form-control is-invalid" type="text" name="email" id="email"/>
				<div class="invalid-feedback3 valid-feedback invalid-feedback">이메일을 확인하세요</div>
			</div>
			<button class="btn btn-primary" type="submit">가입</button>
		</form>
	</div>
	<script>
		// id, pwd, email의 유효성 여부를 관리하는 variable 만들고 초기값 대입
		let beIdValid=false;
		let bePwdValid=false;
		let beEmailVaild=false;
	
		// blur에서 일단은 test를 위해 input으로
		// id를 입력했을 때(input) 실행할 함수 등록
		document.querySelector("#id").addEventListener("input", function(){
			// 1. 입력한 id value 읽어오기
			let inputId=document.querySelector("#id").value;
			// this.value;
			// 입력한 id를 검증할 정규 표현식
			const reg_id=/^[a-z].{4,9}$/;
			// 만일 입력한 id가 정규 표현식과 matching되지 않는다면
			if(!reg_id.test(inputId)){
				document.querySelector(".invalid-feedback1").style.display="block";
				beIdValid=false; // id가 매칭되지 않는다고 표시하고
				document.querySelector("#id").classList.replace("is-valid", "is-invalid");
				return; // 함수를 끝마친다.(ajax 전송 안되도록)
			}
			
			// 2. util에 있는 함수를 이용해서 ajax 요청하기
			ajaxPromise("../users/checkid.jsp", "get", {inputId:inputId})
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				// data는 {beExist:true} or {beExist:false} 형태의 object
				//{data.beExist ? document.querySelector(".invalid-feedback").style.display="block" 
				//		: document.querySelector(".invalid-feedback").style.display="none"}
				if(data.beExist){
					document.querySelector(".invalid-feedback1").style.display="block";
					document.querySelector("#id").classList.replace("is-valid", "is-invalid");
				} else {
					document.querySelector(".invalid-feedback1").style.display="none";
					beIdValid=true;
					document.querySelector("#id").classList.replace("is-invalid", "is-valid");
				}
			});
				// 존재한다면 사용할 수 없는 아이디라는 feedback을 보이게
				//document.querySelector(".invalid-feedback").style.display="block";
				// 존재하지 않는다면 feedback 숨기기
				//document.querySelector(".invalid-feedback").style.display="none";	
		});

		// 비밀번호를 확인하는 함수
		function checkPwd(){
			const pwd1=document.querySelector("#pwd").value;
			const pwd2=document.querySelector("#pwd2").value;
			
			// 최소 5글자 최대 10글자인지를 검증할 정규 표현식
			let reg_pwd=/^.{5,10}/;
			/* 수업 차 이렇게 나눠서 하셨지만 난 합침
			if(!reg_pwd){
				beValid=false;
				return;
			}
			*/
			
			if(pwd1==pwd2 && reg_pwd.test(pwd1)){
				document.querySelector(".invalid-feedback2").style.display="none";
				document.querySelector("#pwd").classList.replace("is-invalid", "is-valid");
				document.querySelector("#pwd2").classList.replace("is-invalid", "is-valid");
				bePwdValid=true;
			} else {
				document.querySelector(".invalid-feedback2").style.display="block";
				document.querySelector("#pwd").classList.replace("is-valid", "is-invalid");
				document.querySelector("#pwd2").classList.replace("is-valid", "is-invalid");
			}
		}
		
		// 비밀번호 입력란에 input event가 일어났을 때 실행할 함수 등록
		document.querySelector("#pwd").addEventListener("input", checkPwd);
		document.querySelector("#pwd2").addEventListener("input", checkPwd);

		// 이메일을 입력했을 때 실행할 함수 등록
		document.querySelector("#email").addEventListener("input", function(){
			// 1. 입력한 email을 읽어와서
			const inputEmail=this.value;
			// 2. email을 검증할 정규 표현식 객체를 만들어서
			const reg_email=/@/;
			// 3. 정규 표현식 matching 여부에 따라 분기하기
			if(reg_email.test(inputEmail)){ // 만일 matching 된다면
				document.querySelector(".invalid-feedback3").style.display="none";
				document.querySelector("#email").classList.replace("is-invalid", "is-valid");
				beEmailValid=true;
			} else {
				document.querySelector(".invalid-feedback3").style.display="block";
				document.querySelector("#email").classList.replace("is-valid", "is-invalid");
			}
		});
		
		// form에 submit event가 발생했을 때 실행할 함수 등록
		document.querySelector("#myForm").addEventListener("submit", function(e){
			/*
				입력한 id, pwd, email의 유효성 여부를 확인해서
				하나라도 유효하지 않으면 e.preventDefault();
				가 수행되도록 하여 form의 제출을 막아야 한다.
			*/
			// form 전체의 유효성 여부 알아내기
			let beFormValid= beIdValid && bePwdValid && beEmailValid;
			if(beFormValid==false){
				// form 전송 막기
				e.preventDefault();
				alert("아이디, 비밀번호 및 이메일을 확인하세요");
			}
		});
		
	</script>
</body>
</html>