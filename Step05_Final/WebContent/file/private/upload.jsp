<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session 정보 불러오기
	String writer=(String)session.getAttribute("id");
	
	// 업로드할 경로 불러오기
	String path=request.getServletContext().getRealPath("/upload");

	File file=new File(path);
	// 경로가 없으면 folder를 만든다.
	if(!file.exists()){
		file.mkdir();
	}

	// cos.jar 가 제공하는 method 사용
	MultipartRequest mr=new MultipartRequest(request,
			path, // file을 저장할 경로
			1024*1024*100, // 최대 upload size limit
			"utf-8", // file명이 한글일 경우 깨지지 않도록 encoding
			new DefaultFileRenamePolicy() // 동일한 file명이 있으면 자동으로 바꿔서 저장하도록
	);
	
	String title=mr.getParameter("title");
	File myfile=mr.getFile("myFile");
	long fileSize=myfile.length();
	String orgFileName=mr.getOriginalFileName("myFile");
	String saveFileName=mr.getFilesystemName("myFile");
	
	FileDto dto=new FileDto();
	dto.setTitle(title);
	dto.setWriter(writer);
	dto.setFileSize(fileSize);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	boolean beSuccess=FileDao.getInstance().insert(dto);
	//String regdate=dto.getRegdate();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>
	<%if(beSuccess){ %>
		<p>업로드 되었습니다.</p>
		<p>제목 : <strong><%=title %></strong></p>
		
		<p>파일 크기 : <strong><%=fileSize %></strong></p>
		<p>올린 파일 이름 : <strong><%=orgFileName %></strong></p>
		<p>저장된 파일 이름 : <strong><%=saveFileName %></strong></p>
		<p>file system에 저장된 경로 : <strong><%=path %></strong></p>
		
		<a href="${pageContext.request.contextPath}/file/list.jsp">자료실로 돌아가기</a>
	<%} else { %>
		<p>업로드에 실패하였습니다.</p>
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">다시 업로드 하기</a>
	<%} %>
</body>
</html>