<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	[ 자료실 기능 구현하기 ]
	1. Step02_DB project에 /file/upload_form.jsp, /file/upload.jsp를 참고하세요.
	2. file 삭제 링크는 file을 업로드한 사람과 로그인한 id가 같을 때만 작동하도록.
	3. paging 처리도 해보세요.
	4. 검색기능도 만들어보세요.
		검색 조건은 제목, 작성자, 제목+파일명
	5. 다운로드 기능도 만들어보세요.
		Step02_DB project에 /file/download.jsp 참고
	
--%>
<%
	String id=(String)session.getAttribute("id");
	
	String keyword=request.getParameter("keyword");
	String condition=request.getParameter("condition");

	if(keyword==null){
		keyword="";
		condition="";
	}
	
	// 특수기호를 encoding한 keyword를 미리 준비한다.
	String encodedK=URLEncoder.encode(keyword);



	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
	   //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
	   pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//CafeDto 객체에 startRowNum 과 endRowNum 을 담는다.
	FileDto dto=new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//CafeDao 객체의 참조값 얻어와서 
	//FileDao dao=FileDao.getInstance();
	//글목록 얻어오기 
	List<FileDto> list=null;
	int totalRow=0;
	if(!keyword.equals("")){
		if(condition.equals("title_filename")){
			dto.setTitle(keyword);
			dto.setOrgFileName(keyword);
			list=FileDao.getInstance().getListTF(dto);
			totalRow=FileDao.getInstance().getCountTF(dto);
		} else if(condition.equals("title")){
			dto.setTitle(keyword);
			list=FileDao.getInstance().getListT(dto);
			totalRow=FileDao.getInstance().getCountT(dto);
		} else if(condition.equals("writer")){
			dto.setWriter(keyword);
			list=FileDao.getInstance().getListW(dto);
			totalRow=FileDao.getInstance().getCountW(dto);
		}
	} else {
		list=FileDao.getInstance().getList(dto);
		totalRow=FileDao.getInstance().getCount();
	}
	
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	
	
	//전체 row 의 갯수 
	//int totalRow=dao.getCount();
	
	//전체 페이지의 갯수
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
	   endPageNum=totalPageCount; //보정해 준다.
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<style>
	.page-ui a{
		text-decoration: none;
		color: #000;
	}
	.page-ui a:hover{
		text-decoration: underline;
	}
	
	.page-ui a.active{
		color: red;
		font-weight: bold;
		text-decoration: underline;
	}
	
	.page-ui ul{
		list-style-type: none;
		padding: 0;
	}
	.page-ui li{
		float: left;
		padding: 10px;
	}
</style>
<jsp:include page="../include/resource.jsp"></jsp:include>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="thisPage"/>
</jsp:include>
</head>
<body>
	<div class="container">
		<a href="private/upload_form.jsp">업로드 하러가기</a>
		<a href="${pageContext.request.contextPath}/file/list.jsp">파일 목록 새로 고침</a>
		<a href="${pageContext.request.contextPath}/">home으로</a>
		<h1>자료실 목록입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자 (업로더)</th>
					<th>제목 (설명)</th>
					<th>파일 명 (원본 파일 명)</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>			
				<%for(FileDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td><%=tmp.getTitle() %></td>
						<td><a href="download.jsp?num=<%=tmp.getNum() %>&fileSize=<%=tmp.getFileSize()%>&orgFileName=<%=tmp.getOrgFileName()%>&saveFileName=<%=tmp.getSaveFileName()%>"><%=tmp.getOrgFileName() %></a></td>
						<td><%=tmp.getRegdate() %></td>
						<%if(tmp.getWriter().equals(id)){ %>
							<td><a id="deleteLink" href="private/delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
							<!-- 
							<a href="javascript:deleteConfirm(<%=tmp.getNum() %> %>%>)">삭제</a>
							 -->
						<%} %>
					</tr>
				<%} %>			
			</tbody>
		</table>
	</div>
	<div class="page-ui clearfix">
			<ul>
				<%-- 이전 묶음으로 옮기는 링크 만들기 --%>
				<%if(startPageNum>1){ %>
					<li>
						<a href="list.jsp?pageNum=<%=startPageNum-1%>">previous</a>
					</li>
				<%} %>
				<%-- page 옮기는 링크 만들기 --%>
				<%for(int i=startPageNum; i<=endPageNum; i++) {%>
					<%if(pageNum==i) {%>
						<li>
							<a class="active" href="list.jsp?pageNum=<%=i%>"><%=i %></a>
						</li>
					<%} else {%>
						<li>
							<a href="list.jsp?pageNum=<%=i%>"><%=i %></a>
						</li>
					<%} %>
				<%} %>
				
				<%-- 다음 묶음으로 옮기는 링크 만들기 --%>
				<%if(endPageNum<totalPageCount){%>
				<li>
					<a href="list.jsp?pageNum=<%=endPageNum+1%>">next</a>	
				</li>
				<%}%>
			</ul>		
		</div>
		<div style="clear:both;"></div>
		<form id="myForm" action="list.jsp?condition=<%=condition %>&keyword=<%=keyword %>" method="get">
			<div>
				<label for="condition">검색조건</label>
				<select name="condition" id="condition">
					<option id="title_filename" value="title_filename" <%=condition.equals("title_filename") ? "selected" : "" %>>제목+파일이름</option>
					<option id="title" value="title" <%=condition.equals("title") ? "selected" : "" %>>제목</option>
					<option id="writer" value="writer" <%=condition.equals("writer") ? "selected" : "" %>>작성자</option>
				</select>
			
				<label for="keyword"></label>
				<input type="text" name="keyword" id="keyword" placeholder="검색어..."/>
				<button type="submit">검색</button>
			</div>
		</form>
		<p><strong><%=totalRow %></strong> 개의 자료가 검색되었습니다.</p>
	<script>
		document.querySelector("#deleteLink").addEventListener("click", function(e){
			let check=confirm("정말로 이 file을 삭제하시겠습니까?");
			if(!check){
				e.preventDefault();
			}
		});
		
		document.querySelector("#myForm").addEventListener("submit", function(e){
			let keyword=document.querySelector("#keyword").value;
			if(keyword==""){
				e.preventDefault();
			}
		});
		/*
		function deleteConfirm(int num){
			const beDeleted=confirm(num+" 번 자료를 삭제하시겠습니까?");
			if(beDeleted){
				location.href="${pageContext.request.contextPath}/file/private/delete.jsp?num="+num;
			}
		}
		*/
	</script>
</body>
</html>