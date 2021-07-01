package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 *  /hello 요청에 대해 응답을 할 서블릿 정의하기
 *  
 *  1. HttpServlet 클래스를 상속받는다.
 *  2. service() 메소드를 오버라이드 한다.
 *  3. 어떤 요청을 처리할 지 어노테이션(@WebServlet)을 클래스 위에 작성한다.
*/

@WebServlet("/hello")
public class HelloServlet extends HttpServlet{
	
	// 테스트용 생성자
	public HelloServlet() {
		System.out.println("HelloServlet 생성자 호출됨");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.service(req, resp); // 얘는 지워도 갠춘
		
		// 한글이 깨지지 않도록
		resp.setCharacterEncoding("utf-8");
		// client에게 내가 뭘 응답할지 미리 알리는 역할
		resp.setContentType("text/html;charset=utf-8");
		
		// 클라이언트에게 문자열을 출력할 수 있는 객체의 참조값 얻어오기
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>hello page</title>");
		pw.println("</head>");
		pw.println("<body>");
		for(int i=0; i<5; i++) {
			pw.println("<h1>why???</h1>");
		}
		Date d=new Date();
		String now=d.toString();
		pw.println("<p>현재 시각 : "+now+"</p>");
		pw.println("</body>");
		pw.println("</html>");
		//pw.println("why???");
		pw.close();
		
	}
}