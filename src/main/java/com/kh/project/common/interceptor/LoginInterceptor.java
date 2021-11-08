package com.kh.project.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.project.member.vo.MemberVO;

// 인터셉터 기능의 클래스를 구현하는 방법
// 1. 일단 클래스를 만든다.
// 2. 인터셉터 기능이 구현된 인터페이스를 구현하거나,
//	  클래스를 상속받는다.
// 	  인터페이스 - HandlerInterceptor
// 	  클래스	 - HandlerInterceptorAdapter
// 공통 메소드	: preHandle(), postHandle(), atferComplate()
// 원하는 시점에 동작하는 메소드를 재정의
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			HttpSession session = request.getSession();
			Object result = session.getAttribute("loginInfo");
			//Object teamCode = ((MemberVO)session.getAttribute("loginInfo")).getTeamCode();
			  if(result == null) {
				   
				   response.setContentType("text/html; charset=UTF-8");
				   PrintWriter out = response.getWriter();

				   out.println("<script>alert('로그인 후 이용가능합니다.'); location.href='/member/goLogin';</script>");
				   out.flush();
				   out.close();
				   
				   return false;
			   }
//			  if(teamCode == null) {
//				  
//				  response.setContentType("text/html; charset=UTF-8");
//				  PrintWriter out = response.getWriter();
//				  
//				  out.println("<script>alert('팀가입 후 이용가능합니다.'); location.href='/team/selectTeamList';</script>");
//				  out.flush();
//				  out.close();
//				  
//				  return false;
//			  }
			   return true;

	}

	
	
	
	
	
}
