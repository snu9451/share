package admin.mvc;

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

import com.google.gson.Gson;

import item.mvc.ItemLogic;
import member.mvc.MemberLogic;
import nds.util.AjaxDataPrinter;
import nds.util.HashMapBinder;

public class AdminController extends MultiActionController {
	Logger logger = Logger.getLogger(AdminController.class); // 로그 출력

	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠
	private AdminLogic adminLogic = null;

	// setter 객체 주입법으로 객체 주입 받음
	public void setAdminLogic(AdminLogic adminLogic) {
		this.adminLogic = adminLogic;
	}

	
//	public ModelAndView getAdminPage(HttpServletRequest req, HttpServletResponse res) throws Exception {
//		logger.info("getadminPage 호출 성공.");
//		HashMapBinder hmb = new HashMapBinder(req);
//		Map<String, Object> target = new HashMap<>(); //req에 담겨 있는 수많은 정보들 중에서 우리가(사용자) 전송한 정보만 담기 위해서 만들어준 것.(target)
//		hmb.bind(target);//여기서는 타겟 안에 아무것도 안 들어있음.
//		
//		List<Map<String,Object>> adminPage = null; //타겟은 직접 컨트롤러->로직->다오를 갔다 오는 녀석이고 보더리스트는 각 위치에 배정되어 있는 놈.
//		
//		adminPage=adminLogic.getAdminPage(target);//where bm_no=? and bm_title LIKE '%'||?||'%'
//		logger.info("getAdminPage:"+adminPage);
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("/admin/admin_page1.jsp");
//		mav.addObject("adminPage", adminPage);
//		return mav;
//		
//	}
	//-------------------------------------------
	public void getAdminPage1(HttpServletRequest req, HttpServletResponse res) {
//	public ModelAndView getAdminPage1(HttpServletRequest req, HttpServletResponse res) {
		logger.info("getAdminPage1 호출 성공");
		List<Map<String,Object>> adminPage1 = null; //타겟은 직접 컨트롤러->로직->다오를 갔다 오는 녀석이고 보더리스트는 각 위치에 배정되어 있는 놈.
		adminPage1=adminLogic.getAdminPage1();
//		ModelAndView mav = new ModelAndView("/admin/admin_page1.jsp");
//		mav.addObject("adminPage1", adminPage1);
//		logger.info("getAdminPage1:"+adminPage1);
//		return mav;	

		Gson g = new Gson();
		String jsondata = g.toJson(adminPage1);
		AjaxDataPrinter.out(res, "application/json", jsondata);
	}
	public ModelAndView getAdminPage2(HttpServletRequest req, HttpServletResponse res) {
		logger.info("getAdminPage2 호출 성공");
		List<Map<String,Object>> adminPage2 = null; //타겟은 직접 컨트롤러->로직->다오를 갔다 오는 녀석이고 보더리스트는 각 위치에 배정되어 있는 놈.
		adminPage2=adminLogic.getAdminPage2();
		ModelAndView mav = new ModelAndView("/admin/admin_page2.jsp");
		mav.addObject("adminPage2", adminPage2);
		logger.info("getAdminPage2:"+adminPage2);
		return mav;
	}
	
	public ModelAndView getAdminModal1(HttpServletRequest req, HttpServletResponse res) {
		logger.info("getAdminModal1 호출 성공");
		List<Map<String,Object>> adminModal1 = null; //타겟은 직접 컨트롤러->로직->다오를 갔다 오는 녀석이고 보더리스트는 각 위치에 배정되어 있는 놈.
		adminModal1=adminLogic.getAdminModal1();
		ModelAndView mav = new ModelAndView("/admin/admin_modal1.jsp");
		mav.addObject("adminModal1", adminModal1);
		logger.info("getAdminModal1:"+adminModal1);
		return mav;		
	}
	public ModelAndView getAdminModal2(HttpServletRequest req, HttpServletResponse res) {
		logger.info("getAdminModal2 호출 성공");
		List<Map<String,Object>> adminModal2 = null; //타겟은 직접 컨트롤러->로직->다오를 갔다 오는 녀석이고 보더리스트는 각 위치에 배정되어 있는 놈.
		adminModal2=adminLogic.getAdminModal2();
		ModelAndView mav = new ModelAndView("/admin/admin_modal2.jsp");
		mav.addObject("adminModal2", adminModal2);
		logger.info("getAdminModal2:"+adminModal2);
		return mav;		
	}
	
	
	// 회원 탈퇴하기(mem_active를 T에서 F로)
	public void outMember(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("outMember 메소드 호출");

		// 프론트에서 선택된 회원들의 이메일을 List 형식으로 전송
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap); // 탈퇴시킬 회원의 정보를 담음

		int result = adminLogic.outMember(pmap); // update는 1건이(n건) 업데이트 되었습니다여서 int로
		res.sendRedirect("/WEB-INF/admin/getAdminPageMember.nds");

		// 테스트
		/*
		 * Map<String, Object> pmap = new HashMap<String, Object>();
		 * pmap.put("mem_email", "melon@good.com"); null 체크됨 int result =
		 * adminLogic.outMember(pmap); logger.info("처리결과 =====> " + result);
		 */
	}

	// (회원, 게시글)신고횟수 초기화 시키기(처리여부 F를 T로 바꾸기)
	public void initReportNumber(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("initReportNumber 메소드 호출");

		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap);

		// 프론트에서 선택된 회원들의 이메일을 List 형식으로 전송
		int result = adminLogic.initReportNumber(pmap); // update는 1건이(n건) 업데이트 되었습니다여서 int로

		res.sendRedirect("/WEB-INF/admin/getAdminPageMember.nds");
		// 테스트
//		Map<String, Object> pmap = new HashMap<String, Object>();
//		pmap.put("mem_email", "water@good.com");
//		pmap.put("bm_no", null);	// null 대입해주지 않아도 mapper XML에서 if문에서 null 체크됨
//		int result = adminLogic.initReportNumber(pmap);
//		logger.info("처리결과 =====> "+result);
	}

	// 회원 검색
	public void selectMemberBySearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("selectMemberBySearch 메소드 호출");

		// (관리자가 선택한 카테고리) Front에서 request 객체에 담아주어야 함
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap); // 검색어 + 검색타입(닉네임이나 이메일, 전체) 담음

		String nick_email_type = ""; // 이메일, 닉네임, 전체인지 => 카테고리
		String pr_search = ""; // 검색단어
		pmap.put("nick_email_type", nick_email_type);
		pmap.put("pr_search", pr_search);

//		pmap.put("nick_email_type", "이메일");
//		pmap.put("pr_search", "w");

		List<Map<String, Object>> searchMember = new ArrayList<Map<String, Object>>(); // 검색한 회원들을 가져옴
		searchMember = adminLogic.selectMemberBySearch(pmap);
		req.setAttribute("selectMemberBySearch", searchMember);
		// logger.info("result" + searchMember);
	}

	// http://localhost:9696/admin/selectBoardBySearch.nds?nick_title_type=%EC%A0%9C%EB%AA%A9&pr_search=%EB%93%9C
	/////////////////////////////////////////★//////////////////////////////////////////////
	// 게시글 검색
	// 게시글 제목 또는 작성자로 검색
	public void selectBoardBySearch(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("selectBoardBySearch 메소드 호출");

		// (관리자가 선택한 카테고리) Front에서 request 객체에 담아주어야 함
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bindPost(pmap); // 검색 타입(작성자, 제목, 전체) 담음

		String pr_search = ""; // 검색단어
		String nick_title_type = ""; // 작성자, 제목, all => 카테고리
		pr_search = (String)pmap.get("pr_search");
		nick_title_type = (String)pmap.get("nick_title_type");
		pmap.put("pr_search", pr_search);
		pmap.put("nick_title_type", nick_title_type);
		logger.info("pmap ===> "+pmap);

		List<Map<String, Object>> searchBoard = new ArrayList<Map<String, Object>>(); // 검색한 게시글들을 가져옴
		searchBoard = adminLogic.selectBoardBySearch(pmap);
		// Front에 내보내기
		Gson g = new Gson();
		String data = g.toJson(searchBoard);
		AjaxDataPrinter.out(res, "application/json", data);
	}

	// 신고된 회원 상세보기
	public ModelAndView selectMemberReportDetail(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectMemberReportDetail 메소드 호출");

		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap);

		/*
		 * 테스트 Map<String, Object> pmap = new HashMap<String, Object>(); > 신고 내용을 클릭하면
		 * 신고내용에 해당하는 신고번호, 신고한 사용자의 이메일, 신고당한 사용자의 이메일, 신고 내용, 신고 날짜, 신고 유형, 처리여부가 나옴
		 * pmap.put("report_msg", "욕을 해서 기분이 나쁘네요"); pmap =
		 * adminLogic.selectMemberReportDetail(pmap); logger.info("처리결과 =====> " +
		 * pmap);
		 */

		pmap = adminLogic.selectMemberReportDetail(pmap);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/selectMemberReportDetail.jsp");
		mav.addObject("selectMemberReportDetail", pmap);

		return mav;
	}

	// 신고된 게시글 상세보기
	public ModelAndView selectBoardReportDetail(HttpServletRequest req, HttpServletResponse res) {
		logger.info("selectBoardReportDetail 메소드 호출");

		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap); // 신고된 게시글 번호 담음

		/*
		 * 테스트 Map<String, Object> pmap = new HashMap<String, Object>(); > 신고 내용을 클릭하면
		 * 신고내용에 해당하는 신고번호, 신고한 회원 이메일, 신고내용, 신고날짜, 신고유형, 신고당한 게시글 번호, 처리여부가 나옴
		 * pmap.put("report_msg", "도배요~"); pmap =
		 * adminLogic.selectBoardReportDetail(pmap); logger.info("처리결과 =====> " + pmap);
		 */

		pmap = adminLogic.selectBoardReportDetail(pmap);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/selectBoardReportDetail");
		mav.addObject("selectBoardReportDetail", pmap);

		return mav;
	}
}