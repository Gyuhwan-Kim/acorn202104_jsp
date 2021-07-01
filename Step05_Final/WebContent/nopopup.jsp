<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// bePopup이라는 parameter로 넘어오는 값이 있는지 읽어본다.
	String bePopup=request.getParameter("bePopup");
	// 만약 null이 아니라면 pop-up을 띄우지 않겠다고 체크한 것
	if(bePopup!=null){
		// pop-up을 일정 시간동안 띄우지 않겠다는 정보를 쿠키에 저장
		Cookie cook=new Cookie("bePopup", bePopup);
		cook.setMaxAge(60); // 초 단위
		// 응답할 때 쿠키도 함께 응답한다.
		response.addCookie(cook);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/nopopup.jsp</title>
</head>
<body>
	nopopup.jsp 페이지
	<script>
		// 팝업 창 닫기
		self.close();
	</script>
</body>
</html>