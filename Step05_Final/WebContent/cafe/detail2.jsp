<%@page import="test.fine.dto.FineDto"%>
<%@page import="test.fine.dao.FineDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int num=Integer.parseInt(request.getParameter("num"));
	String id=(String)session.getAttribute("id");
	
	FineDao.getInstance().addViewCount(num);
	
	FineDto dto=FineDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail2.jsp</title>
<script src="../js/gura_util.js"></script>
</head>
<body>
	<div class="container">
		<h1>글 내용</h1>
		<table>
			<tr>
				<th>번호</th>
				<td><%=num %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount()%></td>
			</tr>
			<tr>
				<th>추천수</th>
				<td id="add"><%=dto.getUpCount()%></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=dto.getRegdate()%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea><%=dto.getContent()%></textarea>
				</td>
			</tr>
		</table>
		<form action="ajax_upcount.jsp?num=<%=num %>" method="post" id="upCountForm">
			<button type="submit">추천하기</button>
			<input type="hidden" id="beChecked" name="beChecked" value="false"/>
			<input type="hidden" id="viewCount" name="viewCount" value="<%=dto.getViewCount()%>"/>
		</form>
		<ul>
			<li><a href="${pageContext.request.contextPath}/cafe/list2.jsp">글 목록</a></li>
			<%if(dto.getWriter().equals(id)){ %>
				<li><a href="${pageContext.request.contextPath}/cafe/private/updateform2.jsp?num=<%=num%>">수정</a></li>
				<li><a href="${pageContext.request.contextPath}/cafe/private/delete2.jsp?num=<%=num%>">삭제</a></li>
			<%} %>
		</ul>
	</div>
	<script>
		document.querySelector("#upCountForm").addEventListener("submit", function(e){
			e.preventDefault();
			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			}).then(function(data){
				if(document.querySelector("#beChecked").value=="false"){
					alert("이 게시물을 추천하였습니다.");
				} else {
					alert("더 이상 추천할 수 없습니다.");
				}
				document.querySelector("#add").replaceWith(data.newCount);
				document.querySelector("#beChecked").value=(data.beChecked);
			});
		});
	</script>
</body>
</html>