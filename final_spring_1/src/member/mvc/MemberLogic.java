package member.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.log4j.Logger;

public class MemberLogic {

	private MemberDao memberDao = null;
	Logger logger = Logger.getLogger(MemberLogic.class);
	
	
	
	
	
	public void setMemberDao(MemberDao memberDao) {
		logger.info("asdfasdfasdfdsfsfadsfs");
		this.memberDao = memberDao;
	}


	public List<Map<String, Object>> selectMemberList() {
		List<Map<String, Object>> memberList = new ArrayList<Map<String,Object>>();
		memberList = memberDao.selectMemberList();
		return memberList;
	}
	public Map<String, Object> selectMember(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = memberDao.selectMember(pmap);
		logger.info(rmap);
		return rmap;
	}
	public int uiToSession(Map<String, Object> pmap) {
		int result = 0;
		result = memberDao.uiToSession(pmap);
		logger.info("로그인 처리 결과::uiToSession ===> "+result);
		return result;
	}

	
	


	public Map<String, Object> selectOneBySession(String sessionValue) {
		Map<String, Object> rmap = null;
		rmap = memberDao.selectOneBySession(sessionValue);
		return rmap;
	}

	public Map<String, Object> jsonSelectMember(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = memberDao.jsonSelectMember(pmap);
		logger.info(rmap);
		return rmap;
	}
/* ===========================================================================
	아 이 디   저 장   또 는   자 동 로 그 인   구 현 - NDS_SKEY 발급 또는 만료일 갱신
=========================================================================== */ 
//	public int saveId(Map<String, Object> pmap) {
//		int result = 0;
//		result = memberDao.saveId(pmap);
//		return result;
//	}
//	public int setAutoLogin(Map<String, Object> pmap) {
//		int result = 0;
//		result = memberDao.setAutoLogin(pmap);
//		return result;
//	}

	
	public int selectIsMemberPw(Map<String, Object> pmap) {
		int result = 0;
		logger.info(memberDao);
		result = memberDao.selectIsMemberPw(pmap);
		return result;
	}

	public int selectIsMember(Map<String, Object> pmap) {
		int result = 0;
		result = memberDao.selectIsMember(pmap);
		return result;
	}


	public String getRandomCode(String option, int length) {
		String randomCode = null;
		ArrayList<String> result = new ArrayList<String>();
		String[] eng =  {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		String[] eng2 = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		Random r = new Random();
		for(int j=0; j<length; j++) {
			// 숫자로만 구성된 인증코드를 생성하는 경우
			int which = 0;
			if("ON".equals(option)) {
				which = 0;
			} else if("NUL".equals(option)) {
				which = r.nextInt(3);				
			}
			// 숫자
			if(which == 0) {
				// 0부터 9까지 중 랜덤한 숫자를 가져와줘.
				int s = r.nextInt(10);
				result.add(String.valueOf(s));
			}
			// 영어 대문자
			else if(which == 1) {
				// 대문자 배열 중 몇번째 방의 문자를 가져올거니?
				int i = r.nextInt(26);
				result.add(eng[i]);
			}
			// 영어 소문자
			else if(which == 2) {
				// 소문자 배열 중 몇번째 방의 문자를 가져올거니?
				int k = r.nextInt(26);
				result.add(eng2[k]);
			}
		}
		StringBuilder sb = new StringBuilder();
		for(int index=0; index<length; index++) {
			sb.append(result.get(index));
		}
		randomCode = sb.toString();
		return randomCode;
	}


	public int updateMember(Map<String, Object> pmap) {
		int result = 0;
		// 변경되는 항목이 [gubun]닉네임/비밀번호/사진(img)/active(활동중->탈퇴)/보유코인(deposit)인 경우
		// 이메일로 제한조건을 걸어 update할 것이므로
		result = memberDao.updateMember(pmap);
		return result;
	}


	public int updatePw(Map<String, Object> pmap) {
		int result = 0;
		result = memberDao.updatePw(pmap);
		return result;
	}


	public int updateActive(Map<String, Object> pmap) {
		int result = 0;
		result = memberDao.updateActive(pmap);
		return result;
	}


	public int withdraw(Map<String, Object> pmap) {
		int result = 0;
		result = memberDao.withdraw(pmap);
		return result;
	}


	public Map<String, Object> selectEmail(Map<String, Object> pmap) {
		Map<String, Object> rmap = null;
		rmap = memberDao.selectEmail(pmap);
		return rmap;
	}
	public Map<String, Object> selectNickName(Map<String, Object> pmap) {
		//{mem_nickname=재훈재훈}
		Map<String, Object> rmap = null; //돌려받을 맵 선언
		rmap = memberDao.selectNickName(pmap);
		return rmap;
	}


	public int insertMember(Map<String, Object> pmap) {
		int result = 0;
		result = memberDao.insertMember(pmap);
		return result;
	}


	public Map<String, Object> selectMemberAdmin(Map<String, Object> pmap) {
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap = memberDao.selectMemberAdmin(pmap);
		logger.info(rmap);
		return rmap;
	}


	public List<Map<String, Object>> myWalletRecord(Map<String, Object> pmap) {
		List<Map<String, Object>> walletRec = null;
		walletRec = memberDao.myWalletRecord(pmap);
		logger.info(pmap);
		logger.info(walletRec);
		return walletRec;
	}
	
	//마이페이지 - 찜 목록 조회
	public List<Map<String, Object>> selectMyLike(Map<String, Object> pmap) {
		logger.info("Logic : selectMyLike 메소드 호출");
		logger.info(pmap);
		return memberDao.selectMyLike(pmap);
	}
	public List<Map<String, Object>> sellList(Map<String, Object> pmap) {
		logger.info("Logic : sellList 메소드 호출");
		logger.info(pmap);
		return memberDao.sellList(pmap);
	}
	//마이페이지 - 찜 목록 삭제
	public void deleteMyLike(Map<String, Object> pmap) {
		logger.info("Logic : deleteMyLike 메소드 호출");
		logger.info(pmap);
		memberDao.deleteMyLike(pmap);
	}
	


	public int insertCoinTrans(Map<String, Object> pmap) {
		int result = 0;
		logger.info(pmap);
		result = memberDao.insertCoinTrans(pmap);
		logger.info(result);
		return result;
	}


	public List<Map<String, Object>> getMyTrade(Map<String, Object> pmap) {
		logger.info("Logic getMyTrade 호출성공");
		List<Map<String,Object>> tradeRec = null;
		tradeRec = memberDao.getMyTrade(pmap);
		
		return tradeRec;
	}

	/* 마이페이지 중고거래 내역 삭제 */
	public void deleteTradeRec(Map<String, Object> pmap) {
		logger.info("Logic deleteTradeRec 호출성공");
		memberDao.deleteTradeRec(pmap);
		
	}
	
	public void starRatingGrant(Map<String, Object> pmap) {
	      logger.info("starRatingGrant 호출성공");
	   memberDao.starRatingGrant(pmap);
	}



	public List<Map<String, Object>> errandSelect(Map<String, Object> pmap) {
		List<Map<String, Object>> pmap1 = null;
		pmap1 = memberDao.errandSelect(pmap);
		return pmap1;
	}

	public List<Map<String, Object>> rankList(Map<String, Object> pmap){
		logger.info("Logic : rankList메소드 호출");
		List<Map<String, Object>> rankList = memberDao.rankList(pmap);
		return rankList;
	}


	// 테스트용 메인
//	public static void main(String[] args) {
//		System.out.println(new MemberLogic().getRandomCode("ON", 6));
//		System.out.println(new MemberLogic().getRandomCode("NUL", 15));
//	}
	



	
}
