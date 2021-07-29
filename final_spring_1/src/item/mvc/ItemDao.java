package item.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ItemDao {

	// MyBatis에서 제공하는 클래스. 스프링에 의해 객체주입을 받기 위해, 선언만 해둠.
	private SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ItemLogic.class);
	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		logger.info("SqlSessionTemplate 주입");
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	//최근상품,인기상품 클릭 시 해당하는 정렬순서로 상품목록을 조회한다.
	public List<Map<String, Object>> selectItemList(Map<String, Object> pmap) {
		logger.info("Dao :selectItemList메소드 호출");
		//프로시져 돌리기
		sqlSessionTemplate.selectList("proc_board_main",pmap);
		logger.info("pmap ===> "+pmap);
		//결과 값만 전송
		return (List<Map<String, Object>>)pmap.get("p_temp");
	}
	//사용자가 카테고리메뉴에서 카테고리 선택 시
	public List<Map<String, Object>> selectByCategory(Map<String, Object> pmap) {
		logger.info("Dao : selectByCategory메소드 호출");
		//프로시져 돌리기
		sqlSessionTemplate.selectList("proc_board_main_categori",pmap);
		logger.info("pmap ===> "+pmap);
		//결과 값만 전송
		return (List<Map<String, Object>>)pmap.get("p_temp");
	}
	public List<Map<String, Object>> rankList(Map<String, Object> pmap) {
		logger.info("Dao :rankList메소드 호출");
		sqlSessionTemplate.selectList("rankList", pmap);
		logger.info("rankList ===> "+pmap);
		return (List<Map<String, Object>>)pmap.get("p_temp");
	}
	//검색어를 입력하여 찾기
	public List<Map<String, Object>> selectBySearch(Map<String, Object> pmap) {
		logger.info("Dao : selectBySearch메소드 호출");
		//프로시져 돌리기
		sqlSessionTemplate.selectList("proc_board_search",pmap);
		logger.info("pmap ===> "+pmap);
		//결과 값만 전송
		return (List<Map<String, Object>>)pmap.get("p_temp");
	}
	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음 - 정보만
	public Map<String, Object> editItem(int pr_bm_no) {
		logger.info("Dao : editItem메소드 호출");
		Map<String, Object> map = new HashMap<>();
		//select문 돌림
		map = sqlSessionTemplate.selectOne("editItemContext",pr_bm_no);
		logger.info("map ===> "+map);
		//결과 값만 전송
		return map;
	}
	//사용자가 상품 수정 버튼 클릭 시 상품의 정보를 다 가져와야하니까 있음 - 사진만
	//상품의 사진만 가져옴 - 사용자가 상품하나를 자세히 볼 때
	public List<String> editItemImg(int pr_bm_no) {
		logger.info("Dao : editItemImg메소드 호출");
		List<String> list = new ArrayList(5);
		//select문 돌림
		list = sqlSessionTemplate.selectList("editItemImg",pr_bm_no);
		logger.info("list ===> "+list);
		//결과 값만 전송
		return list;
	}
	//사용자가 상품 수정 버튼의 수정 완료를 누른다면 상품이 업데이트 되어야함.
	public void updateItem(Map<String, Object> pmap, List<Map<String, Object>> itemImgs, int pr_bm_no) {
		logger.info("Dao : updateItem메소드 호출");
		//프로시져 사용 - 상품 정보 저장 
		sqlSessionTemplate.selectList("proc_board_update",pmap);
		logger.info("pmap ===> "+pmap);
		//이미지들 삭제 후 저장
		//삭제
		//sqlSessionTemplate.delete("itemImgdelete",pr_bm_no);
		//저장
		for(Map<String, Object> item: itemImgs) {
			item.put("bm_no",pr_bm_no);
			//등록된 상품 번호를 이용해서 사진을 넣고 insert문 돌림
			sqlSessionTemplate.insert("edit",item);
		}
		
	}
	//상품의 내용만 가져옴 - 사용자가 상품하나를 자세히 볼 때
	public List<Map<String, Object>> selectItemDetailContext(Map<String, Object> pmap) {
		logger.info("Dao : selectItemDetailContext메소드 호출");
		//프로시져 돌리기
		sqlSessionTemplate.selectList("proc_board_select",pmap);
		logger.info("pmap ===> "+pmap);
		//결과 값만 전송
		return (List<Map<String, Object>>)pmap.get("p_temp");
	}

	//상품에 대한 댓글들 가져옴
	public Map<String, Object> selectItemDetailComment(Map<String, Object> pmap) {
		logger.info("Dao : selectItemDetailComment메소드 호출");
		//프로시져 돌리기
		sqlSessionTemplate.selectList("proc_board_select_comments",pmap);
		logger.info("pmap ===> "+pmap);
		return pmap;
	}
	
	
	//상품 삭제 시
	public void deleteItem(Map<String, Object>  pmap) {
		logger.info("Dao : deleteItem메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_board_master_delete",pmap);
		logger.info("pmap ===> "+pmap);
	}
	//상품 판매 완료 처리 
	public String updateItemToConfirm(Map<String, Object> pmap) {
		logger.info("Dao : updateItemToConfirm메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_board_bm_status",pmap);
		logger.info("pmap ===> "+pmap);
		return pmap.get("result").toString();
	}
	//상품 찜하기
	public int likeItem(Map<String, Object> pmap) {
		logger.info("Dao : likeItem메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_my_like_change",pmap);
		logger.info("pmap ===> "+pmap);
		return Integer.parseInt(pmap.get("i_like").toString());		
	}
	//댓글 달기. 대댓글 달기
	public Map<String, Object> insertComment(Map<String, Object> pmap) {
		logger.info("Dao : insertComment메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_comment_insert",pmap);
		logger.info("pmap ===> "+pmap);
		return pmap;		
	}
	//댓글 or 대댓글 삭제
	public String deleteComment(Map<String, Object> pmap) {
		logger.info("Dao : deleteComment메소드 호출");
		//프로시져
		sqlSessionTemplate.selectOne("proc_comment_delete",pmap);
		logger.info("pmap ===> "+pmap);
		return pmap.get("result").toString();		
	}
	//댓글 or 대댓글 수정
	public String updateComment(Map<String, Object> pmap) {
		logger.info("Dao : updateComment메소드 호출");
		//프로시져
		sqlSessionTemplate.update("proc_comment_update",pmap);
		logger.info("pmap ===> "+pmap);
		return pmap.get("result").toString();		
	}
	//사용자가 상품을 등록 시에
	public int insertItem(Map<String, Object> pmap , List<Map<String, Object>> itemImgs ) {
		logger.info("Dao : insertItem메소드 호출");
		//프로시져 - 상품 등록 정보
		sqlSessionTemplate.insert("proc_board_insert",pmap);
		logger.info("pmap ===> "+pmap);
		//등록된 상품의 번호
		int result = Integer.parseInt(pmap.get("result").toString());
		for(Map<String, Object> item: itemImgs) {
			item.put("bm_no",result);
			//등록된 상품 번호를 이용해서 사진을 넣고 insert문 돌림
			sqlSessionTemplate.insert("edit",item);
		}
		logger.info(result);
		return result;
	}

	
}