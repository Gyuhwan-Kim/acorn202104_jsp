<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	// file을 upload 할 경로를 method를 통해서 얻어오기
	String path=request.getServletContext().getRealPath("/upload");
	// 경로 확인!
	System.out.println(path);
	// 만일 folder 가 만들어져있지 않다면 folder를 만든다.
	File file=new File(path);
	if(!file.exists()){
		file.mkdir();
	}
	// cos.jar 에서 제공해주는 MultipartRequest 객체 생성하기
	MultipartRequest mr=new MultipartRequest(request, //HttpServletRequest
			path, // file을 저장할 경로
			1024*1024*100, // 최대 upload size limit
			"utf-8", // file명이 한글일 경우 깨지지 않도록 encoding
			new DefaultFileRenamePolicy()); // 동일한 file명이 있으면 자동으로 바꿔서 저장하도록
	
	// MultipartRequest 객체가 성공적으로 생성되면 file upload가 성공한 것이다.
	// 전송된 문자열과 file의 정보는 mr 객체의 method를 통해서 얻어낼 수 있다.

	// data.append("image", this.files[0]); 을 통해서 upload된 file을 access 할 수 있는 File 객체
	File myFile=mr.getFile("image");
	// file size(byte)
	long fileSize=myFile.length();
	// 원본 file명
	String orgFileName=mr.getOriginalFileName("image");
	/*
		file system에 저장된 file명
		- upload folder 안에 동일한 이름의 file이 없으면 원본 file명과 동일하게 저장
		- upload folder 안에 동일한 이름의 file이 있으면 file명 뒤에 1, 2, 3... 숫자를 자동으로 부여해서 저장한다.
		  ex) image.jpg image1.jpg image2,jpg...
	*/
	String saveFileName=mr.getFilesystemName("image");
	
	
%>
{"saveFileName":"<%=saveFileName%>"}