<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<span class="total_rec coin2"> 전체 : (inserthere) </span>
<table class="like_tb" id="products">
	<form action="" id="setRows">
		<input type="hidden" name="rowPerPage" value="4" id="rowPerPage">
	</form>
	<thead>
		<tr>
			<th scope="cols" width="15%"></th>
			<th scope="cols" width="25%"></th>
			<th scope="cols" width="35%"></th>
			<th scope="cols" width="25%"></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="divider">글번호 inserthere</td>
			<td class="divider_img"><a href="http://naver.com"
				style="color: black"><img id="item_image"
					src="./assets/img/item/inserthere"></a></td>
			<td class="divider_con"><a href="http://naver.com"
				style="color: black">inserthere</a></td>
			<td class="divider">등록일 inserthere<br>inserthere원<br>
				<a href="#" data-toggle="modal" data-target="">
					<button type="button" class="btn btn-danger btn-sm">삭제하기</button>
				</a>
			</td>
		</tr>
	</tbody>
</table>