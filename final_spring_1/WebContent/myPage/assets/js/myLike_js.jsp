<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
////////////////좋아요 버튼////////////////////
  	<%-- $.ajax({ 
     	url : "/member/deleteMyLike.nds?bm_no="+s_bmno,
  		success : function(data) {
  			location.href = '/myPage/my_like.nds';
			str-= "<td id="
			str-= like<%=bm_no %>" class="divider"><i class="fas fa-heart likebutton"></i><br>No.
			<span style="font-weight : bold; font-size:25px;">
				<%=bm_no %></span></td>
 			str-= "<tr>"
			str-= "<td class="'divider'"><i class="'fas fa-heart likebutton'"></i><br>No."
			str-= "<span style="'font-weight : bold; font-size:25px;'">"
			str-= s_bmno
			str-= "</span></td>"
			str-= "<td class="'divider_img'">"
			str-= "<a href="'http://naver.com'"style="'color: black'"><img id="'item_image'"src="
			str-= "'../itemPage/assets/img/board_Img/'"
			str-= s_bifile
			str-= "></a></td>"
			str-= "<td class="'divider_con'"><a href="
			str-= "'http://naver.com'"
			str-= "style="'color: black'">"
			str-= s_bmtitle
			str-= "</a></td>"
			str-= "<td class="'divider'">등록일<br>"
			str-= s_bmdate
			str-= "<br><span style="'font-weight : bold; font-size:25px;'">"
			str-= s_bmprice
			str-= "</span>원</td>"
			str-= "</tr>"
		},
		error : function(e) {

		} 
  	}); --%>
/*   if ($(this).hasClass('active')) {
    $(this).removeClass('active');
  } else {
    $(this).addClass('active');
  } */


</script>