package etc.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class EtcDao {
	Logger logger = Logger.getLogger(EtcDao.class);
	
	private SqlSessionTemplate sqlSessionTemplate = null;
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

 // 카테고리 불러오기
	public List<String> selectCategory() {
		logger.info("selectCategory 메소드 호출");
		
		List<String> plist = new ArrayList<String>();
		plist = sqlSessionTemplate.selectList("selectcate");
		
		return plist;
	}

 //	검색어 자동완성(검색횟수(누적검색수 기준)가 10번이상인 것 중에서 상위 10개만)
	public List<Map<String, Object>> selectAutocompleteList(Map<String, Object> pmap) {
		logger.info("selectAutocompleteList 메소드 호출");

		List<Map<String, Object>> keyword = new ArrayList<Map<String,Object>>();
		logger.info("pmap ===> "+pmap);
		keyword = sqlSessionTemplate.selectList("selectAutocomple", pmap);
		logger.info("pmap ===> "+pmap);
		logger.info("keyword ===> "+keyword);
		return keyword;
	}

 // 검색 순위(검색횟수가 10이상인 검색어만 상위10개 조회)
	public List<String> selectWordList() {
		List<String> plist = new ArrayList<String>();
		plist = sqlSessionTemplate.selectList("selectWord");
		
		return plist;
	}
}