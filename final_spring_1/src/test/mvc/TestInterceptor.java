package test.mvc;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class TestInterceptor implements HandlerInterceptor {
	
	Logger logger = Logger.getLogger(TestInterceptor.class);
	// 유효한 세션아이디인지를 체크해야 하므로 DB에 다녀와야 한다. 따라서 로직을 탈 수 있도록 로직 클래스를 선언한다.
	// Spring의 관리를 받을 것이므로 null로 선언만 한다. - setter 객체 주입
	// 테스트용이므로 쿠키에서 가져온 MY_ZIP에 해당하는 SIGU가 '광명시'인지를 체크해보자.
	TestLogic testLogic = null;
	

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
	throws Exception
	{	
		logger.info("==========================start==========================");
		logger.info("인터셉트 당했어요..." + req.getRequestURI());
		
		// session 객체를 가져옴
        HttpSession session = req.getSession();
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
        Object obj = session.getAttribute("login");
         
        if ( obj ==null ){// 로그인된 세션이 없는 경우...
            // 우리가 만들어 논 쿠키를 꺼내온다.
            Cookie myZip = WebUtils.getCookie(req,"MY_ZIP");
            if ( myZip !=null ){// 쿠키가 존재하는 경우(이전에 로그인때 생성된 쿠키가 존재한다는 것)
                // loginCookie의 값을 꺼내오고 -> 즉, 저장해논 세션Id를 꺼내오고
                int MY_ZIP = Integer.parseInt(myZip.getValue());
                // 세션Id를 checkUserWithSessionKey에 전달해 이전에 로그인한적이 있는지 체크하는 메서드를 거쳐서
                // 유효시간이 > now() 인 즉 아직 유효시간이 지나지 않으면서 해당 sessionId 정보를 가지고 있는 사용자 정보를 반환한다.
                String sigu = testLogic.checkSIGU(MY_ZIP);
                 
                if ( "광명시".equals(sigu) ){// 그런 사용자가 있다면
                    // 세션을 생성시켜 준다.
                    session.setAttribute("login", "gms");
                    logger.info("광명시입니다.");
                    return true;
                }
                
                logger.info("광명시 아니네요...");
            }
             
            // 이제 아래는 로그인도 안되있고 쿠키도 존재하지 않는 경우니까 다시 로그인 폼으로 돌려보내면 된다.
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
            res.sendRedirect("./test.jsp");
            return false;// 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        }
         
        // preHandle의 return은 <<컨트롤러 요청 uri로 가도 되냐 안되냐>>를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
        return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("==========================end==========================");
	}
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	public void setTestLogic(TestLogic testLogic) {
		this.testLogic = testLogic;
	}
}