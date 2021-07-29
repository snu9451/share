package errand.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ErrandLogic {
   Logger logger = Logger.getLogger(ErrandLogic.class);
   private ErrandDao errandDao = null;
   public void setErrandDao(ErrandDao errandDao) {
      this.errandDao = errandDao;
   }
   public List<Map<String, Object>> selectErrandRecord(Map<String, Object> pmap) {
      logger.info("logic : selectErrandRecord 호출 성공");
      List<Map<String,Object>> errandRecord = null;
      errandRecord = errandDao.selectErrandRecord(pmap);
      return errandRecord;
   }
   /* /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/작성자:신우형\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ */
//	public Map<String, Object> getErrand(Map<String, Object> pmap) {
//		Map<String, Object> rmap = new HashMap<String, Object>();
//		rmap = errandDao.getErrand(pmap);
//		logger.info(rmap);
//		return rmap;
//	}
	public void insertErrand(Map<String, Object> pmap) {
		logger.info("logic : insertErrand 호출 성공");
		errandDao.insertErrand(pmap);
	}
	public void insertErrandDenied(Map<String, Object> pmap) {
		logger.info("logic : insertErrandDenied 호출 성공");
		errandDao.insertErrandDenied(pmap);
	}
	public void insertErrandInfo(Map<String, Object> pmap) {
		logger.info("logic : insertErrandInfo 호출 성공");
		errandDao.insertErrandInfo(pmap);
	}
						/* 확인했으면 주석을 지우셔도 됩니다. */
	/* \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ */
	public void errandRecordUpdate(Map<String, Object> pmap) {
		logger.info("logic : errandRecordUpdate 호출 성공");
		errandDao.errandRecordUpdate(pmap);
	}
	
	public void updateErrandInfo(Map<String, Object> pmap) {
		logger.info("logic : updateErrandInfo 호출 성공");
		errandDao.updateErrandInfo(pmap);
	}
	
	public void updateErrandItemPriceNds(Map<String, Object> pmap) {
		logger.info("logic : updateErrandItemPriceNds 호출 성공");
		errandDao.updateErrandItemPriceNds(pmap);
	}
	
	public void updateErrandFinish(Map<String, Object> pmap) {
		logger.info("logic : updateErrandFinish 호출 성공");
		errandDao.updateErrandFinish(pmap);
	}

	public List<Map<String, Object>> jsonGetErrand(Map<String, Object> pmap) {
		List<Map<String, Object>> rmap = null;
		rmap = errandDao.jsonGetErrand(pmap);
		logger.info(rmap);
		return rmap;
	}

	public Map<String, Object> jsonGetErrandInfo(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = errandDao.jsonGetErrandInfo(pmap);
		logger.info(rmap);
		return rmap;
	}
}