<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
let req_cnt = -1;
let nds_cnt = -1;
function reqAction() {
	$('.nds_errand_tb').hide();
	console.log("요청심부름1"+$('#nds_tbody_req').children().length);
	$.ajax({
		url : "myErrand_req_rec_FB.jsp",
		success : function(data) {//@data-json,xml,html,text
			$(".errand_FB").html(data);
			let str;
			let cnt = 0;
			if($(".errand_FB").find(".errand_tb").children("tbody").text().trim()=="") {
				str = "<tr><th colspan=\"6\">";
				str += "조회결과가 없습니다.";
				str += "</th>";
				str += "</tr>";
	        	$(".errand_FB").find(".errand_tb").children("tbody").append(str);
			}
			refArea.child("errand").child(mem_email).on('child_added',function(p_snapshot){
				refArea.child(p_snapshot.val()).child("errand").child(p_snapshot.key).once('value', function(snapshot){
					if($(".errand_FB").find(".errand_tb").children("tbody").children("tr").children("th").text().trim()!="")
						$(".errand_FB").find(".errand_tb").children("tbody").children("tr").remove();
					str = "<tr tr_id="+snapshot.key+">";
					str += "<td><button type=\"button\" class=\"btn btn-outline-danger btn-smq\">X</button></td>";
					str += "<td><span class=\"badge rounded-pill bg-danger text-white\">요청중</span></td>";
					str += "<td>"+snapshot.val().errand_request_date.substr(11,5)+"</td>";
					str += "<td>"+snapshot.val().errand_item+"</td>";
					str += "<td>"+snapshot.val().errand_total_price+"</td></tr>";
					$(".errand_FB").find(".errand_tb").children("tbody").append(str);
					$(".errand_FB").find(".total_rec.coin2").text(" 전체 : " + ++cnt);
					$("tr[tr_id="+snapshot.key+"]").find(".btn-outline-danger").off("click").on("click",function(){
						makeModal(snapshot.key,"선택한 심부름 요청을 취소하시겠습니까?",1,"네","아니요","심부름 취소");
					    $("#"+snapshot.key).find(".btn-primary").off("click").on("click",function(){
					    	refArea.child(p_snapshot.val()).child("errand").child(p_snapshot.key).remove();
					    	refArea.child("errand").child(mem_email).child(snapshot.key).remove();
							$(".errand_FB").find(".total_rec.coin2").text(" 전체 : " + --cnt);
					        makeModal("DEL"+snapshot.key,"심부름 요청이 취소되었습니다.");
					        $("#DEL"+snapshot.key).modal("show");
					        $("tr[tr_id="+snapshot.key+"]").remove();
					        if($(".errand_FB").find(".errand_tb").children("tbody").text().trim()=="") {
						        str = "<tr><th colspan=\"6\">";
								str += "조회결과가 없습니다.";
								str += "</th>";
								str += "</tr>";
					        	$(".errand_FB").find(".errand_tb").children("tbody").append(str);
					        }
					      });
					    $("#"+snapshot.key).modal("show");
					});
				});
			});
		},
		error : function(e) {//@param-XMLHttpRequest
		}
	});
	console.log('req_cnt(1)='+req_cnt);
	if($('#nds_tbody_req').children().length == 0){
		$.ajax({
			url : "http://localhost:9696/errand/selectErrandRecord.nds?gubun=req",
			success : function(data) {//@data-json,xml,html,text
				console.log(data);
				let str = "";
					$('#allcnt').html(data.length);
					
					if(data.length != req_cnt){
					
					for(let i=0; i<data.length; i++){
						if(data[i].ERRAND_STATUS == 'P'){
							console.log('p');
							str += "<tr><td>"
							str += "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" id=\"customCheck";
							str += data[i].ERRANDKEY;
							str += "\"> <label class=\"custom-control-label\" for=\"customCheck";
							str += data[i].ERRANDKEY;
							str += "\"></label></div>";
							str += "</td><td><span class=\"badge rounded-pill bg-warning text-dark\">";
							str += "진행중";
							str += "</span></td><td>";
							str += data[i].ERRAND_REQUEST_DATE;
							str += "</td><td>";
							str += data[i].ERRAND_ITEM;
							str += "</td><td>";
							str += data[i].ERRAND_TOTAL_PRICE;
							str += "원</td><td>";
							str += data[i].MEM_NICKNAME;
							str += "</td></tr>";
			//					document.write("<table>"+str+"</table>");
							$('#nds_tbody_req').append(str);
							str = "";
						}
						else if(data[i].ERRAND_STATUS == 'S'){
							console.log('s');
							str += "<tr><td>"
							str += "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" id=\"customCheck";
							str += data[i].ERRANDKEY;
							str += "\"> <label class=\"custom-control-label\" for=\"customCheck";
							str += data[i].ERRANDKEY;
							str += "\"></label></div>";
							str += "</td><td><span class=\"badge bg-secondary text-white\">";
							str += "완료";
							str += "</span></td><td>";
							str += data[i].ERRAND_REQUEST_DATE;
							str += "</td><td>";
							str += data[i].ERRAND_ITEM;
							str += "</td><td>";
							str += data[i].ERRAND_TOTAL_PRICE;
							str += "원</td><td>";
							str += data[i].MEM_NICKNAME;
							str += "</td></tr>";
			//					document.write("<table>"+str+"</table>");
							$('#nds_tbody_req').append(str);
						}
					 	str = "";
					}
					if(data.length < 1){
							console.log('null');
							str += "<tr><th colspan=\"6\">";
							str += "조회결과가 없습니다.";
	// 						str += "</th></tr>";
	// 						str += "<tr>";
	// 						str += "<td>1111";
	// 						str += "</td>";
	// 						str += "<td>2222";
							str += "</th>";
							str += "</tr>";
							$('#nds_tbody_req').append(str);
						 	str = "";
					}
					
					
					}
					req_cnt = data.length;
					console.log('req_cnt(2)='+req_cnt);
					
			},
			error : function(e) {//@param-XMLHttpRequest
			}
		});
	}////////////////////end of if
		$('.req_errand_tb').show();
}
function resAction() {
	$('.req_errand_tb').hide();
	console.log("수행심부름");
	$(".errand_FB").html("");
	console.log('nds_cnt(1)='+nds_cnt);
	if($('#nds_tbody_nds').children().length == 0){
		$.ajax({
			url : "http://localhost:9696/errand/selectErrandRecord.nds?gubun=nds",
			success : function(data) {//@data-json,xml,html,text
				console.log(data);
				let str = "";
				$('#allcnt1').html(data.length);
				console.log(data.length);
				
				if(data.length != nds_cnt){
				
					for(let i=0; i<data.length; i++){
						if(data[i].ERRAND_STATUS == 'P'){
							console.log('s');
							str += "<tr><td>";
							str += "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" id=\"customCheck";
							str += data[i].ERRANDKEY;
							str += "\"> <label class=\"custom-control-label\" for=\"customCheck";
							str += data[i].ERRANDKEY;
							str += "\"></label></div>";
							str += "</td><td><span class=\"badge rounded-pill bg-warning text-dark\">";
							str += "진행중";
							str += "</span></td><td>";
							str += data[i].ERRAND_REQUEST_DATE;
							str += "</td><td>";
							str += data[i].ERRAND_ITEM;
							str += "</td><td>";
							str += data[i].ERRAND_TOTAL_PRICE;
							str += "원</td><td>";
							str += data[i].MEM_NICKNAME;
							str += "</td></tr>";
			//					document.write("<table>"+str+"</table>");
							$('#nds_tbody_nds').append(str);
						str = "";
						}else if(data[i].ERRAND_STATUS == 'S'){
							console.log('s');
							str += "<tr><td>"
							str += "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" id=\"customCheck";
							str += data[i].ERRANDKEY;
							str += "\"> <label class=\"custom-control-label\" for=\"customCheck";
							str += data[i].ERRANDKEY;
							str += "\"></label></div>";
							str += "</td><td><span class=\"badge bg-secondary text-white\">";
							str += "완료";
							str += "</span></td><td>";
							str += data[i].ERRAND_REQUEST_DATE;
							str += "</td><td>";
							str += data[i].ERRAND_ITEM;
							str += "</td><td>";
							str += data[i].ERRAND_TOTAL_PRICE;
							str += "원</td><td>";
							str += data[i].MEM_NICKNAME;
							str += "</td></tr>";
			//					document.write("<table>"+str+"</table>");
							$('#nds_tbody_nds').append(str);
						}
				 		str = "";
					}
					if(data.length < 1){
	/* 						$('#nds_tbody_req').html(""); */
							
							console.log('null');
							str += "<tr><th colspan=\"6\">";
							str += "조회결과가 없습니다.";
	// 						str += "</th></tr>";
	// 						str += "<tr>";
	// 						str += "<td>1111";
	// 						str += "</td>";
	// 						str += "<td>2222";
							str += "</th>";
							str += "</tr>";
							$('#nds_tbody_nds').append(str);
						 	str = "";
					}
					
				}
				nds_cnt = data.length;
				console.log('nds_cnt(2)='+nds_cnt);
					
			},
			error : function(e) {//@param-XMLHttpRequest
			}
		});
	}////////////////////end of if
		$('.nds_errand_tb').show();
	
}
// function showErrandHis(){
// //		alert("afd");
// 	pageReq = "req";
// 	pageRes = "res";
// 	var url = location.href;
// 	var getPage1 = url.indexOf(pageReq);
// 	var getPage2 = url.indexOf(pageRes);
// //		alert(getPage1);
// //		alert(getPage2);
// 	if (getPage2 != -1) {
// 		$(".response").addClass("active");
// 		$(".request").removeClass("active");
// 		resAction();
// 	} else {
// //			alert("req");
// 		reqAction();
// 	}
// }


$(document).ready(function () {
	   $('#errand_del_confirm').on('click', function(){
// 		   alert("눌렀음");
		      $('.custom-control-input:checked').each(function(index){
		    	 let errandKey = $('.custom-control-input:checked').eq(index).attr('id');
		    	 errandKey = errandKey.substr(11,errandKey.length-1);
		         console.log(errandKey);
		         $.ajax({
		             url : "http://localhost:9696/errand/errandRecordUpdate.nds?gubun=req&errandKey="+errandKey,
		             success : function(data) {//@data-json,xml,html,text
		                 location.href = "my_errand.nds?req";
		             },
		             error : function(e) {//@param-XMLHttpRequest
		            	 console.log("error="+e.toString());
		             }
		          });
		         //window.location.reload();
		      })
		   });
		   $('#errand_del_confirm1').on('click', function(){
		      $('.custom-control-input:checked').each(function(index){
		    	 let errandKey = $('.custom-control-input:checked').eq(index).attr('id');
		    	 errandKey = errandKey.substr(11,errandKey.length-1);
		         console.log(errandKey);
		         $.ajax({
		             url : "http://localhost:9696/errand/errandRecordUpdate.nds?gubun=nds&errandKey="+errandKey,
		             success : function(data) {//@data-json,xml,html,text
		                 location.href = "my_errand.nds?res";
		             },
		             error : function(e) {//@param-XMLHttpRequest
		            	 console.log("error="+e.toString());
		             }
		          });
		         //window.location.reload();
		      })
		   });

// 	$('.delete').on('click', function(){
// 		$('.custom-control-input:checked').each(function(index){
// 			console.log($('.custom-control-input:checked').eq(index).attr('id'));
// 		})
// 	});
	
	
});
</script>