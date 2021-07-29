package item.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;

import nds.util.AjaxDataPrinter;
import nds.util.HashMapBinder;

public class ItemController extends MultiActionController {
	
	// 스프링에 의해 객체주입을 받을 것이므로, 인스턴스화 하지 않고 null로 선언만 해둠.
	private ItemLogic itemLogic = null;

	// 로그 출력을 위함.
	Logger logger = Logger.getLogger(ItemController.class);
	
	// 스프링에 의해 setter 객체 주입법으로 객체를 주입 받는다.
	public void setItemLogic(ItemLogic itemLogic) {
		logger.info("ItemLogic 주입");
		this.itemLogic = itemLogic;
	}
	
	//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
	public ModelAndView selectItemList(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : selectItemList메소드 호출");
		//front : key는 "pr_choice" && value는 인기상품 일시 "like_rank"로, 최근상품 일시 "new_rank"
		//             "pr_mem_email" 좋아요 한건지 안한건지 받기 위해서 
		Map<String,Object> pmap = new HashMap<>();
		// 메인페이지에 노출되어야 하므로 좋아요 보여주지 않음 따라서 메일 받지 않음
//		HttpSession session = req.getSession();
//		Map<String, Object> login = (Map<String, Object>)session.getAttribute("login");
//		String mem_email = (String)login.get("MEM_EMAIL");
//		String mem_email = "pine@good.com"; 	// KEY 테스트
//		pmap.put("pr_MEM_EMAIL", mem_email);
		pmap.put("pr_choice",req.getParameter("pr_choice"));
//		pmap.put("pr_choice","like_rank");	// KEY 테스트
		//아이템 전부를 가져오는 로직
		List<Map<String, Object>> items = itemLogic.selectItemList(pmap);
		ModelAndView mav = new ModelAndView("/itemPage/item_page.jsp");
		mav.addObject("itemList", items);
		mav.addObject("pr_choice", req.getParameter("pr_choice"));
		//Json 형태로 가져오기
//		Gson g = new Gson();	// KEY
//		String itemsJson = g.toJson(items);	// KEY
		//가지고 나가는 key&value => "BM_PRICE": 80000,"BM_NO": 13,"BM_LIKE": 0,"BM_DATE": "2020-06-27 17:46:41","BM_STATUS": "N","BI_FILE": "16.png",BM_TITLE": "책팔요"
		//                    => "BM_CONTENT": 내용,"CATEGORY_NAME": 기타, "I_LIKE" 1은 좋아요한거, 0은 안한거
//		AjaxDataPrinter.out(res,"application/json",itemsJson);
		return mav;
		
	}
	
	//안드로이드 : 최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 JSON형식으로 가지고 온다
	public void andSelectItemList(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : andSelectItemList메소드 호출");
		//front : key는 "pr_choice" && value는 인기상품 일시 "like_rank"로, 최근상품 일시 "new_rank"
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("pr_choice",req.getParameter("pr_choice"));
		//아이템 전부를 가져오는 로직
		List<Map<String, Object>> items = itemLogic.selectItemList(pmap);
		//Json 형태로 가져오기
		Gson g = new Gson();
		String itemsJson = g.toJson(items);
		AjaxDataPrinter.out(res,"text/html;charset=utf-8",itemsJson);
	}
	
	//사용자가 카테고리메뉴에서 카테고리 선택 시
	public ModelAndView selectByCategory(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : selectByCategory메소드 호출");
		//front : key는 "pr_categori" && value는 카테고리이름을 가져오겠지!
		//한글 처리
		//HashMapBinder hmb = new HashMapBinder(req);
		//Map<String,Object> pmap = new HashMap<>();
		//카테고리 메뉴가 여기에 들어가게 된다.
		//hmb.bind(pmap);
		//관련 카테고리 아이템들을 가져온다.
		//List<Map<String,Object>> items = itemLogic.selectByCategory(pmap);
		//Json 형태로 가져오기
		//Gson g = new Gson();
		//String itemsJson = g.toJson(items);
		//ModelAndView mav = new ModelAndView();
		//가지고 나가는 key&value => {BM_PRICE=200000, BM_NO=11, BM_LIKE=0, BM_DATE=2020-06-27 15:46:41, BM_STATUS=N, BI_FILE=14.png, BM_TITLE=의자팝니다}
		//mav.addObject("items", items);
		//mav.setViewName("itemTest");
		//return mav;
		
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		//카테고리 메뉴 이름이 여기에 들어가게 된다.
		hmb.bind(pmap);
//		pmap.put("pr_categori","디지털기기");
		//관련 카테고리 아이템들을 가져온다.
		List<Map<String,Object>> items = itemLogic.selectByCategory(pmap);
		List<Map<String, Object>> rankList = itemLogic.rankList(pmap);
		logger.info(pmap);
		logger.info(items);
		ModelAndView mav = new ModelAndView("/itemPage/item_list.jsp");
		mav.addObject("itemList", items);
		mav.addObject("rankList", rankList);
		return mav;
		//Json 형태로 가져오기
//		Gson g = new Gson();
//		String itemsJson = g.toJson(items);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("items", items);
//		mav.setViewName("/itemTest");
//		AjaxDataPrinter.out(res, "application/json", itemsJson);
//		System.out.println(items);
//		return mav;
	}
	
	//검색어를 입력하여 찾기
	public ModelAndView selectBySearch(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : selectBySearch메소드 호출");
		//front : key는 "pr_search" && value는 입력한 검색어
		//front : key는 "pr_search_order" && value는 "제목" or "내용" or "작성자"
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		//검색어를 가져오게 된다. + 검색 타입을(제목, 내용, 작성자) 가져온다.
//		pmap.put("pr_MEM_EMAIL", "apple@good.com"); //여기는 원래 세션
		hmb.bind(pmap);		
		pmap.put("pr_search", (String)pmap.get("pr_search"));
		pmap.put("pr_search_order","제목");
		//검색어 아이템들을 가져온다.
		logger.info("pmap ===> "+pmap);
		List<Map<String,Object>> items = itemLogic.selectBySearch(pmap);
		logger.info(items);
		//Json 형태로 가져오기
//		Gson g = new Gson();
//		String itemsJson = g.toJson(items);
		//가지고 나가는 key&value => "BM_PRICE": 80000,"BM_NO": 13,"BM_LIKE": 0,"BM_DATE": "2020-06-27 17:46:41","BM_STATUS": "N","BI_FILE": "16.png",BM_TITLE": "책팔요"
		//                    => "BM_CONTENT": 내용,"CATEGORY_NAME": 기타, "I_LIKE" 1은 좋아요한거, 0은 안한거
//		AjaxDataPrinter.out(res,"application/json",itemsJson);
		ModelAndView mav = new ModelAndView("/itemPage/item_page.jsp");
		mav.addObject("itemList", items);
		return mav;
	}

	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음
	public void editItem(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("controller : editItem메소드 호출");
		//front : key는 "pr_bm_no" && value는 상품의 번호를 받아옴.
		int pr_bm_no = Integer.parseInt(req.getParameter("pr_bm_no").toString());
		//상품의 내용, 상품의 사진들을 가져온다
		Map<String,Object> item = itemLogic.editItem(pr_bm_no);
		//List<String> itemImg = itemLogic.editItemImg(pr_bm_no);
		List<String> itemImg = itemLogic.editItemImg(pr_bm_no);
		String[] array = null;
		array = itemImg.toArray(new String[5]);
		//상품의 정보를 다 담는다.
		//가지고 나오는 key&value => {BM_PRICE=5000, BM_NO=4, BM_CONTENT=자취 방 빼서 옷 내놔요, CATEGORY_NAME=의류, BM_TITLE=카라티 팝니다}
		req.setAttribute("item",item);
		logger.info("item=================" + item);
		//가지고 나오는 list => [5.png, 6.png]
		req.setAttribute("array", array);
		logger.info("itemImg=================" + itemImg);
		//페이지 전송
		RequestDispatcher dispatcher= req.getRequestDispatcher("/itemUpload/itemUpload.jsp");
		dispatcher.forward(req,res);
	}
	
	
	
	//사용자가 상품 수정 버튼의 수정 완료를 누른다면 상품이 업데이트 되야하니까
	public void updateItem(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : updateItem메소드 호출");
		//front : key는 "pr_BM_TITLE" / "pr_BM_CONTENT" / "pr_BM_PRICE" / "pr_bm_no" / "pr_CATEGORY_NAME"
		//        value는  상품 제목         상품 내용            상품 가격         상품 번호        상품 카테고리
		//        key는 "Img_1"  / "Img_2"  /  "Img_3"  /  "Img_4"  /  "Img_5"
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.multiBind(pmap);
		logger.info(pmap);
		int bm_no = 0;
		bm_no = itemLogic.updateItem(pmap);
		try {
			//메소드 실행 후 서버에 사진이 업로드되기 전에 redirect 되면 사진이 엑박으로 뜸 그래서 2초 후 redirect되도록 sleep걸어둠
			Thread.sleep(2000);
			res.sendRedirect("/item/selectItemDetail.nds?pr_bm_no="+bm_no);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		//사이즈 초과시 에러를 전송시킴
//		if(pmap.containsKey("error")) {
//			System.out.println(pmap.get("error"));
//			//페이지 전송
//			mav.setViewName("itemTest");
//			return mav;
//		}
//		//상품의 내용, 상품의 사진들을 저장한다.
//		//페이지 전송
//		mav.setViewName("itemTest");
//		return mav;
//		
//		
//		int bm_hit = Integer.parseInt(pmap.get("BM_HIT").toString());
//		logger.info(bm_hit);
//		bm_no = itemLogic.insertItem(pmap);
//		if(bm_hit > 0 ) {
//			bm_no = itemLogic.updateItem(pmap);
//		}else {
//		}
//		
//		ModelAndView mav = new ModelAndView();
//		Map<String,Object> pmap = new HashMap<>();
//		pmap.put("pr_BM_TITLE","내용111" );
//		pmap.put("pr_BM_CONTENT","내용111" );
//		pmap.put("pr_BM_PRICE",2000);
//		pmap.put("pr_SELLER_NICKNAME","바나나" );
//		pmap.put("pr_CATEGORY_NAME","기타" );
//		pmap.put("pr_bm_no",32);
//		List<Map<String,Object>> itemImgs = new ArrayList<Map<String,Object>>();
//		Map<String,Object> map1 = new HashMap<String, Object>();
//		map1.put("bi_file", "23.png");
//		map1.put("bi_size", 23);
//		itemImgs.add(map1);
//		map1 = new HashMap<String, Object>();
//		map1.put("bi_file", "24.png");
//		map1.put("bi_size", 555);
//		itemImgs.add(map1);
//		map1 = new HashMap<String, Object>();
//		map1.put("bi_file", "25.png");
//		map1.put("bi_size", 532);
//		itemImgs.add(map1);
//		pmap.put("itemImgs", itemImgs);
//		//사이즈 초과시 에러를 전송시킴
//		if(pmap.containsKey("error")) {
//			System.out.println(pmap.get("error"));
//			//페이지 전송
//			mav.setViewName("itemTest");
//			return mav;
//		}
//		//상품의 내용, 상품의 사진들을 저장한다.
//		itemLogic.insertItem(pmap);
//		//페이지 전송
//		mav.setViewName("itemTest");

	
	//사용자가 하나의 제품을 클릭 시 가져 오게 되는 상품
	public ModelAndView selectItemDetail(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("controller : selectItemDetail메소드 호출");
		//front : key는  "pr_bm_no" / value 값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		//세션으로 이메일을 가져옴.
		HttpSession session= req.getSession();
		Map<String,Object> login = (Map<String,Object>)session.getAttribute("login");
		String pr_MEM_EMAIL = (String)login.get("MEM_EMAIL");
		String pr_MEM_NICKNAME = (String)login.get("MEM_NICKNAME"); // 사용자가 클릭한 상품이 사용자 본인이 작성한 것인지, 아니면 다른 사람이 작성한 것인지 확인하기 위해 담는다.
		//String pr_MEM_EMAIL = session.getAttribute(이멜 가지고 나와);
//		String pr_MEM_EMAIL = "apple@good.com";
		//값들을 넣어줌
		int pr_bm_no = Integer.parseInt(req.getParameter("pr_bm_no").toString());
		//상품의 내용을 가져온다.
		Map<String,Object> itemContext = itemLogic.selectItemDetailContext(pr_MEM_EMAIL,pr_bm_no,pr_MEM_NICKNAME);
		//상품의 사진들을 가져온다
		List<String> itemImgs = itemLogic.selectItemDetailImgs(pr_bm_no);
		//상품의 댓글들을 가져온다
		List<Map<String, Object>> itemComments = itemLogic.selectItemDetailComment(pr_bm_no,pr_MEM_NICKNAME);
		ModelAndView mav = new ModelAndView("/itemPage/detail_page.jsp");
		//상품의 정보를 다 담는다.
		//결과값 {BM_PRICE=120000, BM_NO=3, BM_CONTENT=선물 받았는데 있어서 팔아요, SELLER_NICKNAME=딸기, BM_LIKE=2, BM_HIT=200, BM_DATE=2020-06-19 15:46:41, BM_STATUS=N, I_LIKE=1, BM_TITLE=샤넬 향수 새거 팔아요}
		//seller_me = 1 이면 판매자와 내가 동일 인물임 0이면 아니고
		mav.addObject("itemContext", itemContext);
		//결과값[4.png]
		mav.addObject("itemImgs", itemImgs);
		//댓글들 달기
		//p_temp=[{COMMENT_STEP=1, MEM_NICKNAME=포도, COMMENT_DATE=2020-06-17 16:46:41, COMMENT_MSG=네고 가능한가요?, COMMENT_ME=0, COMMENT_POS=0, COMMENT_GROUP=1}]
		//COMMENT_POS=0이면 댓글, 1이면 대댓글
		//p_temp=[{COMMENT_STEP=1,, COMMENT_POS=0, COMMENT_GROUP=1}]
		mav.addObject("itemComments", itemComments);
		//페이지 전송
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/item/detail_page.jsp");
//		dispatcher.forward(req,res);
		return mav;

	}

	//안드로이드 - 사용자가 하나의 제품을 클릭 시 가져 오게 되는 상품
	public void andSelectItemDetail(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("controller : andSelectItemDetail메소드 호출");
		//front : key는  "pr_bm_no" ,pr_MEM_EMAIL,pr_MEM_NICKNAME / value 값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		String pr_MEM_EMAIL = "grape@good.com";
		String pr_MEM_NICKNAME = "포도";
		//값들을 넣어줌
		int pr_bm_no = Integer.parseInt(req.getParameter("pr_bm_no").toString());
		//상품의 내용을 가져온다.
		//상품의 정보를 다 담는다.
		//결과값 {BM_PRICE=120000, BM_NO=3, BM_CONTENT=선물 받았는데 있어서 팔아요, SELLER_NICKNAME=딸기, BM_LIKE=2, BM_HIT=200, BM_DATE=2020-06-19 15:46:41, BM_STATUS=N, I_LIKE=1, BM_TITLE=샤넬 향수 새거 팔아요}
		//seller_me = 1 이면 판매자와 내가 동일 인물임 0이면 아니고
		Map<String,Object> items = itemLogic.selectItemDetailContext(pr_MEM_EMAIL,pr_bm_no,pr_MEM_NICKNAME);
		//상품의 사진들을 가져온다
		List<String> itemImgs = itemLogic.selectItemDetailImgs(pr_bm_no);
		//상품의 댓글들을 가져온다
		List<Map<String, Object>> itemComments = itemLogic.selectItemDetailComment(pr_bm_no,pr_MEM_NICKNAME);
		//상품 사진 결과값[4.png]
		items.put("itemImgs", itemImgs);
		//댓글들 달기
		//p_temp=[{COMMENT_STEP=1, MEM_NICKNAME=포도, COMMENT_DATE=2020-06-17 16:46:41, COMMENT_MSG=네고 가능한가요?, COMMENT_ME=0, COMMENT_POS=0, COMMENT_GROUP=1}]
		//COMMENT_POS=0이면 댓글, 1이면 대댓글
		//p_temp=[{COMMENT_STEP=1,, COMMENT_POS=0, COMMENT_GROUP=1}]
		items.put("itemComments", itemComments);
		//Json 형태로 가져오기
		Gson g = new Gson();
		String itemsJson = g.toJson(items);
		AjaxDataPrinter.out(res,"text/html;charset=utf-8",itemsJson);
	}
	//상품 삭제
	public void deleteItem(HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("controller : deleteItem메소드 호출");
		//front : key는 "br_sel_buy" && value는 구매자일 경우 "buy" , 판매자일 경우 "sel"
		//        key는 "pr_bm_no"   && value값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		//값들을 넣어줌
		pmap.put("br_sel_buy", req.getParameter("br_sel_buy")); 
		pmap.put("pr_bm_no", req.getParameter("pr_bm_no"));	
		//상품을 삭제한다.
		itemLogic.deleteItem(pmap);
		//페이지 전송
		res.sendRedirect("/mainPage/main_page.jsp");
	}
	
	//안드로이드 상품 삭제
	public void andDeleteItem(HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("controller : andDeleteItem메소드 호출");
		//front : key는 "br_sel_buy" && value는 구매자일 경우 "buy" , 판매자일 경우 "sel"
		//        key는 "pr_bm_no"   && value값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		//값들을 넣어줌
		pmap.put("br_sel_buy", req.getParameter("br_sel_buy")); 
		pmap.put("pr_bm_no", req.getParameter("pr_bm_no"));	
		//상품을 삭제한다.
		itemLogic.deleteItem(pmap);
	}
	
	//상품 판매 완료 클릭 시
	public void updateItemConfirm(HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("controller : updateItemToConfirm 메소드 호출");
		//front : key는 "pr_bm_no"   && value값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("pr_bm_no", req.getParameter("pr_bm_no"));
		//상품을 판매 완료 처리한다.
		String msg = itemLogic.updateItemToConfirm(pmap);
		//만약에 누군가와 거래 중이라면 판매 완료 처리가 불가능 msg ="false"
		//그게 아니라면 msg = "true"
		res.sendRedirect("/item/selectItemDetail.nds?pr_bm_no="+pmap.get("pr_bm_no").toString());

	}
	
	//상품 찜하기 클릭 시
	public void likeItem(HttpServletRequest req, HttpServletResponse res){
		logger.info("controller : likeItem메소드 호출");
		//front : key는 "pr_bm_no"   && value값은 상품 번호
		Map<String,Object> pmap = new HashMap<>();
		//세션으로 이메일을 가져옴.
		HttpSession session= req.getSession(); 
		Map<String,Object> login = (Map<String,Object>)session.getAttribute("login");
		String pr_MEM_EMAIL = (String)login.get("MEM_EMAIL");
		//값들을 넣어줌
		pmap.put("pr_MEM_EMAIL",pr_MEM_EMAIL); //세션에서 원래는 아이디 가져와기
		pmap.put("pr_bm_no", req.getParameter("pr_bm_no"));
		// like = 1이면 찜하기 된거고, -1이면 찜하기 취소 된 거임, 0이면 로그인 안한 사람.
		//if(session.getAttribute("pr_MEM_EMAIL")==null) {
		//	AjaxDataPrinter.out(res, 0);
		//}else {
			int like = itemLogic.likeItem(pmap);
			AjaxDataPrinter.out(res, like);
		//}
	}

		//}
	public void selectComment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("controller : selectComment메소드 호출");
		HttpSession session= req.getSession();
		Map<String,Object> login = (Map<String,Object>)session.getAttribute("login");
		String pr_MEM_NICKNAME = (String)login.get("MEM_NICKNAME");
		int pr_bm_no = Integer.parseInt(req.getParameter("pr_bm_no").toString());
		logger.info("controller : selectComment메소드 호출" + pr_bm_no);
		List<Map<String, Object>> itemComments = itemLogic.selectItemDetailComment(pr_bm_no,pr_MEM_NICKNAME);
		AjaxDataPrinter.out(res, itemComments);

	}
	//댓글 등록 - 댓글인지 대댓글인지 구분
	public ModelAndView insertComment(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : insertComment메소드 호출");
		//front : key는 "pr_comment_msg"  / "pr_comment_group"                              / "pr_comment_pos"     / "pr_mem_nickname" / "pr_bm_no"
		//      value는  메세지 내용        / 댓글이면 0이고, 대댓글이면 댓글의 pr_comment_group로 가져온다.    댓글이면 0, 대댓글이면 1    닉네임               게시판 번호
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		HttpSession session = req.getSession();
		Map<String, Object> login = (Map<String, Object>)session.getAttribute("login");
		String mem_nickname = (String)login.get("MEM_NICKNAME");
		pmap.put("pr_mem_nickname", mem_nickname);
//		pmap.put("pr_mem_nickname", "사과"); //운래는 세션처리
		hmb.bindPost(pmap);
		////댓글 또는 대댓글의 정보 가지고 오기, 특히 댓글의 경우 0이 아닌 pr_comment_group을 가져와야한다!+ p_comment_step , result
		Map<String,Object> comments = itemLogic.insertComment(pmap);
		////여기에는 result가 들어가는데 "true"면 댓글이 잘 등록 되었고, "itemFalse"이면 상품이 삭제 되었다는 것으로 댓글이 못 달린다. "noId" 로그인 안했을 시
		////									            "comentFalse"면 댓글이 삭제 되었다는 것이다.(물론 이 경우는 대댓글 등록일 경우)
		//Json 형태로 가져오기
		//Gson g = new Gson();
		//String itemsJson = g.toJson(comments);
		//AjaxDataPrinter.out(res,"application/json",itemsJson);
		ModelAndView mav = new ModelAndView("/itemPage/comment.jsp");
		mav.addObject("comments", comments);
		return mav;
	}
	
	//안드로이드: 댓글 등록 - 댓글인지 대댓글인지 구분
	public void andInsertComment(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : insertComment메소드 호출");
		//front : key는 "pr_comment_msg"  / "pr_comment_group"                              / "pr_comment_pos"     / "pr_mem_nickname" / "pr_bm_no"
		//      value는  메세지 내용        / 댓글이면 0이고, 대댓글이면 댓글의 pr_comment_group로 가져온다.    댓글이면 0, 대댓글이면 1    닉네임               게시판 번호
		//한글 처리
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		HttpSession session = req.getSession();
		Map<String, Object> login = (Map<String, Object>)session.getAttribute("login");
		//String mem_nickname = (String)login.get("MEM_NICKNAME");
		//pmap.put("pr_mem_nickname", mem_nickname);
		pmap.put("pr_mem_nickname", "사과"); //운래는 세션처리
		hmb.bindPost(pmap);
		////댓글 넣기
		itemLogic.insertComment(pmap);
	}
	
	//댓글 삭제 - 댓글인지 대댓글인지 구분
	public void deleteComment(HttpServletRequest req, HttpServletResponse res){
		logger.info("controller : deleteComment메소드 호출");
		//front : key는 "p_comment_step" && value는 숫자를 가져오면 된다. (comment_step는 댓글의 시퀀스 번호임)
		Map<String,Object> pmap = new HashMap<>();
		//값을 넣어줌
		pmap.put("pr_comment_step", req.getParameter("p_comment_step"));
		String result = itemLogic.deleteComment(pmap);
		//여기에는 result가 들어가는데 "true"면 댓글이 잘 삭제되고, "false"이면 해당 댓글이 존재하지 않는 다는 것임(상품이 없던가, 댓글이 없는 거겠지) 
		//- 재로딩 처리해서 없는 페이지면 다시 목록으로, 있는 페이지라면 보여주면 되겠지
		AjaxDataPrinter.out(res,result);
	}
	
	//댓글 삭제 - 댓글인지 대댓글인지 구분
	public void andDeleteComment(HttpServletRequest req, HttpServletResponse res){
		logger.info("controller : andDeleteComment메소드 호출");
		//front : key는 "p_comment_step" && value는 숫자를 가져오면 된다. (comment_step는 댓글의 시퀀스 번호임)
		Map<String,Object> pmap = new HashMap<>();
		//값을 넣어줌
		pmap.put("pr_comment_step", req.getParameter("p_comment_step"));
		String result = itemLogic.deleteComment(pmap);
	}
	
	//댓글 수정 - 댓글인지 대댓글인지 구분
	public void updateComment(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : updateComment메소드 호출");
		//front : key는 "pr_comment_step" && value는 숫자를 가져오면 된다. (comment_step는 댓글의 시퀀스 번호임)
		//        key는 "pr_comment_msg" && value는 수정한 대화 내용
		////한글 처리
		//HashMapBinder hmb = new HashMapBinder(req);
		//Map<String,Object> pmap = new HashMap<>();
		//hmb.bind(pmap);
		//String result = itemLogic.updateComment(pmap);
		////여기에는 result가 들어가는데 "true"면 댓글이 잘 삭제되고, "false"이면 해당 댓글이 존재하지 않는 다는 것임(상품이 없던가, 댓글이 없는 거겠지) 
		////- 재로딩 처리해서 없는 페이지면 다시 목록으로, 있는 페이지라면 보여주면 되겠지
		//AjaxDataPrinter.out(res,result);
		
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		//pmap.put("pr_comment_step",223);
		//pmap.put("pr_comment_msg","호호로로로로로로로롤");
		String result = itemLogic.updateComment(pmap);
		////여기에는 result가 들어가는데 "true"면 댓글이 잘 삭제되고, "false"이면 해당 댓글이 존재하지 않는 다는 것임(상품이 없던가, 댓글이 없는 거겠지) 
		////- 재로딩 처리해서 없는 페이지면 다시 목록으로, 있는 페이지라면 보여주면 되겠지
		AjaxDataPrinter.out(res,result);

	}
	public ModelAndView itemUploadPage(HttpServletRequest req, HttpServletResponse res) {
		logger.info("controller : itemUploadPage메소드 호출");
		ModelAndView mav = new ModelAndView("/itemUpload/itemUpload.jsp");
		return mav;
	}
	//사용자가 상품을 등록 시에
	public void insertItem(HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("controller : insertItem메소드 호출");
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		HttpSession session = req.getSession();
		Map<String, Object> login = (Map<String, Object>)session.getAttribute("login");
		String mem_nickname = (String)login.get("MEM_NICKNAME");
		pmap.put("pr_SELLER_NICKNAME", mem_nickname);
		hmb.multiBind(pmap);
		logger.info("==============================" + pmap);
		int bm_no = 0;
		bm_no = itemLogic.insertItem(pmap);
		try {
			//메소드 실행 후 서버에 사진이 업로드되기 전에 redirect 되면 사진이 엑박으로 뜸 그래서 2초 후 redirect되도록 sleep걸어둠
			Thread.sleep(2000);
			res.sendRedirect("/item/selectItemDetail.nds?pr_bm_no="+bm_no);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		//front : key는 pr_BM_TITLE   /   pr_BM_CONTENT  /  pr_BM_PRICE  /   pr_SELLER_NICKNAME  /  pr_CATEGORY_NAME  
		//      value는   제목                 내용              가격                닉네임                  카테고리         
		//        key는 "Img1" "img2" ....
		//ModelAndView mav = new ModelAndView();
		////한글 처리
		//Map<String,Object> pmap = new HashMap<>();
		//hmb.multiBind(pmap);
		////사이즈 초과시 에러를 전송시킴
		//if(pmap.containsKey("error")) {
		//	System.out.println(pmap.get("error"));
		//	//페이지 전송
		//	mav.setViewName("itemTest");
		//	return mav;
		//}
		////상품의 내용, 상품의 사진들을 저장한다.
		////페이지 전송
		//mav.setViewName("itemTest");
		//return mav;
		//pmap.put("pr_BM_TITLE","내용" );
		//pmap.put("pr_BM_CONTENT","내용" );
		//pmap.put("pr_BM_PRICE",3000);
		//pmap.put("pr_SELLER_NICKNAME","바나나" );
		//pmap.put("pr_CATEGORY_NAME","기타" );
		//사이즈 초과시 에러를 전송시킴
		/*if(pmap.containsKey("error")) {
			System.out.println(pmap.get("error"));
			//페이지 전송
			mav.setViewName("itemTest");
			return mav;
		}
		//상품의 내용, 상품의 사진들을 저장한다.
		itemLogic.insertItem(pmap);
		//페이지 전송
		mav.setViewName("itemTest");*/
	}
	
	
	
}