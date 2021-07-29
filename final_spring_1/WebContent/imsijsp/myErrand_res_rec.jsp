<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<span class="total_rec coin2"> 전체 : (inserthere) </span>
<table class="errand_tb" id="products">
	<form action="" id="setRows">
		<input type="hidden" name="rowPerPage" value="8" id="rowPerPage">
	</form>
	<thead>
		<tr>
			<th scope="cols" width="9%">선택</th>
			<th scope="cols" width="22%">날짜</th>
			<th scope="cols" width="42%">제목</th>
			<th scope="cols" width="15%">가격</th>
			<th scope="cols" width="12%">닉네임</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck1"> <label class="custom-control-label"
						for="customCheck1"></label>
				</div></td>
			<td>2021-06-19 12:49</td>
			<td>customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1
				for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문 돌려야함</td>
			<td>70000원</td>
			<td>기설123</td>
		</tr>
		<tr>
			<td><div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input"
						id="customCheck1"> <label class="custom-control-label"
						for="customCheck1"></label>
				</div></td>
			<td>글번호 inserthere</td>
			<td>customCheck1 for문 돌려야함 customCheck1 for문 돌려야함 customCheck1
				for문 돌려야함 customCheck1 for문 돌려야함 customCheck1 for문 돌려야함</td>
			<td>글번호 inserthere</td>
			<td>글번호 inserthere</td>
		</tr>
	</tbody>
</table>
				<div class="delete">
					<a href="#" data-toggle="modal" data-target="#selDelete">
						<button type="button" class="btn btn-danger">삭제</button>
					</a>
				</div>
<script>
var $setRows = $('#setRows');

 $setRows.submit(function (e) {
   e.preventDefault();
   var rowPerPage = $('#rowPerPage').val() * 1;
   // 1 을  곱하여 문자열을 숫자형로 변환


   $('#nav').remove();
   var $products = $('#products');

   $products.after('<div id="nav">');


   var $tr = $($products).find('tbody tr');
   var rowTotals = $tr.length;

   var pageTotal = Math.ceil(rowTotals / rowPerPage);
   var i = 0;

   for (; i < pageTotal; i++) {
     $('<a href="#"></a>')
       .attr('rel', i)
       .html(i + 1)
       .appendTo('#nav');
   }
   $tr.addClass('off-screen')
     .slice(0, rowPerPage)
     .removeClass('off-screen');

   var $pagingLink = $('#nav a');
   $pagingLink.on('click', function (evt) {
     evt.preventDefault();
     var $this = $(this);
     if ($this.hasClass('active')) {
       return;
     }
     $pagingLink.removeClass('active');
     $this.addClass('active');
     // 0 => 0(0*4), 4(0*4+4)
     // 1 => 4(1*4), 8(1*4+4)
     // 2 => 8(2*4), 12(2*4+4)
     // 시작 행 = 페이지 번호 * 페이지당 행수
     // 끝 행 = 시작 행 + 페이지당 행수

     var currPage = $this.attr('rel');
     var startItem = currPage * rowPerPage;
     var endItem = startItem + rowPerPage;
     $tr.css('opacity', '0.0')
       .addClass('off-screen')
       .slice(startItem, endItem)
       .removeClass('off-screen')
       .animate({ opacity: 1 }, 300);
     console.log("5");
   });

   $pagingLink.filter(':first').addClass('active');

 });

 $setRows.submit();
 </script>