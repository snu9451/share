let email_req = ""; 
let email_nds = "";
let errandArr=[];
let errandInfoArr=[];
let MAXINDEX=-1;
let infoIndex=-1;
$(document).ready(function(){
	$.ajax({
		type:'post',
		url:'/errand/jsonGetErrand.nds',
		data:{"mem_email":mem_email,"dest_email":dest_email},
		dataType:'json',
		success:function(data){
			console.log("ajax success for jsonGetErrand");
			console.log(data.length);
			for(let i=0; i<data.length; i++) {
				if(data[i].ERRAND_STATUS=="S")
					continue;
				errandArr[++infoIndex] = data[i];
				console.log(data[i]);
				$.ajax({
					type:'post',
					url:'/errand/jsonGetErrandInfo.nds',
					data:{"errandKey":data[i].ERRANDKEY},
					dataType:'json',
					success:function(data2){
						console.log(data2);
						errandInfoArr[infoIndex] = data2;
						initNotice();
						MAXINDEX = infoIndex;
					},
					error:function(e){
						console.log(e);
					}
				});
			}
		},
		error:function(e){
			console.log(e);
		}
	});
});
function initNotice(){
	if(MAXINDEX!=-1)
		return;
	let html = 
	   				"<div class=\"notice_wrapper\">"
	   				+"<div>"
		        		+"<div class=\"notice\">"
					      +"<div class=\"left\">"
					          +"<button class=\"btn btn-sm btnleft\"><i class=\"fas fa-arrow-circle-left prev\"></i></button>"
					      +"</div>"
					      +"<div class=\"center\">"
				          	+"<div class=\"center_text\">"
					            +"<div class=\"item\">심부름 물품 : "+errandArr[infoIndex].ERRAND_ITEM+"</div>"
					            +"<div class=\"price_list\">"
						            +"<div class=\"price_name\">물품가 : "
						            	+"<input class=\"price\" min=\"0\" type=\"number\"/ value=\""+errandArr[infoIndex].ERRAND_ITEM_PRICE_NDS+"\" ";
	if(errandArr[infoIndex].MEM_EMAIL_REQ.split('.')[0] == mem_email)
		html +=							"readonly";
	html +=								">"
							            +"<button type=\"button\" disabled=\"true\" id=\"btn_confirm\" class=\"btn btn-success btn-sm\">확인</button>"
						            +"</div>"
					            +"</div>"
					            +"<div>"
					            +"</div>"
					            +"<div class=\"errand_price\">심부름 값 : "+errandArr[infoIndex].ERRAND_PRICE+"</div>"
					            +"<div class=\"errand_price\">&nbsp</div>"
				          	+"</div>"
					      +"</div>"
					      +"<span class=\"center1\">"
					            +"<i id=\"check1\" class=\"fas fa-check-circle iconCheck\"></i>"
					            +"<i id=\"check2\" class=\"fas fa-check-circle iconCheck\"></i>"
					      +"</span>"
				          +"<div class=\"right\">"
					          +"<button class=\"btn btn-sm btnright\"><i class=\"fas fa-arrow-circle-right next\"></i></button>"
				          +"</div>"
			        	+"</div>"
	   				+"</div>"
			          	 +"<div id=\"notice_button\">"
			          	  	+"<button class=\"btn btn-sm\" type=\"button\">"
					   	  		+"<i class=\"fas fa-bars\"></i>"
					   		+"</button>"
			         	  +"</div>"
		        	+"</div>"
	   				+"<div class=\"notice_wrapper1\">"
	   				+"<div>"
		        		+"<div class=\"notice1\"></div>"
	   				+"</div>"
			          	 +"<div id=\"notice_button1\">"
			          	  	+"<button class=\"btn btn-sm\" type=\"button\">"
					   	  		+"<i class=\"fas fa-bars\"></i>"
					   		+"</button>"
			         	  +"</div>"
		        	+"</div>";
	$(".col.s3").children("div").html(html);
	
	$('.right').css('visibility','hidden');
	if(infoIndex==0)
		$('.left').css('visibility','hidden');
		
	$('.btnleft').off('click').on('click', function(){
		changeNotice("left");
	});
	$('.btnright').off('click').on('click', function(){
		changeNotice("right");
	});
		
	$('.notice_wrapper1').hide();
	$('#notice_button').click(function(){
		$('.notice_wrapper').hide();
		$('.notice_wrapper1').show();
	});
	$('#notice_button1').click(function(){
		$('.notice_wrapper1').hide();
		$('.notice_wrapper').show();
	});
	applyNotice();
}

function applyNotice(){
	console.log("P=?"+errandArr[infoIndex].ERRAND_STATUS);
	if(errandArr[infoIndex].ERRAND_STATUS=="P"){
		if(errandArr[infoIndex].MEM_EMAIL_REQ.split(".")[0] != mem_email) {
			$(".price").off('keyup').on('keyup', function(){
				let abled = false;
				abled = $(".price").val().length > 0 ? true : false;
				console.log(abled);
				$("#btn_confirm").attr("disabled", !abled);
			});
			$(".price").off('click').on('click', function(){
				$(".price").val("");
				$("#btn_confirm").attr("disabled",true);
			});
			$('#btn_confirm').off('click').on('click', function(){
				$.ajax({
					type:'post',
					url:'/errand/updateErrandItemPriceNds.nds',
					data:{"errand_item_price_nds":$(".price").val(),"errandKey":errandArr[infoIndex].ERRANDKEY},
					success:function(data){
						$.ajax({
							type:'post',
							url:'/errand/updateErrandInfo.nds',
							data:{
								"errandKey":errandArr[infoIndex].ERRANDKEY,
								"check_type":"check_first",
								"check_val":"T"
								},
							success:function(data2){
								$('#check1').addClass('active');
								$("#btn_confirm").attr("disabled", true);
								$(".price").attr("readonly", true);
								$(".price").css({"background-color":"gray", "pointer-events": "none", "opacity":"0.5"});
								sendMsg("[물품가가 "+$(".price").val()+"원으로 측정되었습니다. 물품가를 확인하시고 상단의 체크버튼을 누르시면 거래가 성사됩니다!]", errandArr[infoIndex].ERRANDKEY)
							},
							error:function(e){
								console.log(e);
							}
						});
					},
					error:function(e){
						console.log(e);
					}
				});
			});
			$("#check1").off('click').on('click', function(){
				if($("#check1").hasClass("active")) {
					$.ajax({
						type:'post',
						url:'/errand/updateErrandInfo.nds',
						data:{
							"errandKey":errandArr[infoIndex].ERRANDKEY,
							"check_type":"check_first",
							"check_val":"F"
							},
						success:function(data2){
							$("#check1").removeClass('active');
							abled = $(".price").val().length > 0 ? true : false;
							console.log(abled);
							$(".price").attr("readonly", false);
							$("#btn_confirm").attr("disabled", !abled);
							$(".price").css({"background-color":"none", "pointer-events": "auto", "opacity":"1"});
							sendMsg("[물품가 확인을 취소했습니다.]", errandArr[infoIndex].ERRANDKEY)
						},
						error:function(e){
							console.log(e);
						}
					});
				}
			});
		}
		else {
			$("#check2").off('click').on('click', function(){
				let isChecked = $("#check1").hasClass("active") ? 'T' : 'F'
				if(isChecked=="F")
					alert("상대방이 먼저 확인버튼을 눌러야 합니다.");
				else {
					$.ajax({
						type:'post',
						url:'/errand/updateErrandInfo.nds',
						data:{
							"errandKey":errandArr[infoIndex].ERRANDKEY,
							"check_type":"check_second",
							"check_val":"T"
							},
						success:function(data){
							$.ajax({
								type:'post',
								url:'/errand/updateErrandFinish.nds',
								data:{
									"errandKey":errandArr[infoIndex].ERRANDKEY,
									},
								success:function(data2){
									$("#check2").addClass("active");
									sendMsg("[심부름이 완료되었습니다.]", errandArr[infoIndex].ERRANDKEY);
									$.ajax({
										type:'post',
										url:'/member/updateMemberCoin.nds',
										data:{
											"mem_email":mem_email,
											"coin":(errandArr[infoIndex].ERRAND_ITEM_PRICE_NDS*1+errandArr[infoIndex].ERRAND_PRICE*1)*-1
											},
										success:function(data3){
											$.ajax({
												type:'post',
												url:'/member/jsonSelectMember.nds',
												data:{
													"mem_email":mem_email
													},
												success:function(data4){
													$.ajax({
														type:'post',
														url:'/member/insertCoinTrans.nds',
														data:{
															"mem_email":data4.MEM_EMAIL,
															"trans_content":errandArr[infoIndex].ERRAND_ITEM+" 심부름 주문",
															"trans_price":(errandArr[infoIndex].ERRAND_ITEM_PRICE_NDS*1+errandArr[infoIndex].ERRAND_PRICE*1)*1,
															"trans_remain":data4.COIN_REMAIN,
															"trans_io":"o"
															},
														success:function(data5){
														    let alertData = {
														      content: "심부름이 완료되었습니다!",
														      type: "doneReq",
														      timestamp : getTime(),
															  rider : dest_email,
														      active : 1
														    };
														    firebase.database().ref("alert/"+mem_email).push().update(alertData);
														},
														error:function(e){
															console.log(e);
														}
													});
												},
												error:function(e){
													console.log(e);
												}
											});
										},
										error:function(e){
											console.log(e);
										}
									});
									$.ajax({
										type:'post',
										url:'/member/updateMemberCoin.nds',
										data:{
											"mem_email":dest_email,
											"coin":(errandArr[infoIndex].ERRAND_ITEM_PRICE_NDS*1+errandArr[infoIndex].ERRAND_PRICE*1)*1
											},
										success:function(data3){
											$.ajax({
												type:'post',
												url:'/member/jsonSelectMember.nds',
												data:{
													"mem_email":dest_email
													},
												success:function(data4){
													$.ajax({
														type:'post',
														url:'/member/insertCoinTrans.nds',
														data:{
															"mem_email":data4.MEM_EMAIL,
															"trans_content":errandArr[infoIndex].ERRAND_ITEM+" 심부름 수행",
															"trans_price":(errandArr[infoIndex].ERRAND_ITEM_PRICE_NDS*1+errandArr[infoIndex].ERRAND_PRICE*1)*1,
															"trans_remain":data4.COIN_REMAIN,
															"trans_io":"i"
															},
														success:function(data5){
														    let alertData = {
														      content: "심부름이 완료되었습니다!",
														      type: "doneNds",
														      timestamp : getTime(),
														      active : 1
														    };
														    firebase.database().ref("alert/"+dest_email).push().update(alertData);
														},
														error:function(e){
															console.log(e);
														}
													});
												},
												error:function(e){
													console.log(e);
												}
											});
										},
										error:function(e){
											console.log(e);
										}
									});
								},
								error:function(e){
									console.log(e);
								}
							});
						},
						error:function(e){
							console.log(e);
						}
					});
				}
			});
		}
	}
}

function loadNotice(){
	if(errandInfoArr[infoIndex].CHECK_FIRST=="T") {
		$('#check1').addClass('active');
		$("#btn_confirm").attr("disabled", true);
		$(".price").attr("readonly", true);
		$(".price").css({"background-color":"gray", "pointer-events": "none", "opacity":"0.5"});
	}
	else {
		$('#check1').removeClass('active');
		$('#check2').removeClass('active');
		$(".price").css({"background-color":"", "pointer-events": "", "opacity":"1"});
	}
}

function changeNotice(gubun){
	console.log("gubun="+gubun);
	if(gubun=="left") {
		if(infoIndex==0) {
			console.log("infoIndex is 0");
			return;
		}
		else if(infoIndex==1) {
			console.log("infoIndex is 1");
			$('.left').css('visibility','hidden');
		}
		else {
			$('.right').css('visibility','');
		}
		infoIndex--;
	}
	else if(gubun=="right") {
		if(infoIndex==MAXINDEX) {
			console.log("infoIndex is MAXINDEX");
			return;
		}
		else if(infoIndex==MAXINDEX-1) {
			console.log("infoIndex is MAXINDEX-1");
			$('.right').css('visibility','hidden');
		}
		else {
			$('.left').css('visibility','');
		}
		infoIndex++;
	}
	
	$(".item").text("심부름 물품 : "+errandArr[infoIndex].ERRAND_ITEM);
	$(".price").val(errandArr[infoIndex].ERRAND_ITEM_PRICE_NDS);
	$("#btn_confirm").attr("disabled", true);
	loadNotice();
	if(errandArr[infoIndex].MEM_EMAIL_REQ.split('.')[0] == mem_email) {
		$(".price").attr('readonly',true);
	}
	else{
		$(".price").attr('readonly',false);
	}
	$(".errand_price").val("심부름 값 : "+errandArr[infoIndex].ERRAND_PRICE);
	applyNotice();
}

//현재 시간을 YYYY-MM-DD HH:mm:SS 형식으로 반환
function getTime(){
    let today = new Date();

    let year = today.getFullYear();
    let month = ('0' + (today.getMonth() + 1)).slice(-2);
    let day = ('0' + today.getDate()).slice(-2);

    let hours = ('0' + today.getHours()).slice(-2); 
    let minutes = ('0' + today.getMinutes()).slice(-2);
    let seconds = ('0' + today.getSeconds()).slice(-2); 

    let dateString = year + '-' + month  + '-' + day;
    let timeString = hours + ':' + minutes  + ':' + seconds;
    let rstTime = dateString+" "+timeString;
    return rstTime;
}