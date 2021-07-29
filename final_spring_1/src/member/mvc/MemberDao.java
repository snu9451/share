package member.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class MemberDao {

	// MyBatis에서 제공하는 클래스. 스프링에 의해 객체주입을 받기 위해, 선언만 해둠.
	private SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(MemberLogic.class);
	
	
	
	
	
	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}







	public Map<String, Object> selectOneBySession(String sessionValue) {
		logger.info("selectOneBySession 메소드 호출 완료");
		Map<String, Object> rmap = null;
		rmap = sqlSessionTemplate.selectOne("selectOneBySession", sessionValue);
		return rmap;
	}
//	public int saveId(Map<String, Object> pmap) {
//		int result = 0;
//		// Update or Insert To Session (Table) ================================= [[ 프로시저1 ]]
//		result = sqlSessionTemplate.selectOne("uiToSession", pmap);
//		return result;
//	}
//	public int setAutoLogin(Map<String, Object> pmap) {
//		int result = 0;
//		// Update or Insert To Session (Table) ================================= [[ 프로시저1 ]]
//		result = sqlSessionTemplate.selectOne("uiToSession", pmap);
//		return result;
//	}






	public List<Map<String, Object>> selectMemberList() {
		List<Map<String, Object>> memberList = new ArrayList<Map<String,Object>>();
		memberList = sqlSessionTemplate.selectList("selectMemberList");
		return memberList;
	}







	public int updateMember(Map<String, Object> pmap) {
		int result = 0;
		result = sqlSessionTemplate.update("updateMember", pmap);
		logger.info(result);
		return result;
	}







	public int updatePw(Map<String, Object> pmap) {
		int result = 0;
		// updatePw라는 프로시저를 실행함.
		// 프로시저는 return이 없다. 따라서 pmap에서 직접 결과를 꺼내줘야 함.
		// 프로시저 호출 시에는 seleceOne 쓰든 selectList 쓰든 심지어는 update, delete 쓰든 상관 없는 것 같다.. -ㅁ-;
		sqlSessionTemplate.selectOne("updatePw", pmap);
		logger.info(pmap);
		result = Integer.parseInt(String.valueOf(pmap.get("result")));
		logger.info(result);
		return result;
	}







	public int updateActive(Map<String, Object> pmap) {
		int result = 0;
		// updatePw라는 프로시저를 실행함.
		// 프로시저는 return이 없다. 따라서 pmap에서 직접 결과를 꺼내줘야 함.
		sqlSessionTemplate.update("updateActive", pmap);
		result = Integer.parseInt(String.valueOf(pmap.get("result")));
		return result;
	}







	public int withdraw(Map<String, Object> pmap) {
		int result = 0;
		// 프로시저는 return이 없다. 따라서 pmap에서 직접 결과를 꺼내줘야 함.
		sqlSessionTemplate.update("withdraw", pmap);
		result = Integer.parseInt(String.valueOf(pmap.get("result")));
		return result;
	}







	public Map<String, Object> selectMember(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = sqlSessionTemplate.selectOne("selectMember", pmap);
		logger.info("DAO rmap ===> "+rmap);
		return rmap;
	}
	public int uiToSession(Map<String, Object> pmap) {
		int result = 0;
		sqlSessionTemplate.selectOne("uiToSession", pmap);
		result = Integer.parseInt(String.valueOf(pmap.get("result")));
		logger.info("result ====> "+result);
		return result;
	}







	public Map<String, Object> selectEmail(Map<String, Object> pmap) {
		return sqlSessionTemplate.selectOne("selectEmail",pmap);
	}
	public Map<String, Object> selectNickName(Map<String, Object> pmap) {
		return sqlSessionTemplate.selectOne("selectNickName",pmap);
	}







	public int selectIsMemberPw(Map<String, Object> pmap) {
		int result = 0;
		result = sqlSessionTemplate.selectOne("selectIsMemberPw", pmap);
		return result;
	}
	public int selectIsMember(Map<String, Object> pmap) {
		int result = 0;
		result = sqlSessionTemplate.selectOne("selectIsMember", pmap);
		return result;
	}







	public int insertMember(Map<String, Object> pmap) {
		int result = 0;
		result = sqlSessionTemplate.insert("insertMember", pmap);
		return result;
	}







	public Map<String, Object> selectMemberAdmin(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = sqlSessionTemplate.selectOne("selectMemberAdmin", pmap);
		logger.info("DAO rmap ===> "+rmap);
		return rmap;
	}







	public List<Map<String, Object>> myWalletRecord(Map<String, Object> pmap) {
		List<Map<String, Object>> walletRec = null;
		logger.info(pmap);
		walletRec= sqlSessionTemplate.selectList("myWalletRecord", pmap);
		logger.info(pmap.get("mem_email"));
		return walletRec;
	}


	
	
	//마이페이지 - 찜 목록 삭제
	public void deleteMyLike(Map<String, Object> pmap) {
		logger.info("Dao : deleteMyLike 메소드 호출");
		sqlSessionTemplate.delete("my_like_delete", pmap);
		logger.info("pmap ===> "+pmap);
		logger.info("pmap ===> "+pmap);
	}






	public int insertCoinTrans(Map<String, Object> pmap) {
		int result = 0;
		logger.info(pmap);
		result = sqlSessionTemplate.insert("insertCoinTrans", pmap);
		logger.info(result);
		return result;
	}

	
	public Map<String, Object> jsonSelectMember(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = sqlSessionTemplate.selectOne("jsonSelectMember", pmap);
		logger.info("DAO rmap ===> "+rmap);
		return rmap;
	}






	public List<Map<String, Object>> getMyTrade(Map<String, Object> pmap) {
		logger.info("Dao getMyTrade 호출성공");
		List<Map<String,Object>> tradeRec = null;
		tradeRec = sqlSessionTemplate.selectList("getMyTrade", pmap);
		
		return tradeRec;
	}






	/* 마이페이지 중고거래 내역 삭제 */
	public void deleteTradeRec(Map<String, Object> pmap) {
		logger.info("Dao deleteTradeRec 호출성공");
		sqlSessionTemplate.selectOne("deleteTradeRec",pmap);
		logger.info("pmap ===> "+pmap);
	}
	
	public void starRatingGrant(Map<String, Object> pmap) {
		logger.info("Dao starRatingGrant 호출성공");
		sqlSessionTemplate.update("star_rating_1",pmap);
		sqlSessionTemplate.update("star_rating_2",pmap);
	}








	public List<Map<String, Object>> errandSelect(Map<String, Object> pmap) {
		List<Map<String, Object>> pmap1 = null;
		logger.info(pmap);
		pmap1 = sqlSessionTemplate.selectList("selectUserErrand",pmap);
		logger.info(pmap1);
		return pmap1;
	}







	public List<Map<String, Object>> sellList(Map<String, Object> pmap) {
		logger.info("Dao : sellList 메소드 호출");
		List<Map<String, Object>> sellList = null;
		sellList = sqlSessionTemplate.selectList("selectUserSellList", pmap);
		logger.info("pmap ===> "+pmap);
		//결과 값만 전송
		return sellList;
	}

	public List<Map<String, Object>> rankList(Map<String, Object> pmap) {
		logger.info("Dao :rankList메소드 호출");
		sqlSessionTemplate.selectList("searchRank", pmap);
		logger.info("rankList ===> "+pmap);
		return (List<Map<String, Object>>)pmap.get("p_temp");
	}
	
	//마이페이지 - 찜 목록 조회
	public List<Map<String, Object>> selectMyLike(Map<String, Object> pmap) {
		logger.info("Dao : sselectMyLike 메소드 호출");
		//프로시져 돌리기
		sqlSessionTemplate.selectList("proc_my_like", pmap);
		
		logger.info("pmap ===> "+pmap);
		//결과 값만 전송
		return (List<Map<String, Object>>)pmap.get("p_temp");
	}



}
