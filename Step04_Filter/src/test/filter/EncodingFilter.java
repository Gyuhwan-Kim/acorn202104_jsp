package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// 이 프로젝트의 모든 동작에 대해 filter가 동작하도록 한다.
//@WebFilter("/*")
public class EncodingFilter implements Filter{
	// field
	private String encoding;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	// filter가 동작할때마다 호출된다.
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, 
			FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("EncodingFilter doFilter()");
		
		// 1. 만일 encoding 설정이 안되어있다면
		if(request.getCharacterEncoding()==null){
			// post 방식 전송했을 때, 한글이 깨지지 않도록
			request.setCharacterEncoding(encoding);
		}
		// 2. 요청의 흐름 계속 이어가기
		chain.doFilter(request, response);
	}

	// filter가 최초 사용될 때 한 번만 호출된다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		/*
		 * 	<init-param>
				<param-name>encoding</param-name>
				<param-value>utf-8</param-value>
			</init-param> 
			
			web.xml 에 위와 같이 설정된 초기화 parameter 읽어오기
		 */
		
		// doFilter() method에서 사용할 수 있도록 field에 저장.
		encoding=filterConfig.getInitParameter("encoding"); //utf-8
	}
	
}
