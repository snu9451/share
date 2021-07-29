package test.mvc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class TestDao {
	
	// setter 객체 주입법으로 객체를 주입받는다.
	SqlSessionTemplate sqlSessionTemplate = null;
	
	public List<Map<String, Object>> test() {
		List<Map<String, Object>> zipCodeList = new ArrayList<Map<String,Object>>();
		// 로그 및 DB 연동 테스트를 위해 ZipCode를 select함.
		zipCodeList = sqlSessionTemplate.selectList("selectZipCode");
		return zipCodeList;
	}
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public String checkSIGU(int MY_ZIP) {
		String sigu = sqlSessionTemplate.selectOne("checkSIGU", MY_ZIP);
		return sigu;
	}
}
