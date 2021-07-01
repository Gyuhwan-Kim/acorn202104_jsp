<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
 
	    // MemberDto 객체에 startRowNum 과 endRowNum을 담는다.
	    MemberDto dto=new MemberDto();
	    dto.setStartRowNum(startRowNum);
	    dto.setEndRowNum(endRowNum);
	    
    
    	// test로 Connection 객체의 참조값 얻어와보기
    	//Connection conn=new DbcpBean().getConn();
    	// MemberDao 객체의 참조값을 얻어와서
    	MemberDao dao=MemberDao.getInstance();
    	// 회원 목록 얻어오기
    	List<MemberDto> list=dao.getList(dto);
    	
    	//하단 시작 페이지 번호 
   	   	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
   	   	//하단 끝 페이지 번호
   	   	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;    	
    	
   	   	// 전체 row의 개수
   	   	int totalRow=dao.getCount();
   	   	
   	   	// 전체 page의 개수
   	   	int totalPage=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
    
    	// 끝 page 번호가 전체 page 개수보다 크면 잘못된 값임.
    	if(endPageNum > totalPage){
    		endPageNum=totalPage; // 보정해준다.
    	}
    %>
    
{
   "pageNum":<%=pageNum %>,
   "startPageNum":<%=startPageNum %>,
   "endPageNum":<%=endPageNum %>,
   "totalPageCount":<%=totalPage %>
}   
    
<%-- text/html
<%if(startPageNum>1){ %>
	<li>
		<a class="page-link" href="javascript:movePage(<%=startPageNum-1%>)">previous</a>
	</li>
<%} %>
--%>
<%-- 

<%-- page 옮기는 링크 만들기 --%>
<%-- 
<%for(int i=startPageNum; i<=endPageNum; i++) {%>
	<%if(pageNum==i) {%>
		<li class="page-item active">
			<a class="page-link" href="javascript:movePage(<%=i%>)"><%=i %></a>
		</li>
	<%} else {%>
		<li>
			<a class="page-link" href="javascript:movePage(<%=i%>)"><%=i %></a>
		</li>
	<%} %>
<%} %>
--%>

<%-- 다음 묶음으로 옮기는 링크 만들기 --%>
<%--
<%if(endPageNum<totalPage){%>
<li>
	<a class="page-link" href="javascript:movePage(<%=endPageNum+1%>)">next</a>	
</li>
<%}%>
--%>

