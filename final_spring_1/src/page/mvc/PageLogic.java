package page.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class PageLogic {
	private PageDao pageDao = null;
	Logger logger = Logger.getLogger(PageLogic.class);
	
	public Map<String,List<Map<String, Object>>> getMyPage (String memEmail) {
		logger.info("getMyPage 호출 성공.");
		Map<String,List<Map<String, Object>>> asdf = null;
		
		return;
	}
	
	
	public Map<String,List<Map<String, Object>>> getMemberPage (String memNickName) {
		logger.info("getMemberPage 호출 성공.");
		Map<String,List<Map<String, Object>>> asdf = null;
		
		return;
	}
	
	
	public Map<String,List<Map<String, Object>>> getAdminPage (String memEmail) {
		logger.info("getAdminPage 호출 성공.");
		Map<String,List<Map<String, Object>>> asdf = null;
		return;
	}
	
	public List<String> selectCategory(){
		logger.info("selectCategory 호출 성공.");
		List<String> category = null;
		
		return category;
	}
	
	public void setPageDao(PageDao pageDao) {
		this.pageDao = pageDao;
	}
	
}
