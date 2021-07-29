package errand.mvc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;

import nds.util.AjaxDataPrinter;
import nds.util.HashMapBinder;

public class ErrandController extends MultiActionController{
   Logger logger = Logger.getLogger(ErrandController.class);
   private ErrandLogic errandLogic = null;
   public void setErrandLogic(ErrandLogic errandLogic) {
      this.errandLogic  = errandLogic;
   }
   //String mem_email_req = "banana@good.com";
   public void selectErrandRecord(HttpServletRequest req, HttpServletResponse res) throws Exception {
      logger.info("ctrl : selectErrandRecord 호출 성공");
      List<Map<String,Object>> errandRecord = null;
      Map<String,Object> pmap = new HashMap<>();      
      HashMapBinder hmb = new HashMapBinder(req);
      hmb.bindPost(pmap);
      HttpSession session = req.getSession();
      Map<String, Object> login = (Map<String, Object>)session.getAttribute("login");
      String mem_email = (String) login.get("MEM_EMAIL");
      if("req".equals((String)pmap.get("gubun"))) {
    	  pmap.put("mem_email_req", mem_email);
      } else if ("nds".equals((String)pmap.get("gubun"))) {
    	  pmap.put("mem_email_nds", mem_email);
      }
      //pmap.put("mem_email_req", mem_email_req);
      errandRecord = errandLogic.selectErrandRecord(pmap);
      ModelAndView mav = new ModelAndView();
      logger.info("errandRecord : "+errandRecord);
      mav.addObject("errandRecord", errandRecord);
      //where if test 가기전에 요청자, 수행자 email 체크 
      Gson g = new Gson();
      String jsondata = null;
      jsondata = g.toJson(errandRecord);
//      if(pmap.get("mem_email_req") != null ) {
//         mav.setViewName("myPage/myErrand_req_rec");
      AjaxDataPrinter.out(res, "application/json", jsondata);
      logger.info(jsondata);
      //logger.info("요청자 if문 : "+ pmap.get("mem_email_req"));
//      }else {
//         AjaxDataPrinter.out(res, "application/json", jsondata);
//         mav.setViewName("myPage/myErrand_res_rec");
//         logger.info("수행자 if문 : "+ pmap.get("mem_email_res"));
//      }
//      return mav;
         
   }
   /* /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/작성자:신우형\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ */
// 	public void getErrand(HttpServletRequest req, HttpServletResponse res) {
// 		HttpSession session = req.getSession();
// 		Map<String, Object> pmap = new HashMap<String, Object>();
// 		Map<String, Object> mvo = (Map<String, Object>)session.getAttribute("login");
// 		String mem_email = (String)mvo.get("MEM_EMAIL");
// 		pmap.put("mem_email", mem_email);
// 		Map<String, Object> rmap = errandLogic.getErrand(pmap);
// 		req.setAttribute("memberMap", rmap);
// 		RequestDispatcher rd = req.getRequestDispatcher("/myPage/chatroomNotice.jsp");
// 		try {
// 			rd.forward(req, res);
// 		} catch (ServletException e) {
// 			e.printStackTrace();
// 		} catch (IOException e) {
// 			e.printStackTrace();
// 		}
// 	}
	public void jsonGetErrand(HttpServletRequest req, HttpServletResponse res) {
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		logger.info(pmap);
		List<Map<String, Object>> rmap = errandLogic.jsonGetErrand(pmap);
		Gson g = new Gson();
		String data = g.toJson(rmap);
		AjaxDataPrinter.out(res, "application/json", data);
	}
	public void jsonGetErrandInfo(HttpServletRequest req, HttpServletResponse res) {
		Map<String, Object> pmap = new HashMap<String, Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bindPost(pmap);
		logger.info(pmap);
		Map<String, Object> rmap = errandLogic.jsonGetErrandInfo(pmap);
		Gson g = new Gson();
		String data = g.toJson(rmap);
		AjaxDataPrinter.out(res, "application/json", data);
	}
 	public void insertErrand(HttpServletRequest req, HttpServletResponse res) {
 		logger.info("insertErrand 메소드 호출 성공!");
 		Map<String, Object> pmap = new HashMap<String, Object>();
 		HashMapBinder hmb = new HashMapBinder(req);
 		hmb.bindPost(pmap);
 		errandLogic.insertErrand(pmap);
 	}
 	public void insertErrandDenied(HttpServletRequest req, HttpServletResponse res) {
 		logger.info("insertErrandDenied 메소드 호출 성공!");
 		Map<String, Object> pmap = new HashMap<String, Object>();
 		HashMapBinder hmb = new HashMapBinder(req);
 		hmb.bindPost(pmap);
 		errandLogic.insertErrandDenied(pmap);
 	}
 	public void insertErrandInfo(HttpServletRequest req, HttpServletResponse res) {
 		logger.info("insertErrandInfo 메소드 호출 성공!");
 		Map<String, Object> pmap = new HashMap<String, Object>();
 		HashMapBinder hmb = new HashMapBinder(req);
 		hmb.bindPost(pmap);
 		errandLogic.insertErrandInfo(pmap);
 	}
 						/* 확인했으면 주석을 지우셔도 됩니다. */
 	/* \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ */
 	
    public void errandRecordUpdate(HttpServletRequest req, HttpServletResponse res) throws Exception {
 	   logger.info("ctrl : errandRecordUpdate 호출 성공");
 	   Map<String,Object> pmap = new HashMap<>();      
 	   HashMapBinder hmb = new HashMapBinder(req);
 	   hmb.bindPost(pmap);
 	   HttpSession session = req.getSession();
 	   Map<String, Object> login = (Map<String, Object>)session.getAttribute("login");
 	   
 	   String mem_email = (String) login.get("MEM_EMAIL");
 	   if("req".equals((String)pmap.get("gubun"))) {
 		   pmap.put("mem_email_req", mem_email);
 		   logger.info("mem_req:"+mem_email);
 	   } else if ("nds".equals((String)pmap.get("gubun"))) {
 		   pmap.put("mem_email_nds", mem_email);
 		   logger.info("mem_nds:"+mem_email);
 	   }
 	   errandLogic.errandRecordUpdate(pmap);
    }
    
    public void updateErrandInfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
  	   logger.info("ctrl : updateErrandInfo 호출 성공");
  	   Map<String,Object> pmap = new HashMap<>();      
  	   HashMapBinder hmb = new HashMapBinder(req);
  	   hmb.bindPost(pmap);
  	   errandLogic.updateErrandInfo(pmap);
     }
    
    public void updateErrandItemPriceNds(HttpServletRequest req, HttpServletResponse res) throws Exception {
   	   logger.info("ctrl : updateErrandItemPriceNds 호출 성공");
   	   Map<String,Object> pmap = new HashMap<>();      
   	   HashMapBinder hmb = new HashMapBinder(req);
   	   hmb.bindPost(pmap);
   	   errandLogic.updateErrandItemPriceNds(pmap);
     }
    
    public void updateErrandFinish(HttpServletRequest req, HttpServletResponse res) throws Exception {
   	   logger.info("ctrl : updateErrandFinish 호출 성공");
   	   Map<String,Object> pmap = new HashMap<>();      
   	   HashMapBinder hmb = new HashMapBinder(req);
   	   hmb.bindPost(pmap);
   	   errandLogic.updateErrandFinish(pmap);
     }
    
}