<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글이 깨지지 않도록
	request.setCharacterEncoding("utf-8");

	// input type="text" name="nick" 에 입력한 문자열 읽어오기
	String nick=request.getParameter("nick");
	
	/*
    <label>
		<input type="radio" name="email" value="yes" checked/> 네
	</label>
	<label>
	    <input type="radio" name="email" value="no" /> 아니요
	</label>
	*/
	String email=request.getParameter("email");
	
	/*
    <select name="concern">
    	<option value="">선택</option>
        <option value="game">게임</option>
        <option value="movie">영화</option>
        <option value="etc">기타</option>
    </select>	
	*/
	String concern=request.getParameter("concern");
	
	/*
    <label>
    	<input type="checkbox" name="language" value="Java"/> 자바
    </label>
    <label>
        <input type="checkbox" name="language" value="Python"/> 파이선
    </label>
    <label>
        <input type="checkbox" name="language" value="C++"/> C++
    </label>	
	*/
	String language[]=request.getParameterValues("language");

	/*
	<textarea name="comment" cols="30" rows="10"></textarea>
	*/
	String comment=request.getParameter("comment");

	System.out.println("nick : "+nick);
	System.out.println("email : "+email);
	System.out.println("concern : "+concern);

	// DB에서 불러온 data라고 가정하자
	String data="";
	if(language != null){
		System.out.println("language.length : "+language.length);
		for(String tmp:language){
			System.out.println(tmp);
			data=data+tmp+"/";
		}		
	}

	System.out.println("comment : "+comment);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
	<p>가입되었습니다</p>
	<h1>가입된 정보</h1>

	        닉네임 <input type="text" name="nick" value="<%=nick %>" /><br/>
	        이메일 수신 여부
	    <label>
	    	<input type="radio" name="email" value="yes" <%=email.equals("yes") ? "checked" : "" %>/> 네
	    </label>
    	<label>
        	<input type="radio" name="email" value="no" <%=email.equals("no") ? "checked" : "" %>/> 아니요
    	</label>	    
	    <br/>
	        관심사 
	    <select name="concern">
	    	<option value="game" <%=concern.equals("game") ? "selected" : "" %>>게임</option>
	    	<option value="movie" <%=concern.equals("movie") ? "selected" : "" %>>영화</option>
	    	<option value="etc" <%if(concern.equals("etc")){%>selected<%} %>>기타</option>
	    </select>
	    <br/>
	    
	        배우고 싶은 언어 체크
	    <label>
	    	<input type="checkbox" name="language" value="Java" <%=data.contains("Java")? "checked" : "" %>/> 자바
	    </label>	    	
	    <label>
	    	<input type="checkbox" name="language" value="Python" <%=data.contains("Python")? "checked" : "" %>/> 파이썬
	    </label>
	    <label>
	    	<input type="checkbox" name="language" value="C++" <%=data.contains("C++")? "checked" : "" %>/> C++
	    </label>
	    <br/>
	    
	        남기고 싶은 말
	    <textarea name="comment" cols="30" rows="10"><%=comment%></textarea>
	    <br/>
	    <button type="submit">가입</button>

</body>
</html>