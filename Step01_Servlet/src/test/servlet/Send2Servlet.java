package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test/send2")
public class Send2Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.service(req, resp);
		
		//문자열을 추출하기 전에 한글이 깨지지 않도록 encoding 설정
		req.setCharacterEncoding("uft-8");
		
		// client가 전송한 문자열 추출하기
		String str=req.getParameter("msg");
		System.out.println("전송된 문자열 : "+str);
		
		PrintWriter pw=resp.getWriter();
		pw.println("okay");
		pw.close();
	}
}
