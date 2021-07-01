<%@page import="test.fine.dao.FineDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String beChecked=request.getParameter("beChecked");
	boolean beAdded=false;
	int newCount=Integer.parseInt(request.getParameter("viewCount"));
	
	if(beChecked.equals("false")){
		beAdded=FineDao.getInstance().addUpCount(num);
		newCount=FineDao.getInstance().getData(num).getUpCount();
		beChecked="true";
	}
%>
{"beAdded":"<%=beAdded %>", "newCount":<%=newCount %>, "beChecked":<%=beChecked%>}
