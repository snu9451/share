package page.mvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import errand.mvc.ErrandLogic;
import item.mvc.ItemLogic;
import member.mvc.MemberLogic;
import nds.util.HashMapBinder;
import test.mvc.TestController;
import test.mvc.TestLogic;

public class PageController extends MultiActionController {
	private PageLogic pageLogic = null;
	private MemberLogic memberLogic = null;
	private ErrandLogic errandLogic = null;
	private ItemLogic itemLogic = null;
	private ErrandLogic adminLogic = null;
	Logger logger = Logger.getLogger(PageController.class);

	//===============================[[]]===============================
	public ModelAndView getMyPage(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		logger.info("getMytPage 호출 성공."); //잘 도착 했는지 확인
		Map<String, Object> myPage = null;//멤버 정보를 담을 맵 선언
		myPage=memberLogic.selectMemberInfo();//선언한 myPage에 멤버정보 담기
		logger.info("myPage:"+myPage);//myPage에 잘 들어 왔나 확인
		ModelAndView mav = new ModelAndView();//모델 앤 뷰 생성
		mav.setViewName("????");//모델 앤 뷰가 보여줄 페이지 이름?
		mav.addObject("myPage",myPage);//모델 앤 뷰에 로직에서 받아온 값을 넣고 보여줌.
		return mav;
}
	//===============================[[]]===============================
//	public ModelAndView getMainPage(HttpServletRequest req, HttpServletResponse res)
//			throws IOException{
//		logger.info("getMainPage 호출 성공.");
//		Map<String,List<Map<String, Object>>> asdf = null;
//		logger.info(":"+);
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("????");
//		mav.addObject("",);
//		return mav;
//	}
	//===============================[[]]===============================
	public ModelAndView getItemInsertPage(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		logger.info("getItemInsertPage 호출 성공.");
		List<String> category = null;
		category = pageLogic.selectCategory();
		logger.info("category:"+category);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("????");
		mav.addObject("category",category);
		return mav;
	}
	//===============================[[]]===============================
	public ModelAndView getMemberPage(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		logger.info("getMemberPage 호출 성공.");
//		Map<String, Object> innerMap = new HashMap<>();
		List<Map<String, Object>> rlist = null;
		Map<String,List<Map<String,Object>>> rmap = null;
		Map<String, Object> pmap = null;
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		rlist = memberLogic.selectMemberInfo(pmap);
		rmap.put("memberList",rlist);
		midList.add(innerMap);
		new HashMap<>();
		innerMap.put("itemList",itemList);
		midList.add(innerMap);
		new HashMap<>();
		innerMap.put("errandList",errandList);
		midList.add(innerMap);
		
		logger.info("memberList:"+memberList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("????");
		mav.addObject("memberList",memberList);
		return mav;
	}
	//===============================[[]]===============================
	public ModelAndView getAdminPage(HttpServletRequest req, HttpServletResponse res)
			throws IOException{
		logger.info("getAdminPage 호출 성공."); //잘 도착 했는지 확인
		List<Map<String, Object>> memberReport = null; //신고당한 회원들의 정보를 담을 List<map>선언
		memberReport = adminLogic.selectMemberReoprt();//선언한 List<Map>에 신고당한 회원들 정보 담기
		logger.info("memberReport:"+memberReport);//잘 담겼는지 확인
		ModelAndView mav = new ModelAndView();//모델 앤 뷰 선언
		mav.setViewName("????");//모델 앤 뷰가 보여줄 페이지 이름?
		mav.addObject("memberReport",memberReport);//모델 앤 뷰에 로직에서 받아온 값을 넣고 보여줌
		return mav;
	}
	
	public void setPageLogic(PageLogic pageLogic) {
		this.pageLogic = pageLogic;
	}
	public void setMemberLogic(MemberLogic memberLogic) {
		this.memberLogic = memberLogic;
	}
	public void setItemLogic(ItemLogic itemLogic) {
		this.itemLogic = itemLogic;
	}
	
	
}
