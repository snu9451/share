package test.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.JsonObject;

public class TestController extends MultiActionController {

  // 스프링의 지원, 간섭, 자원관리를 받고자 게으른 인스턴스화함.
  // setter 객체 주입법으로 객체를 주입받는다.
  TestLogic testLogic = null;

  // 로그 출력을 위함.
  Logger logger = Logger.getLogger(TestController.class);

  public ModelAndView test(HttpServletRequest req, HttpServletResponse res) throws IOException {
    logger.info("컨트롤러의 test 메소드 호출 성공!");

    // 테스트용으로 ZipCode를 화면에 출력해보려 함.
    List<Map<String, Object>> zipCodeList = new ArrayList<Map<String, Object>>();
    zipCodeList = testLogic.test();
    // 테스트용 페이지 - WebContent/member에 만들어 둔 test.jsp로 이동
    // logger.info(zipCodeList.get(0).get("UID_NO").toString());
    // 쿠키에 값 넣기 - 사용자가 직접 삭제하지 않으면 남아있다.
    res.addCookie(new Cookie("MY_ZIP", zipCodeList.get(0).get("UID_NO").toString()));
    // 클라이언트의 브라우저에 저장되어 있는 쿠키 값을 읽어옴. - 쿠기가 여러개 저장되어 있는 경우 쿠키들을 배열로 가져온다.
    // logger.info(req.getCookies()[0].getValue());
    logger.info(req.getRequestURI());
    req.setAttribute("showModal", "yes");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("member/test");
    return mav;
  }

  public void setTestLogic(TestLogic testLogic) {
    this.testLogic = testLogic;
  }

  public void ajaxTest(HttpServletRequest req, HttpServletResponse res) throws IOException {
    logger.info("ajaxTest 메소드 호출완료!!");
    // req.setAttribute("ajax", "아작스~!~~");
    // res.sendRedirect("./response.jsp");
    JsonObject obj = new JsonObject();
    obj.addProperty("data", "야쓰~~~");
    res.setContentType("text/html;charset=utf-8");
    PrintWriter out = res.getWriter();
    out.print(obj.toString());
  }
}
