package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.service(req, resp);
		
		// 오늘의 운세 얻어오기
		String fortuneToday="06월 10일의 운세 총운은 “황당무계” 입니다.\r\n"+
				"매사가 권태로워 지는 날입니다. 이런 날일수록 늘어지는 기분을 잘 추슬러야 합니다...";
		/*
		 * 	오늘의 운세를 client에게 응답을 해야한다.
		 *  어떤 식으로 응답할까?
		 *  html 형식이 적당하겠지?
		 *  그런데 문제가 있다.
		 *  나는 servlet이기 때문에 html 형식의 문자열을 응답하기가 너무 불편하다.
		 *  html 형식의 문자열을 전문적으로 응답하는 아이가 있을까?
		 *	아하! jsp page가 전문이지!
		 *	그럼 jsp 한테 대신 html 형식의 문자열을 응답해달라고 부탁해야겠다.
		 *	앗!
		 *	오늘의 운세를 안 전달해주었네 미안~
		 *	request 영역에 fortuneToday라는 key 값으로 넣어둘테니
		 *	잘 빼서 써. jsp야 고마워
		 */
		
		// request 영역에 "fortuneToday" 라는 key 값으로 String type 저장하기
		req.setAttribute("fortuneToday", fortuneToday);
		
		// 응답을 위임할 jsp 페이지의 위치를 전달하면서 RequestDispatcher 객체의 참조값을 얻어온다.
		RequestDispatcher rd=req.getRequestDispatcher("/test/fortune.jsp");
		// .forward(요청객체, 응답객체) 를 호출해서 대신 응답해달라고 부탁한다.
		rd.forward(req, resp);
	}

}
