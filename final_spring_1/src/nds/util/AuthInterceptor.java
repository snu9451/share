package nds.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import member.mvc.MemberLogic;

public class AuthInterceptor implements HandlerInterceptor {
	
	Logger logger = Logger.getLogger(AuthInterceptor.class);
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠. 
	MemberLogic memberLogic = null;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		// 요청이 발생하면 그 요청에 대한 세션을 가져온다.
//		logger.info("AuthInterceptor::요청된 URI =====> "+req.getRequestURI());
//		for(int i=0; i<excludedURIs.length; i++) {
//			if(excludedURIs[i].equals(req.getRequestURI())) {
//				logger.info("예외 url 요청입니다.");
//				return true;
//			}
//		}
//		if("/member/doLogout.nds".equals(req.getRequestURI())){
//			return true;
//		}
		// request 객체를 통해 Cookie를 가져오고
		//cookie에 NDS_SKEY가 있는지 확인해서 있다면
		CookiesMap cookies = new CookiesMap(req);
		String sessionKey = "NDS_SKEY";
		String sessionValue = "";
		if(cookies.hasName(sessionKey)) {
			sessionValue = cookies.getValue(sessionKey);
		}
		// 로그아웃 버튼 누르면 자동로그인 선택 회원도 로그아웃 될 수 있도록 처리한 부분임 -------- 2021 06 30 수 김은영
		if(!"/member/doLogout.nds".equals(req.getRequestURI())) {
			String logout = "logout";
			if(cookies.hasName(logout)){
//				logout = cookies.getValue(logout);
				return true;
			}
		}
		logger.info("자동로그인 인터셉터::sessionValue ===> "+sessionValue);
		// 그 sessionValue에 해당하는 데이터가 자동로그인(A)인지와 유효한지 여부를 확인한다.
		// 유효한 sessionValue이며 허용권한이 자동로그인(A)이라면
		Map<String, Object> rmap = new HashMap<>();
		logger.info("자동로그인 인터셉터::rmap ===> "+rmap);
		rmap = memberLogic.selectOneBySession(sessionValue);
		if(rmap != null) {
			String auth_range = (String)rmap.get("AUTH_RANGE");
			String mem_email = (String)rmap.get("MEM_EMAIL");
			logger.info("자동로그인 인터셉터::mem_email ===> "+mem_email);
			if("A".equals(auth_range)) {
				// 해당 이메일로 사용자 정보를 조회해서 가져온 뒤 map에 담고 그 map을 "login"이라는 이름으로 세션에 담는다.
				Map<String, Object> login = new HashMap<>();
				login.put("mem_email", mem_email);
				login = memberLogic.selectMemberAdmin(login);
				logger.info("자동로그인 인터셉터::login ===> "+login);
				HttpSession session = req.getSession();
				session.setAttribute("login", login);
			}
		}
		// 요청된 서블릿을 탈 수 있도록 true를 반환해준다.
		return true;
	}
	
	
	@Override
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
