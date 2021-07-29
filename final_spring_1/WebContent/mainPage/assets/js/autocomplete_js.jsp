<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		/* =============================== [[ 검색어 자동 완성 기능 구현 ▼ ]] =============================== */
		let search_bottom = 246+'px';
		let search_left = 330+'px';
// 		const search_bottom = document.getElementsByName('nds_search').parentElement.offsetTop+'px';
// 		const search_left = document.getElementsByName('nds_search').parentElement.offsetLeft+'px';
// 		const search_bottom = $('input[name=nds_search]').parent().offset().top+'px';
// 		const search_left = $('input[name=nds_search]').parent().offset().left+'px';
		
// 		alert(search_bottom+', '+search_left);
		
		$('input[name=nds_search]').on('keyup', function(){
			let keyword = $('#f_autocompl').serialize();
			/* ＡＪＡＸ　ＣＯＤＥ　ＨＥＲＥ */
			/* 입력된 검색어가 없는 경우(지워진 경우) 자동완성창을 닫아주어야 함 */
			if(keyword.length > 0){
				$.ajax({
					url: "http://localhost:9696/etc/selectAutocompleteList.nds",
					type: 'post',
					dataType: 'json',
					data: keyword,
					success: function(data){
// 						console.log(data);
						if(data.length > 0 && $('input[name=nds_search]').val() != ""){
						/* 자동완성창 열기 */
						if($('#Map').length) $('#autocomplete').css('top', search_bottom);
						else {
							search_bottom = '180px';
							$('#autocomplete').css('top', search_bottom);
						}
						$('#autocomplete').css('left', search_left);
						$('#autocomplete').css('background-color', 'white');
						$('#autocomplete').css('opacity', '0.9');
						$('#autocomplete').css('padding','20px');
						$('#autocomplete').css('width','560px');
						$('#autocomplete').css('height','fit-content');
						$('#autocomplete').css('box-shadow', '0px 8px 7px -3px rgba(150, 150, 150, 0.35)');
						$('#autocomplete').empty();
						for(let i=0; i<data.length; i++){
// 							console.log(data[i]);
							const li = "<li id=data"+i+">"+data[i].KEYWORD+"</li>";
							$('#autocomplete').append(li);
							
							// 동적으로 생성된 요소들에 이벤트 걸기
							let idd = "#data"+i;
// 							alert($(idd).text());
							$(idd).on('mouseover', function(){
								$(idd).css('background-color','#f0f0f0');
							})
							$(idd).on('mouseout', function(){
								$(idd).css('background-color','white');
							})
							$(idd).on('click', function(){
								$('input[name=nds_search]').val("");
								$('input[name=nds_search]').val($(idd).text());
								itemSearch();
							})
							
						}
						} else {
							$('#autocomplete').empty();
							$('#autocomplete').css('height',0);
							$('#autocomplete').css('padding',0);
							
						}
					}
				})
			}
			else if(keyword == "" || keyword.length == 0){
// 				console.log("여기여기");
				$('#autocomplete').empty();
				$('#autocomplete').css('height',0);
				$('#autocomplete').css('padding',0);

			}
			
			
		})
		/* =============================== [[ 검색어 자동 완성 기능 구현 ▲ ]] =============================== */
		
		// 검색창 이외의 영역을 클릭 시 자동완성으로 인해 펼쳐진 창 닫기
		$(document).children().on('click', function(){
			hide_autocmpl();
		});
		
		
	});
	function hide_autocmpl(){
			$('#autocomplete').empty();
			$('#autocomplete').css('height',0);
			$('#autocomplete').css('padding',0);
			
	}
</script>