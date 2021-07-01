<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// thisPage 라는 parameter로 전달되는 문자열을 얻어온다
    	String thisPage=request.getParameter("thisPage");
    	// thisPage 가 null 이면 index.jsp 페이지에 포함된 것이다.
    	System.out.println(thisPage);
    	// 만일 null 이면
    	if(thisPage==null){
    		//빈 문자열을 대입한다.(NullPointerException 방지)
    		thisPage="";
    	}
    %>

	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath() %>/">
				<img src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24">
				Monkeystrap	    
	    	</a>
	    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
		      	<ul class="navbar-nav">
		      		<!-- 
		      		<%if(thisPage.equals("")){ %>
			        	<li class="nav-item">
			         		<a class="nav-link" href="<%=request.getContextPath() %>/member/list.jsp">Member</a>
			        	</li>
			        	<li class="nav-item">
			         		<a class="nav-link" href="<%=request.getContextPath() %>/todo/list.jsp">Todo</a>
			        	</li>		      		
		      		<%} else if(thisPage.equals("member")){ %>
			        	<li class="nav-item">
			         		<a class="nav-link active" href="<%=request.getContextPath() %>/member/list.jsp">Member</a>
			        	</li>
			        	<li class="nav-item">
			         		<a class="nav-link" href="<%=request.getContextPath() %>/todo/list.jsp">Todo</a>
			        	</li>		      		
		      		<%} else if(thisPage.equals("todo")){ %>
			        	<li class="nav-item">
			         		<a class="nav-link" href="<%=request.getContextPath() %>/member/list.jsp">Member</a>
			        	</li>
			        	<li class="nav-item">
			         		<a class="nav-link active" href="<%=request.getContextPath() %>/todo/list.jsp">Todo</a>
			        	</li>		      		
		      		<%} %>
		      		-->
		        	<li class="nav-item">
		         		<a class="nav-link <%=thisPage.equals("member") ? "active" : "" %>" href="<%=request.getContextPath() %>/member/list.jsp">Member</a>
		        	</li>
		        	<li class="nav-item">
		         		<a class="nav-link <%=thisPage.equals("member2") ? "active" : "" %>" href="<%=request.getContextPath() %>/member/list2.jsp">Member2</a>
		        	</li>
		        	<li class="nav-item">
		         		<a class="nav-link <%=thisPage.equals("todo") ? "active" : "" %>" href="<%=request.getContextPath() %>/todo/list.jsp">Todo</a>
		        	</li>			      		
		      	</ul>
		      	<div class="w-100">
			      	<a class="btn btn-danger btn-sm float-end ms-1" href="<%=request.getContextPath()%>/users/signup_form.jsp">회원가입</a>			      	
			    	<a class="btn btn-success btn-sm float-end" href="<%=request.getContextPath()%>/users/loginform.jsp">로그인</a>	      	
		      	</div>
		    </div>
	  	</div>
	</nav>