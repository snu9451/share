package errand.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ErrandDao {
   private SqlSessionTemplate sqlSessionTemplate = null;
   Logger logger = Logger.getLogger(ErrandDao.class);
   
   public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
      this.sqlSessionTemplate = sqlSessionTemplate;
   }
   
   public List<Map<String, Object>> selectErrandRecord(Map<String, Object> pmap){
      logger.info("dao : selectErrandRecord 호출 성공");
      List<Map<String, Object>> errandRecord = null;
      errandRecord = sqlSessionTemplate.selectList("selectErrand", pmap);
      return errandRecord;
   }
   /* /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/작성자:신우형\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ */
//	public Map<String, Object> getErrand(Map<String, Object> pmap) {
//		Map<String, Object> rmap = new HashMap<String, Object>();
//		rmap = sqlSessionTemplate.selectOne("getErrand", pmap);
//		logger.info("DAO rmap ===> "+rmap);
//		return rmap;
//	}

	public void insertErrand(Map<String, Object> pmap) {
		// updatePw라는 프로시저를 실행함.
		// 프로시저는 return이 없다. 따라서 pmap에서 직접 결과를 꺼내줘야 함.
		// 프로시저 호출 시에는 seleceOne 쓰든 selectList 쓰든 심지어는 update, delete 쓰든 상관 없는 것 같다.. -ㅁ-;
		logger.info("ErrandDao : insertErrand 호출 성공");
		sqlSessionTemplate.insert("insertErrand", pmap);
		logger.info(pmap);
	}

	public void insertErrandDenied(Map<String, Object> pmap) {
		logger.info("ErrandDao : insertErrandDenied 호출 성공");
		sqlSessionTemplate.insert("insertErrandDenied", pmap);
		logger.info(pmap);
	}

	public void insertErrandInfo(Map<String, Object> pmap) {
		logger.info("ErrandDao : insertErrandInfo 호출 성공");
		sqlSessionTemplate.insert("insertErrandInfo", pmap);
		logger.info(pmap);
	}
						/* 확인했으면 주석을 지우셔도 됩니다. */
	/* \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ */

	public void errandRecordUpdate(Map<String, Object> pmap) {
		logger.info("dao : errandRecordUpdate 호출 성공");
		sqlSessionTemplate.update("errandRecordUpdate", pmap);
	}

	public void updateErrandInfo(Map<String, Object> pmap) {
		logger.info("dao : updateErrandInfo 호출 성공");
		sqlSessionTemplate.update("updateErrandInfo", pmap);
	}

	public void updateErrandItemPriceNds(Map<String, Object> pmap) {
		logger.info("dao : updateErrandItemPriceNds 호출 성공");
		sqlSessionTemplate.update("updateErrandItemPriceNds", pmap);
	}

	public void updateErrandFinish(Map<String, Object> pmap) {
		logger.info("dao : updateErrandFinish 호출 성공");
		sqlSessionTemplate.update("updateErrandFinish", pmap);
	}

	public List<Map<String, Object>> jsonGetErrand(Map<String, Object> pmap) {
		List<Map<String, Object>> rmap = null;
		rmap = sqlSessionTemplate.selectList("jsonGetErrand", pmap);
		logger.info("DAO rmap ===> "+rmap);
		return rmap;
	}

	public Map<String, Object> jsonGetErrandInfo(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = sqlSessionTemplate.selectOne("jsonGetErrandInfo", pmap);
		logger.info("DAO rmap ===> "+rmap);
		return rmap;
	}

}