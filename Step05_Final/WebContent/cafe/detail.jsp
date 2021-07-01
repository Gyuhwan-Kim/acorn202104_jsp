<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeCommentDao"%>
<%@page import="test.cafe.dto.CafeCommentDto"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 저장된 id 읽어오기
	// (로그인을 하지 않았다면 null이다)
	String id=(String)session.getAttribute("id");
	// 로그인 여부
	boolean beLogin=false;
	if(id!=null){
		beLogin=true;
	}

	// 자세히 보여줄 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));

	/*
		[ 댓글 paging 처리에 관련된 logic ]
	*/
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=10;
	
	/*
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	*/
	
	// detail.jsp 에서는 항상 1page의 댓글 내용만 출력한다.
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	
	/*
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
	   //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
	   pageNum=Integer.parseInt(strPageNum);
	}
	*/
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;	

	/*
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	*/
	
	// 원글의 글번호를 이용해서 댓글 전체의 개수를 얻어낸다.
	int totalRow=CafeCommentDao.getInstance().getCount(num);
	
	//전체 페이지의 갯수
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
	
	/*
	if(endPageNum > totalPageCount){
	   endPageNum=totalPageCount; //보정해 준다.
	}
	*/
	
	// 조회수 올리기
	CafeDao.getInstance().addViewCount(num);
 	
 	// 원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
 	CafeCommentDto commentDto=new CafeCommentDto();
 	commentDto.setRef_group(num);
 	
 	// 1페이지에 해당하는 startRowNum과 endRowNum을 dto에 담아서
 	commentDto.setStartRowNum(startRowNum);
 	commentDto.setEndRowNum(endRowNum);
 	
 	
 	
 	List<CafeCommentDto> commentList
 		=CafeCommentDao.getInstance().getList(commentDto);
 	
 	/*
	[ 검색 키워드에 관련된 처리 ]
	-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.      
	*/
	String keyword=request.getParameter("keyword");
	String condition=request.getParameter("condition");
	//System.out.println("keyword="+keyword);
	//System.out.println("condition="+condition);
	
	//만일 키워드가 넘어오지 않는다면 
	if(keyword==null){
	//키워드와 검색 조건에 빈 문자열을 넣어준다. 
	//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
	keyword="";
	condition=""; 
	}	
	
	// CafeDto 객체를 생성해서
	CafeDto dto=new CafeDto();
	// 자세히 보여줄 글 번호를 넣어준다.
	dto.setNum(num);
	
	//만일 검색 키워드가 넘어온다면 
	if(!keyword.equals("")){
	   	//검색 조건이 무엇이냐에 따라 분기 하기
	   	if(condition.equals("title_content")){//제목 + 내용 검색인 경우
	      	//검색 키워드를 CafeDto 에 담아서 전달한다.
	      	dto.setTitle(keyword);
	      	dto.setContent(keyword);
	      	dto=CafeDao.getInstance().getDataTC(dto);
	      
	   	}else if(condition.equals("title")){ //제목 검색인 경우
	      	dto.setTitle(keyword);
	    	dto=CafeDao.getInstance().getDataT(dto);  
	   	
	   	}else if(condition.equals("writer")){ //작성자 검색인 경우
	      	dto.setWriter(keyword);
	   		dto=CafeDao.getInstance().getDataW(dto);
	      
	   	} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
	}else{//검색 키워드가 넘어오지 않는다면
		dto=CafeDao.getInstance().getData(dto);
	} 	
	
	// 특수 기호를 encoding한 keyword를 미리 준비한다.
	String encodedK=URLEncoder.encode(keyword); 	
 	
 	
 	
	// 글 하나의 정보를 DB에서 불러온다.
	//CafeDto dto=CafeDao.getInstance().getData(num);
	
	// 글 정보를 응답한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
/>
<style>
	.content{
		border: 1px dotted gray;
	}
	
	/* 댓글 프로필 이미지를 작은 원형으로 만든다. */
	.profile-image{
		 width: 50px;
		 height: 50px;
		 border: 1px solid #cecece;
		 border-radius: 50%;
	 }
	/* ul 요소의 기본 스타일 제거 */
   	.comments ul{
      	padding: 0;
      	margin: 0;
      	list-style-type: none;
   	}
	.comments dt{
	   	margin-top: 5px;
	}
	.comments dd{
	   	margin-left: 50px;
	}
	.comment-form textarea, .comment-form button{
	   	float: left;
	}
	.comments li{
	   	clear: left;
	}
	.comments ul li{
	   	border-top: 1px solid #888;
	}
	.comment-form textarea{
	   	width: 84%;
	   	height: 100px;
	}
	.comment-form button{
	   	width: 14%;
	   	height: 100px;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
	.comments .comment-form{
	   	display: none;
	}
	/* .reply_icon 을 li 요소를 기준으로 배치 하기 */
	.comments li{
	   	position: relative;
	}
	.comments .reply-icon{
	   	position: absolute;
	   	top: 1em;
	   	left: 1em;
	   	color: red;
	}
	pre {
		display: block;
		padding: 9.5px;
		margin: 0 0 10px;
		font-size: 13px;
		line-height: 1.42857143;
		color: #333333;
		word-break: break-all;
		word-wrap: break-word;
		background-color: #f5f5f5;
		border: 1px solid #ccc;
		border-radius: 4px;
	}
	.loader{
		/* loading img를 가운데 정렬*/
		text-align: center;
		/* 일단 숨겨 */
		display: none;
	}
	.loader svg{
		animation: rotateAni 1s linear infinite;
	}	 	
	@keyframes rotateAni{
		0%{
			transform: rotate(0deg);
		}
		100%{
			transform: rotate(360deg);
		}
	}
</style>
</head>
<body>
	<div class="container">
		<%if(dto.getPrevNum()!=0){ %>
			<a href="detail.jsp?num=<%=dto.getPrevNum() %>&keyword=<%=encodedK %>&condition=<%=condition%>">이전 글</a>
		<%} %>
		<%if(dto.getNextNum()!=0){ %>
			<a href="detail.jsp?num=<%=dto.getNextNum() %>&keyword=<%=encodedK %>&condition=<%=condition%>">다음 글</a>
		<%} %>
		<%if(!keyword.equals("")){ %>
			<p>
				<strong><%=condition %></strong> 조건,
				<strong><%=keyword %></strong> 검색어로 검색된 내용 자세히 보기
			</p>
		<%} %>
		<table>
			<tr>
				<th>글 번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<!--
					<textarea><%=dto.getContent() %></textarea>
					-->
					<div class="content"><%=dto.getContent() %></div>
				</td>
			</tr>
		</table>
		<ul>
			<li><a href="list.jsp">목록 보기</a></li>
			<%if(dto.getWriter().equals(id)){ %>
				<li><a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a></li>
				<li><a href="private/delete.jsp?num=<%=dto.getNum()%>">삭제</a></li>
			<%} %>
		</ul>
		<!-- 댓글 목록 -->
		<div class="comments">
			<ul>
				<%for(CafeCommentDto tmp:commentList){ %>
					<%if(tmp.getDeleted().equals("yes")){ %>
						<li>삭제된 댓글입니다.</li>
					<%
						// continue; 아래의 코드를 수행하지 않고 for문으로 실행 순서를 다시 보내기
						continue;
					}%>
					
					<%if(tmp.getNum()==tmp.getComment_group()){ %>
						<li id="reli<%=tmp.getNum()%>">
					<%} else { %>
						<li id="reli<%=tmp.getNum() %>" style="padding-left:50px;">
						<svg class="reply-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
						</svg>
					<%} %>
						<dl>
							<dt>프로필 이미지, 작성자 아이디, 수정, 삭제 표시를 할 예정</dt>
							<dt>
							<%if(tmp.getProfile()==null){ %>
								<svg class="profile-image" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                          			<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                          			<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                     			</svg>
							<%} else {%>
								<img class="profile-image" src="${pageContext.request.contextPath}<%=tmp.getProfile()%>"/>
							<%} %>
								<span><%=tmp.getWriter() %></span>
								<%if(tmp.getNum()!=tmp.getComment_group()){ %>
									@<i><%=tmp.getTarget_id() %></i>
								<%} %>
								<span><%=tmp.getRegdate() %></span>
								<a data-num="<%=tmp.getNum() %>" href="javascript:" class="reply-link">답글</a>
							<%if(id!=null && tmp.getWriter().equals(id)){ %>
								<a data-num="<%=tmp.getNum() %>" class="update-link" href="javascript:">수정</a>
								<a data-num="<%=tmp.getNum() %>" class="delete-link" href="javascript:">삭제</a>
							<%} %>
							</dt>
							<dd>
								<pre id="pre<%=tmp.getNum()%>"><%=tmp.getContent() %></pre>
							</dd>
						</dl>
						<form id="reForm<%=tmp.getNum() %>" class="animate__animated comment-form re-insert-form" 
                        	action="private/comment_insert.jsp" method="post">
                        	<input type="hidden" name="ref_group"
                           		value="<%=dto.getNum()%>"/>
                        	<input type="hidden" name="target_id"
                           		value="<%=tmp.getWriter()%>"/>
                        	<input type="hidden" name="comment_group"
                           		value="<%=tmp.getComment_group()%>"/>
                        	<textarea name="content"></textarea>
                        	<button type="submit">등록</button>
                     	</form>
                     	<%if(tmp.getWriter().equals(id)){ %>
                 			<form id="updateForm<%=tmp.getNum() %>" class="comment-form update-form" action="private/comment_update.jsp" method="post">
                 				<input type="hidden" name="num" value="<%=tmp.getNum()%>"/>
                 				<textarea name="content" id=""><%=tmp.getContent() %></textarea>
                 				<button type="submit">수정</button>
                 			</form>
                     	<%} %>
					</li>
				<%} %>
			</ul>
		</div>
		<div class="loader">
			<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
  				<path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
			</svg>
		</div>
		<!-- 원글에 댓글을 작성할 form -->
		<form class="comment-form insert-form" action="private/comment_insert.jsp" method="post">
			<!-- 원 글의 글번호가 댓글의 ref_group 번호 -->
			<input type="hidden" name="ref_group" value="<%=num %>"/>
			<!-- 원 글의 작성자가 댓글의 대상자 -->
			<input type="hidden" name="target_id" value="<%=dto.getWriter() %>"/>
			<%if(!beLogin){ %>
			<%} %>
			<textarea name="content" id=""><%if(!beLogin){ %>로그인이 필요합니다.<%} %></textarea>
			
			<button type="submit">등록</button>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
		// client가 login 했는지 여부
		let beLogin=<%=beLogin%>;
		
		document.querySelector(".insert-form").addEventListener("submit", function(e){
			// 만일 login 하지 않았으면
			if(!beLogin){
				// form 전송을 막고
				e.preventDefault();
				// login form으로 이동시킨다.
				location.href="${pageContext.request.contextPath}/users/loginform.jsp?url=${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=num%>";
			}
		})
	
		
		addUpdateFormListener(".update-form");
		addUpdateListener(".update-link");
		addDeleteListener(".delete-link");
		addReplyListener(".reply-link");
		
		/*
		// 댓글 링크의 참조값을 배열에 담아오기
		let replyLinks=document.querySelectorAll(".reply-link");
		// 반복문 돌면서 모든 링크에 event listener 등록하기
		for(let i=0; i<replyLinks.length; i++){
			replyLinks[i].addEventListener("click", function(){
				// event가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다.
				const num=this.getAttribute("data-num"); // 댓글의 글번호
				const form=document.querySelector("#reForm"+num);
				
				//	[hint]
					
				//	let current=this.innerText;
				//	if(current=="답글"){
						
				//	} else if(current=="취소")				
				
				let text=this.innerText;
				if(text=="답글"){
					// 번호를 이용해서 대댓글 form을 선택해서 보이게 한다.
					form.style.display="block";
					this.innerText="취소";
					form.classList.add("animate__fadeIn");
					form.addEventListener("animationend", function(){
						this.classList.remove("animate__fadeIn");
					}, {once:true});
				} else if(text=="취소"){
					//form.style.display="none";
					this.innerText="답글";
					form.classList.add("animate__fadeOut");
					form.addEventListener("animationend", function(){
						this.classList.remove("animate__fadeOut");
						this.style.display="none";
					}, {once:true});
				}
			
			});
		}
		
		// 댓글 삭제 링크의 참조값을 배열에 담아오기
		let deleteLinks=document.querySelectorAll(".delete-link");
		for(let i=0; i<deleteLinks.length; i++){
			deleteLinks[i].addEventListener("click", function(){
				// click event가 일어난 바로 그 요소의 data-num 속성의 value를 읽어온다.
				const num=this.getAttribute("data-num"); // 댓글의 글 번호
				const beDeleted=confirm("정말 이 댓글을 삭제하시겠습니까?");
				if(beDeleted){
					// gura_util.js에 있는 함수를 이용해서 ajax 요청
					ajaxPromise("private/comment_delete.jsp", "post", "num="+num)
					.then(function(response){
						return response.json();
					}).then(function(data){
						console.log(data);
						if(data.beDeleted){
							// 댓글이 있는 곳에 삭제된 댓글임을 표시함
							document.querySelector("#reli"+num).innerText="삭제된 댓글입니다.";
						}
					});
				}
			});
		}
		
		// 댓글 수정 링크의 참조값을 배열에 담아오기
		let updateLinks=document.querySelectorAll(".update-link");
		for(let i=0; i<updateLinks.length; i++){
			updateLinks[i].addEventListener("click", function(){
				// click event가 일어난 바로 그 요소의 data-num 속성의 value를 읽어온다.
				const num=this.getAttribute("data-num"); // 댓글의 글 번호
				document.querySelector("#updateForm"+num).style.display="block";
			});
		}
		
		// 댓글 수정 form의 참조값을 배열에 담아오기
		let updateForms=document.querySelectorAll(".update-form");
		for(let i=0; i<updateForms.length; i++){
			// form에 submit event가 일어났을 때 호출되는 함수 등록
			updateForms[i].addEventListener("submit", function(e){
				//submit 이벤트가 일어난 form 의 참조값을 form 이라는 변수에 담기 
		        const form=this;
				
				// form 제출 막기
				e.preventDefault();
				
				// event가 일어난 form을 ajax 전송하도록 한다.
				ajaxFormPromise(form)
				.then(function(response){
					return response.json();
				}).then(function(data){
					if(data.beSuccess){
						
						//	document.querySelector() 는 html 문서 전체에서 특정 요소의 참조값을 찾는 기능
						//	특정문서의 참조값.querySelector() 는 해당 문서 객체의 자손 요소 중에서
                  		//	특정 요소의 참조값을 찾는 기능
						
						const num=form.querySelector("input[name=num]").value;
						const content=form.querySelector("textarea[name=content]").value;
						// 수정 form에 입력한 value를 pre 요소에도 출력하기
						document.querySelector("#pre"+num).innerText=content;
						form.style.display="none";
					}
				});
			});
		}
		*/
		// 댓글의 현재 page를 관리할 variable을 만들고 초기값 1 대입하기
		let currentPage=1;
		
		// 마지막 page는 totalPageCount이다.
		let lastPage=<%=totalPageCount%>;
		
		// 추가로 댓글을 요청하고 그 작업이 끝났는지 여부를 관리할 변수
		let beLoading=false; // 현재 loading 중인지 여부
		
		window.addEventListener("scroll", function(){			
			// 바닥까지 scroll 했는지의 여부
			const beBottom=
				window.innerHeight+window.scrollY >= document.body.offsetHeight;
			
			// 현재 page가 마지막 page인지 여부
			let beLast= currentPage==lastPage;
				
			// 현재 바닥까지 scroll 했고, loading 중이 아니고 현재 page가 마지막이 아니라면
			if(beBottom && !beLoading && !beLast){
				// loading bar 띄우기
				document.querySelector(".loader").style.display="block";
				
				// loading 중이라고 표시
				beLoading=true;
				
				// 현재 댓글 page를 1증가시키고
				currentPage++;
				/* 해당 page의 내용을 ajax 요청을 통해서 받아온다.
					"pageNum=xxx&num=xxx" 형식으로 get 방식 parameter를 전달한다.
				*/
				ajaxPromise("ajax_comment_list.jsp", "get",
						"pageNum="+currentPage+"&num=<%=num%>")
				.then(function(response){
					// json이 아닌 html 문자열을 응답받을 것
					return response.text();
				}).then(function(data){
					// data는 html 형식의 문자열이다.
					console.log(data);
					// beforebegin | afterbegin | beforeend | afterend
					document.querySelector(".comments ul").insertAdjacentHTML("beforeend", data);
					// loading이 끝났다고 표시
					beLoading=false;
					
					// 새로 추가된 댓글 li 요소 안에 있는 a 요소를 찾아서 event listener를 등록하기
					addUpdateListener(".page-"+currentPage+" .update-link");
					addDeleteListener(".page-"+currentPage+" .delete-link");
					addReplyListener(".page-"+currentPage+" .reply-link");
					//addUpdateListener(`.page-\${currentPage} .update-link`);
					//addDeleteListener(`.page-\${currentPage} .delete-link`);
					//addReplyListener(`.page-\${currentPage} .reply-link`);
					
					// 새로 추가된 댓글 li 요소 안에 있는 댓글 수정 form에 event listener 등록
					addUpdateFormListener(".page-"+currentPage+" .update-form")
				
					// loading bar 숨기기
					document.querySelector(".loader").style.display="none";
				});
			}
		});
		
		// 인자로 전달되는 선택자를 이용해서 event listener를 등록하는 function
		// 추가되는 댓글에만 listener를 등록
		function addUpdateListener(sel){
			// 댓글 수정 링크의 참조값을 배열에 담아오기
			// sel은 ".page-xxx .update-link" 형식의 내용이다.
			let updateLinks=document.querySelectorAll(sel);
			for(let i=0; i<updateLinks.length; i++){
				updateLinks[i].addEventListener("click", function(){
					// click event가 일어난 바로 그 요소의 data-num 속성의 value를 읽어온다.
					const num=this.getAttribute("data-num"); // 댓글의 글 번호
					document.querySelector("#updateForm"+num).style.display="block";
				});
			}
		}
		
		function addDeleteListener(sel){
			// 댓글 삭제 링크의 참조값을 배열에 담아오기
			let deleteLinks=document.querySelectorAll(sel);
			for(let i=0; i<deleteLinks.length; i++){
				deleteLinks[i].addEventListener("click", function(){
					// click event가 일어난 바로 그 요소의 data-num 속성의 value를 읽어온다.
					const num=this.getAttribute("data-num"); // 댓글의 글 번호
					const beDeleted=confirm("정말 이 댓글을 삭제하시겠습니까?");
					if(beDeleted){
						// gura_util.js에 있는 함수를 이용해서 ajax 요청
						ajaxPromise("private/comment_delete.jsp", "post", "num="+num)
						.then(function(response){
							return response.json();
						}).then(function(data){
							console.log(data);
							if(data.beDeleted){
								// 댓글이 있는 곳에 삭제된 댓글임을 표시함
								document.querySelector("#reli"+num).innerText="삭제된 댓글입니다.";
							}
						});
					}
				});
			}		
		}
			
		function addReplyListener(sel){
			// 댓글 링크의 참조값을 배열에 담아오기
			let replyLinks=document.querySelectorAll(sel);
			// 반복문 돌면서 모든 링크에 event listener 등록하기
			for(let i=0; i<replyLinks.length; i++){
				replyLinks[i].addEventListener("click", function(){
					
					if(!beLogin){
						const beMove=confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
						if(beMove){
							location.href="${pageContext.request.contextPath}/users/loginform.jsp?url=${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=num%>";
						}
						return;
					}
					
					
					// event가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다.
					const num=this.getAttribute("data-num"); // 댓글의 글번호
					const form=document.querySelector("#reForm"+num);
					/*
						[hint]
						
						let current=this.innerText;
						if(current=="답글"){
							
						} else if(current=="취소")				
					*/
					let text=this.innerText;
					if(text=="답글"){
						// 번호를 이용해서 대댓글 form을 선택해서 보이게 한다.
						form.style.display="block";
						this.innerText="취소";
						form.classList.add("animate__fadeIn");
						form.addEventListener("animationend", function(){
							this.classList.remove("animate__fadeIn");
						}, {once:true});
					} else if(text=="취소"){
						//form.style.display="none";
						this.innerText="답글";
						form.classList.add("animate__fadeOut");
						form.addEventListener("animationend", function(){
							this.classList.remove("animate__fadeOut");
							this.style.display="none";
						}, {once:true});
					}
				
				});
			}
		}
		
		function addUpdateFormListener(sel){
			// 댓글 수정 form의 참조값을 배열에 담아오기
			let updateForms=document.querySelectorAll(sel);
			for(let i=0; i<updateForms.length; i++){
				// form에 submit event가 일어났을 때 호출되는 함수 등록
				updateForms[i].addEventListener("submit", function(e){
					//submit 이벤트가 일어난 form 의 참조값을 form 이라는 변수에 담기 
			        const form=this;
					
					// form 제출 막기
					e.preventDefault();
					
					// event가 일어난 form을 ajax 전송하도록 한다.
					ajaxFormPromise(form)
					.then(function(response){
						return response.json();
					}).then(function(data){
						if(data.beSuccess){
							/*
								document.querySelector() 는 html 문서 전체에서 특정 요소의 참조값을 찾는 기능
								특정문서의 참조값.querySelector() 는 해당 문서 객체의 자손 요소 중에서
	                  			특정 요소의 참조값을 찾는 기능
							*/
							const num=form.querySelector("input[name=num]").value;
							const content=form.querySelector("textarea[name=content]").value;
							// 수정 form에 입력한 value를 pre 요소에도 출력하기
							document.querySelector("#pre"+num).innerText=content;
							form.style.display="none";
						}
					});
				});
			}
		}
	</script>
</body>
</html>