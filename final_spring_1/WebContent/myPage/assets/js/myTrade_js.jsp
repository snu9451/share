<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<script type="text/javascript">
  /* ============================ 페이징처리 함수 시작 ====================================*/
  var $setRows = $("#setRows");

  $setRows.submit(function (e) {
    e.preventDefault();
    var rowPerPage = $("#rowPerPage").val() * 1;
    // 1 을  곱하여 문자열을 숫자형로 변환

    $("#nav").remove();
    var $products = $("#products");

    $products.after('<div id="nav">');

    var $tr = $($products).find("tbody tr");
    var rowTotals = $tr.length;

    var pageTotal = Math.ceil(rowTotals / rowPerPage);
    var i = 0;

    for (; i < pageTotal; i++) {
      $('<a href="#"></a>')
        .attr("rel", i)
        .html(i + 1)
        .appendTo("#nav");
    }
    $tr.addClass("off-screen").slice(0, rowPerPage).removeClass("off-screen");

    var $pagingLink = $("#nav a");
    $pagingLink.on("click", function (evt) {
      evt.preventDefault();
      var $this = $(this);
      if ($this.hasClass("active")) {
        return;
      }
      $pagingLink.removeClass("active");
      $this.addClass("active");
      // 0 => 0(0*4), 4(0*4+4)
      // 1 => 4(1*4), 8(1*4+4)
      // 2 => 8(2*4), 12(2*4+4)
      // 시작 행 = 페이지 번호 * 페이지당 행수
      // 끝 행 = 시작 행 + 페이지당 행수

      var currPage = $this.attr("rel");
      var startItem = currPage * rowPerPage;
      var endItem = startItem + rowPerPage;
      $tr
        .css("opacity", "0.0")
        .addClass("off-screen")
        .slice(startItem, endItem)
        .removeClass("off-screen")
        .animate(
          {
            opacity: 1,
          },
          300
        );
      console.log("5");
    });

    $pagingLink.filter(":first").addClass("active");
  });

  $setRows.submit();
  /* ============================ 페이징처리 함수 끝 ====================================*/
  
  $(document).on('ready',function () {
    /////////////////구매내역 판매내역 active///////////////
    $(".buy").click(function () {
      $(".sell").removeClass("active");
      $(this).addClass("active");
    });
    $(".sell").click(function () {
      $(".buy").removeClass("active");
      $(this).addClass("active");
    });
  });
  
  /* 게시물 개수 나타내기위한 변수 선언 */
  let count;
  
  
  /*삭제하기 버튼 이벤트*/
  let filter;//구매내역 or 판매내역을 구분하기 위한 변수
  function deleteAction(deleteBtn, filter){
		  $(deleteBtn).click(function(){
			  
			  //삭제하기 버튼
			  let delBtn = $(this);
			  
			  //클릭한 삭제하기 버튼의 <tr>태그
			  let tr = delBtn.parent().parent().parent();
			  
			  //게시글 번호
			  let bm_no = tr.find('#bm_no').text();
			  
			  deleteModal(filter, bm_no);
		  })
  }
  
  
  /* 판매내역 불러오기 */
  function sellAction() {
    $.ajax({
      url: "/member/selectMyTrade.nds?gubun=sel",
      success: function (data) {
        //@data-json,xml,html,text
        //페이지에 나타나는 게시물 개수
        count = JSON.stringify(data.length);
        
        //상품가격
        let bm_price;
        
        let seller_list = "";
        if(data.length <= 0) {
			  seller_list +="<div class='mt-3 text-center'>"
			  seller_list +="	<span style='font-size: 100px;'>"
			  seller_list +="		<i class='fas fa-shopping-basket' style='color: #627ea4;'></i>"
			  seller_list +="	</span>"
			  seller_list +="	<h3>"
			  seller_list +="		거래내역이 존재하지 않습니다."
			  seller_list +="	</h3>"
			  seller_list +="</div>"
	          $(".trade_bottom").empty();
	          $("#forNoRecord").html(seller_list);
        } else{
	        for (i = 0; i < data.length; i++) {
	        	let status = data[i].BM_STATUS;
	        	bm_price = data[i].BM_PRICE.toLocaleString();
		          seller_list += "<tr>";
		          seller_list += "	<td class='divider'>글번호 <span id='bm_no'>" + data[i].BM_NO + "</span></td>";
		          seller_list += "	<td class='divider_img'><a href='http://localhost:9696/item/selectItemDetail.nds?pr_bm_no="+data[i].BM_NO+"'";
		          seller_list += "		style='color: black'><img id='item_image'";
		          seller_list += "			src=../itemUpload/assets/img/itemupload/" + data[i].BI_FILE +"></a></td>";
		          seller_list += "	<td class='divider_con'><a href='http://localhost:9696/item/selectItemDetail.nds?pr_bm_no="+data[i].BM_NO+"'";
		          seller_list += "		style='color: black; font-size: 20px;'>" + data[i].BM_TITLE + "</a></td>";
		          seller_list += "	<td class='divider'>등록일: " + data[i].BM_DATE + "<br><span class='bm_price'>" + bm_price +"</span>원<br>";
	          	//상품 거래 상태 (판매중 or 거래중 or 판매완료)
	        	if(status == 'N'){
	        		status = '';
	        		console.log('N');
	        		status = '판매중';
	        		seller_list += "		<button type='button' id='state' class='btn btn-warning btn-sm state' disabled>"+status+"</button> <br>";
	        	} else if (status == 'S') {
	        		status = '';
	        		console.log('S');
	        		status = '거래중';
	        		seller_list += "		<button type='button' id='state' class='btn btn-primary btn-sm state' disabled>"+status+"</button> <br>";
	        	} else if(status == 'C') {
	        		status = '';
	        		console.log('C');
	        		status = '판매완료';
	        		seller_list += "		<button type='button' id='state' class='btn btn-danger btn-sm state' disabled>"+status+"</button> <br>";
	        	}
	          seller_list += "		<a href='#' data-toggle='modal' data-target=''>";
	          seller_list += "			<button type='button' id='editBtn' class='editBtn btn btn-primary btn-sm'>수정하기</button>";
	          seller_list += "		</a>";          
	          seller_list += "		<a href='#' data-toggle='modal' data-target=''>";
	          seller_list += "			<button type='button' id='deleteBtn' class='deleteBtn btn btn-danger btn-sm'>삭제하기</button>";
	          seller_list += "		</a>";
	          seller_list += "	</td>";
	          seller_list += "</tr>";
	        }////////////////////// end of for
        $("#forNoRecord").empty();
        $(".trade_bottom").html(seller_list);
        }
        //페이지구분(판매내역)
        filter = 'sel';
        
        //삭제하기 버튼
  	  	let deleteBtn = $(".deleteBtn");
  	  	deleteAction(deleteBtn, filter);
  	  	
  	  	//수정하기 버튼
  	  	let editBtn = $(".editBtn");
  	  	editAction(editBtn);
  	  	
  	  	//게시물 개수 보여주기
  	  	$("#itemCount").text("");
  	  	$("#itemCount").text("전체: "+count);
      },
      error: function (e) {
        //@param-XMLHttpRequest
      },
    });
  }
  
  
  /* 구매내역 불러오기 */
  function buyAction() {
    $.ajax({
      url: "/member/selectMyTrade.nds?gubun=buy",
      success: function (data) {
        //@data-json,xml,html,text
        count = JSON.stringify(data.length);
        //상품가격
        let bm_price;
        
        let buyer_list = "";
        if(data.length <= 0) {
			buyer_list +="<div class='mt-3 text-center'>"
			buyer_list +="	<span style='font-size: 100px;'>"
			buyer_list +="		<i class='fas fa-shopping-basket' style='color: #627ea4;'></i>"
			buyer_list +="	</span>"
			buyer_list +="	<h3>"
			buyer_list +="		거래내역이 존재하지 않습니다."
			buyer_list +="	</h3>"
			buyer_list +="</div>"
        	$(".trade_bottom").empty();
        	$("#forNoRecord").html(buyer_list);
        } else{
	        for (i = 0; i < data.length; i++) {
	          bm_price = data[i].BM_PRICE.toLocaleString();
	          buyer_list += "<tr>";
	          buyer_list += "	<td class='divider'>글번호 <span id='bm_no'>" + data[i].BM_NO + "</span></td>";
	          buyer_list += "	<td class='divider_img'><a href='http://localhost:9696/item/selectItemDetail.nds?pr_bm_no="+data[i].BM_NO+"'";
	          buyer_list += "		style='color: black'><img id='item_image'";
	          buyer_list += "			src=../itemUpload/assets/img/itemupload/" + data[i].BI_FILE + "></a></td>";
	          buyer_list += "	<td class='divider_con'><a href='http://localhost:9696/item/selectItemDetail.nds?pr_bm_no="+data[i].BM_NO+"'";
	          buyer_list += "		style='color: black; font-size: 20px;'>" + data[i].BM_TITLE + "</a></td>";
	          buyer_list += "	<td class='divider'>등록일: " + data[i].BM_DATE + "<br>" + bm_price +"원<br>";
	          buyer_list += "		<a href='#' data-toggle='modal' data-target=''>";
	          buyer_list += "			<button type='button' id='deleteBtn' class='btn btn-danger btn-sm deleteBtn'>삭제하기</button>";
	          buyer_list += "		</a>";
	          buyer_list += "	</td>";
	          buyer_list += "</tr>";
	        }////////////////////// end of for
        $("#forNoRecord").empty();
        $(".trade_bottom").html(buyer_list);
        }
      	//페이지구분(구매내역)
        filter = 'buy';
      	
        //삭제하기 버튼
  	  	let deleteBtn = $(".deleteBtn");
  	  	deleteAction(deleteBtn, filter);
  	  	
  	  	//게시물 개수 보여주기
  	  	$("#itemCount").text("");
  	  	$("#itemCount").text("전체: "+count);
      },
      error: function (e) {
        //@param-XMLHttpRequest
      },
    });
  }
  
  /* 삭제 모달창 */
  function deleteModal(filter, bm_no){
	  console.log('deleteModal');
	  //삭제모달 나타내기
	  $("#delete").modal('show');
	  
	  //모달이 브라우저에 나타났을 때 실행되는 함수
	  $("#delete").on('shown.bs.modal', function(){
		  console.log('deleteModal shown');
		  
		  //모달창에 있는 [확인]버튼 클릭 이벤트
		  $("#btn_delete").click(function(){
			 console.log('click delete confirm');
			 console.log("filter: "+filter+" no: "+bm_no);
    			  $.ajax({
    			  type:"POST",
    			  data:{"br_sel_buy":filter, "pr_bm_no":bm_no},
				  url: "/member/deleteTradeRec.nds",
				  success: function(){
					  //페이지 새로고침
					  location.reload();
				  }
			  });
		  });
	  });
  }
  
  /* 수정하기 버튼 이벤트 */
  function editAction(editBtn){
	  editBtn.click(function(){
		  //수정하기 버튼
		  let ediBtn = $(this);
		  
		  //클릭한 수정하기 버튼의 <tr>태그
		  let tr = ediBtn.parent().parent().parent();

		  //게시글 번호
		  let bm_no = tr.find('#bm_no').text();
				  
		  //모달 show
		  $("#edit").modal('show');
		  
		  //모달이 브라우저에 나타났을 때 실행되는 함수
		  $("#edit").on('shown.bs.modal', function(){
			  console.log('editModal shown');
			  
			  //모달창에 있는 [확인]버튼 클릭 이벤트
			  $("#btn_edit").click(function(){
				 console.log('click edit confirm');
				 location.href = "http://localhost:9696/item/editItem.nds?pr_bm_no="+bm_no;
				  });
			  });
		  });
	  }

</script>
