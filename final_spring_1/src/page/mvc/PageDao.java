package page.mvc;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class PageDao {
	Logger logger = Logger.getLogger(PageDao.class);
	private SqlSessionTemplate sqlSessionTemplate = null;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	
		
	public List<String> selectCategory() {
		logger.info("selectCategory 호출 성공.");
		List<String> category = null;
		category = sqlSessionTemplate.selectList("selectCategory");
		return category;
		
		
	}
}
