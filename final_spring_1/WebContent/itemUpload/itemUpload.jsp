<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%
/* 	Map<String,Object> itemContext = null;
	List<String> imgs = null;
	if(request.getAttribute("item")!=null&&request.getAttribute("itemImgs")!=null){
		itemContext =(Map<String,Object>)request.getAttribute("item");
		//결과값[4.png] 사진
		imgs = (List<String>) request.getAttribute("itemImgs");
	} */
	
 	Map<String,Object> itemContext = null;
	itemContext =(Map<String,Object>)request.getAttribute("item");
	String[] array = null;
	array = (String[])request.getAttribute("array");
	


%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>내동생 - 상품 등록 페이지</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
<%@ include file="../itemUpload/source_h.jsp" %>
</head>
<body>
<script>
function insAction(){
	$('#f_insImg').submit();
	/* location.href='http://localhost:9696/mainPage/main_page.jsp'; */
}
</script>

  <!-- ========================================= ▼ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▼ ========================================= -->
<%@ include file="../common/header.jsp" %>
  <!-- ========================================= ▲ ＨＥＡＤＥＲ　ＳＥＣＴＩＯＮ ▲ ========================================= -->


  <!-- ======= 상품등록페이지 시작 ======= -->
  <section id="featured-services" class="featured-services">
    <div class="container" data-aos="fade-in">
      <div class="row">
        <div class="col-12 col-lg-12 d-flex align-items-stretch mb-5 mb-lg-0">
          <div class="icon-box1" data-aos="fade-in" data-aos-delay="50">
            <div class="top">
              <span class="title_section">
                <h2 class="title" style="font-weight: bold;">물품 등록 페이지</h2>
              </span>
            </div>
            <div class="middle">
              <h3 class="img_title" style="font-weight: bold; margin-left: 15px;">사진 등록</h3>
              <hr>
<%
			   if(itemContext != null){%>
              	<form  id="f_insImg" method="post" enctype="multipart/form-data" action="updateItem.nds">
              		<input type='hidden' name="pr_bm_no" value="<%= itemContext.get("BM_NO")%>" /> 
	          <%}
%>              
              <form  id="f_insImg" method="post" enctype="multipart/form-data" action="insertItem.nds">
              <div class="img_list">
				
              
              
             <%
               if(array == null){
		               	for(int i = 1 ; i <= 5 ; i++){%>
		                <div>
		                  <button type="button" id="delPic<%=i%>" class="btn btn-secondary btn-sm delPic<%=i%>">X</button>
		                  <input type='file' id="imgInput<%=i%>" accept="image/*" style="display: none;" name="img<%=i%>" />
		                  <label class="img_add" for="imgInput<%=i%>" >
	                  		<img class="img_upload" id="image_section<%=i%>" src="../itemUpload/assets/img/itemupload/default.png"/>
		                  </label>
		                </div>
               <%		}
               }else {
                		for(int i = 1 ; i <= 5 ; i++){%>
		                <div>
		                  <button type="button" id="delPic<%=i%>" class="btn btn-secondary btn-sm delPic<%=i%>">X</button>
		                  <input type='file' id="imgInput<%=i%>" accept="image/*" style="display: none;" name="img<%=i%>" />
		                  <label class="img_add" for="imgInput<%=i%>" >
		   	            <%  	if(array[i-1] != null){ %> 
		                  			<img class="img_upload" id="image_section<%=i%>" src="../itemUpload/assets/img/itemupload/<%=array[i-1] %>"/>
			           	<% 		}
		   	            		else{%>
		                  			<img class="img_upload" id="image_section<%=i%>" src="../itemUpload/assets/img/itemupload/default.png"/>
	           			<%  	} %>
		                  </label>
		                </div>
               <% 	} 
           		}%>
              </div>
            <div class="bottom">
              <h3 class="img_title" style="font-weight: bold; margin-left: 15px;">상세 정보 입력</h3>
              <hr>
              <div>
                <div class="item_info_title_section">
                  <h4 class="item_info_title">분류</h4>
                  <select name="pr_CATEGORY_NAME" id="essential3" class="form-select">
	            <% if(itemContext!=null){ %> 
                    <option selected><%=itemContext.get("CATEGORY_NAME")%></option>
	           	<% } else{ %>
                    <option selected>카테고리 선택</option>
	           	<% } %>
                    <option value="디지털기기">디지털기기</option>
                    <option value="가구">가구</option>
                    <option value="화장품">화장품</option>
                    <option value="유아동">유아동</option>
                    <option value="의류">의류</option>
                    <option value="도서">도서</option>
                    <option value="식물">식물</option>
                    <option value="스포츠">스포츠</option>
                    <option value="반려동물용품">반려동물용품</option>
                    <option value="기타">기타</option>
                  </select>
                  <h4 class="item_info_title" style="color: rgb(211, 69, 69); font-size: 16px;">필수 입력 사항입니다.</h4>
                </div>
              </div>
              <div class="item_info_title_price_section">
                <div class="item_info_title_section">
                  <h4 class="item_info_title">제목</h4>
                  
                    <% if(itemContext!=null){ %> 
                  		<input class="textbox_com" id="essential1" type="text" placeholder="&nbsp필수 입력 사항입니다." 
                  		value = "<%=itemContext.get("BM_TITLE")%>" name="pr_BM_TITLE" size="50" maxlength="50">
                  	<% } else{ %>
                  		<input class="textbox_com" id="essential1" name="pr_BM_TITLE" type="text" placeholder="&nbsp필수 입력 사항입니다." size="50" maxlength="50"> 
                  	<% } %>
                  	
                </div>
                <div class="item_info_price_section">
                  <h4 class="item_info_title">&nbsp&nbsp&nbsp가격</h4>
                  
                  	<% if(itemContext!=null){ %> 
                  		<input class="textbox_com" id="essential2" type="number" min="0" placeholder="&nbsp필수 입력 사항입니다." 
                  		value = "<%=Integer.parseInt(itemContext.get("BM_PRICE").toString())%>" name="pr_BM_PRICE" max="10000000">
                  	<% } else{ %>
	                  <input class="textbox_com" id="essential2" type="number" min="0" name="pr_BM_PRICE" placeholder="&nbsp필수 입력 사항입니다." max="10000000">
                  	<% } %>
                  	
                </div>
              </div>
                <div class="item_info_content_section">
                  <h4 class="item_info_title">내용</h4>
                     
                   <% if(itemContext!=null){ %> 
                     <textarea class="textarea" cols="100" name="pr_BM_CONTENT" rows="10" size="200" maxlength="200"><%= itemContext.get("BM_CONTENT") %></textarea>
                     <% } else{ %>
                     <textarea class="textarea" cols="100" name="pr_BM_CONTENT" rows="10" size="200" maxlength="200"></textarea>
                  <% } %>
                     
                </div>
            </form>
            </div>
            <div class="footer">
              <div class="item_submit">
			<% if(itemContext == null) { %>
                <button data-toggle="modal" data-target="#itemBoard" disabled="true" id="btn-submit" class="btn btn-primary">판매 등록</button>
			<%} else {%> 
                <button data-toggle="modal" data-target="#itemBoardEdit" disabled="true" id="btn-submit" class="btn btn-primary">게시글 수정</button>
			<% } %> 
                <button type="button" data-toggle="modal" data-target="#itemCancel" class="btn btn-danger">취소</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- 상품등록페이지 끝 -->




<!-- /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ -->
<%@ include file="../itemUpload/itemUpload_modal.jsp" %>
<!-- \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ▼ ＭＯＤＡＬ　ＰＡＲＴ ▼ \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ -->




  <!-- =============================================== ▼ ＳＣＲＩＰＴ  ▼ ================================================= -->
  <%@ include file="../itemUpload/source_f.jsp" %>
  <!-- =============================================== ▲ ＳＣＲＩＰＴ ▲ ================================================= -->

</body>

</html>