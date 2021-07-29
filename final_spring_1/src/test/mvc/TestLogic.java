package test.mvc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class TestLogic {
	
	// setter 객체 주입법으로 객체를 주입받는다.
	TestDao testDao = null;

	Logger logger = Logger.getLogger(TestLogic.class);
	
	public List<Map<String, Object>> test() {
		logger.info("로직의 test 메소드 호출 성공!!");
		List<Map<String, Object>> zipCodeList = new ArrayList<Map<String,Object>>();
		zipCodeList = testDao.test();
		return zipCodeList;
	}
	
	// 사용자의 쿠키에 저장된 MY_ZIP에 해당하는 SIGU를 가져오자.
	public String checkSIGU(int MY_ZIP) {
		logger.info("checkSIGU 메소드 호출 성공!!");
		String sigu = testDao.checkSIGU(MY_ZIP);
		return sigu;
	}
	
	
	public void setTestDao(TestDao testDao) {
		this.testDao = testDao;
	}
}
