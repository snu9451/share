package nds.util;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import member.mvc.MemberLogic;

public class LoginCheckInterceptor implements HandlerInterceptor {
	
	Logger logger = Logger.getLogger(LoginCheckInterceptor.class);
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠. 
	MemberLogic memberLogic = null;

	// 로그인 체크를 하지 않을 즉, 비회원도 볼 수 있는 페이지에 대한  URI 목록
	String[] excludedURIs = {
		"/WEB-INF/views/mainpage/mainpage.jsp",
		"/member/join.nds",
		"/member/reqLoginView.nds",
		"/page/getMainPage.nds",
		"/member/doLogin.nds",
		"/member/selectNickName.nds",
		"/member/insertMember.nds",
		"/member/selectEmail.nds",
		"/member/sendCode.nds",
		"/member/sendSMSCode.nds",
		"/member/issueTempPw.nds",
		"/member/issueTempPw.nds",
		"/member/doLoginAndroid.nds",
		"/mainPage/main_page.nds",
		"/mainPage/reqJoinView.nds",
		"/item/selectItemList.nds",
		"/item/selectBySearch.nds",
		"/item/selectByCategory.nds",
		"/item/andselectItemList.nds",
		"/item/andselectItemDetail.nds",
		"/item/andDeleteComment.nds",
		"/item/andInsertComment.nds",
		"/item/andDeleteItem.nds"
	};
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		
		// 요청이 발생하면 그 요청에 대한 세션을 가져온다.
		HttpSession session = req.getSession();
		logger.info("요청된 URI =====> "+req.getRequestURI());
		Map<String, Object> login = (Map<String, Object>)session.getAttribute("login");
		String mem_email = null;
		if(login != null) {
			mem_email = (String)login.get("MEM_EMAIL");
		}
		if("admin@good.com".equals(mem_email) && !"/member/doLogout.nds".equals(req.getRequestURI())) {
			res.sendRedirect("http://localhost:9696/itemUpload/itemUpload.jsp");
			return false;
		}
		for(int i=0; i<excludedURIs.length; i++) {
			if(excludedURIs[i].equals(req.getRequestURI())) {
				logger.info("비회원도 이용 가능한 페이지 || 예외url 요청입니다.");
				return true;
			}
		}
		
		logger.info("회원만 이용 가능한 페이지 요청입니다.");
		// 사용자가 로그인 상태인지 확인한다.
		// 세션에 저장된 "login"이 있다면 즉, 로그인 상태라면...
		System.out.println("===================================="+mem_email);
		if(login != null) {
			if("admin@good.com".equals(mem_email) && !"/member/doLogout.nds".equals(req.getRequestURI())) {
				res.sendRedirect("http://localhost:9696/itemUpload/itemUpload.jsp");
				return false;
			}
			return true;			
		} else {
			// (1)비회원도 이용가능한 예외 URI(excludedURIs)도 아니면서 (2)로그인 하지도 않은 사용자의 요청이라면,
			// 로그인 페이지를 요청하는 서블릿 태우기.
			session.setAttribute("reqLoginView", "true");
			res.sendRedirect("http://localhost:9696/mainPage/main_page.nds");
//			.sendRedirect("http://localhost:9696/mainPage_JSP/main_page.jsp");
			return false;
		}
	}
	
	@Override	// 컨트롤러가 수행되고 화면이 보여지기 직전에 호출되는 메소드이다.
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mav)
			throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception e)
			throws Exception {
	}
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setMemberLogic(MemberLogic memberLogic) {
		this.memberLogic = memberLogic;
	}

}
