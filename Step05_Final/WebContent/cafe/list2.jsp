<%@page import="test.fine.dao.FineDao"%>
<%@page import="java.util.List"%>
<%@page import="test.fine.dto.FineDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
	FineDto dto=new FineDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//CafeDao 객체의 참조값 얻어와서 
	FineDao dao=FineDao.getInstance();
	//글목록 얻어오기 
	List<FineDto> list=dao.getList(dto);
	List<FineDto> list2=dao.upList(dto);
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	
	//전체 row 의 갯수 
	int totalRow=dao.getCount();
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
<title>/cafe/list2.jsp</title>
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
	<jsp:param value="cafe2" name="thisPage"/>
</jsp:include>
</head>
<body>
	<div class="container">
		<h1>예쁜 말을 남겨봅시다.</h1>
		<a href="${pageContext.request.contextPath}/cafe/private/insertform2.jsp">새 글 작성하기</a>
		<a href="${pageContext.request.contextPath}/index.jsp">index로 가기</a>
		<h2>베슽흐 Fㅏ이브</h2>
		<table>
			<thead>
				<tr>
					<th>베슽흐</th>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%int range= (list2.size()>=5 ? 5 : list2.size());%>
				<%for(int i=0; i<range; i++){ %>
					<tr>
						<td><%=i+1 %>등!</td>
						<td><%=list2.get(i).getNum() %></td>
						<td><%=list2.get(i).getWriter() %></td>
						<td><%=list2.get(i).getTitle() %></td>
						<td><%=list2.get(i).getViewCount() %></td>
						<td><%=list2.get(i).getUpCount() %></td>
						<td><%=list2.get(i).getRegdate() %></td>
					</tr>
				<%} %>

			</tbody>
		</table>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>추천수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for(FineDto tmp:list) {%>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td>
							<a href="${pageContext.request.contextPath}/cafe/detail2.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a>
						</td>
						<td><%=tmp.getViewCount() %></td>
						<td><%=tmp.getUpCount() %></td>
						<td><%=tmp.getRegdate() %></td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<div class="page-ui clearfix">
			<ul>
				<%-- 이전 묶음으로 옮기는 링크 만들기 --%>
				<%if(startPageNum>1){ %>
					<li>
						<a href="list2.jsp?pageNum=<%=startPageNum-1%>">previous</a>
					</li>
				<%} %>
				<%-- page 옮기는 링크 만들기 --%>
				<%for(int i=startPageNum; i<=endPageNum; i++) {%>
					<%if(pageNum==i) {%>
						<li>
							<a class="active" href="list2.jsp?pageNum=<%=i%>"><%=i %></a>
						</li>
					<%} else {%>
						<li>
							<a href="list2.jsp?pageNum=<%=i%>"><%=i %></a>
						</li>
					<%} %>
				<%} %>
				
				<%-- 다음 묶음으로 옮기는 링크 만들기 --%>
				<%if(endPageNum<totalPageCount){%>
				<li>
					<a href="list2.jsp?pageNum=<%=endPageNum+1%>">next</a>	
				</li>
				<%}%>
			</ul>		
		</div>
	</div>
</body>
</html>