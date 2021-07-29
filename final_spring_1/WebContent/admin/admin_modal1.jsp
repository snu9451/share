<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>   
<%
	List<Map<String,Object>> adminModal1 = null;
	adminModal1 = (List<Map<String,Object>>)request.getAttribute("adminModal1");
	String report_no = null;
	String report_type = null;
	String mem_email_to = null;
	String mem_email_from = null;
	String report_msg = null;
	String report_date  = null;
%>    
<!doctype html>
<html lang="en">
    <head>
        <title>내동생 - 관리자페이지</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <!-- VENDOR CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link
            rel="stylesheet"
            href="assets/vendor/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="assets/css/main.css">
        <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
        <link rel="stylesheet" href="assets/css/demo.css">
        <!-- GOOGLE FONTS -->
        <link
            href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
            rel="stylesheet">
        <!-- ICONS -->
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
        <!-- pagination -->
           <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
        <link rel="stylesheet" href="paging.css"/>
<!--         <script src="paging.js"></script> -->
 <%@ include file="../admin/paging_js.jsp" %>
        <link rel="stylesheet" href="modalcss.css"/>
		<script src="https://kit.fontawesome.com/ce3585cab0.js" crossorigin="anonymous"></script>
    </head>

    <body>
            <!-- MAIN -->
            <div class="main">
                <!-- MAIN CONTENT -->
                <div class="main-content">
                    <div class="container-fluid">
                        <div class="row centerAlign">
                            <div class="col-lg-12">
                                <!-- 페이지 당 보여줄 로우의 수를 선택할 수 있는 콤보박스 생성 -->
                                <div style="display:none;" class="form-group">
                                    <!-- Show Numbers Of Rows -->
                                    <select  class="form-control my-form-control" name="state" id="maxRows">
                                        <!-- <option value="5000">ROW</option> -->
                                        <!-- <option value="5">5</option> -->
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>
                                        <option value="50">50</option>
                                        <!-- <option value="70">70</option> -->
                                        <!-- <option value="100">100</option> -->
                                    </select>
                                </div>
                                <!-- BASIC TABLE -->
                                <div class="panel">
                                    <div class="panel-heading" style="text-align: left;">
                                        <h1 class="panel-title" style="display: inline-block;"><label></label>신고내역 &nbsp </h1>
                                        <form style="display: inline-block;">
                                            <select name="language" >
                                            <option>분류</option>
                                            <option>전문판매업자</option>
                                            <option>비매너사용자</option>
                                            <option>욕설</option>
                                            <option>성희롱</option>
                                            <option>기타</option>
                                            </select>
                                        </form>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table" id="products">
                                            <form action="" id="setRows">
                                                <input type="hidden" name="rowPerPage" value="10" id="rowPerPage">
                                            </form>
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center;" width="6%">신고번호</th>
                                                    <th style="text-align: center;" width="9%">분류</th>
                                                    <th style="text-align: center;" width="14%">신고대상회원</th>
                                                    <th style="text-align: center;" width="14%">신고자</th>
                                                    <th style="text-align: center;" width="14%">신고메시지</th>
                                                    <th style="text-align: center;" width="8%">접수일</th>
                                                </tr>
                                            </thead>
                                            <tbody style="text-align: center;">
                                            
                      <%for(int i=0; i<adminModal1.size() ; i++){
                       report_no = adminModal1.get(i).get("REPORT_NO").toString();
                       report_type = adminModal1.get(i).get("REPORT_TYPE").toString();
                       mem_email_to = adminModal1.get(i).get("MEM_EMAIL_TO").toString();
                       mem_email_from = adminModal1.get(i).get("MEM_EMAIL_FROM").toString();
                       report_msg = adminModal1.get(i).get("REPORT_MSG").toString();
                       report_date = adminModal1.get(i).get("REPORT_DATE").toString();
                       report_date = report_date.substring(0,10);
                       report_date = report_date.replace("-",".");
                      %>                     
                         <tr>
                             <td><%=report_no %></td>
                             <td><%=report_type %></td>
                             <td><%=mem_email_to %></td>
                             <td><%=mem_email_from %></td>
                             <td>
                                 <a href="javascript:open('<%=report_msg%>')"><%=report_msg%> </a>
                             </td>
                             <td><%=report_date%></td>
                          </tr>
                       <%
                      }
                       %>   
                          </tbody>
                      </table>
                  </div>
               </div>
                                <!-- END BASIC TABLE -->
                                <!-- 페이지 선택 버튼 목록 -->
                                <!-- <div class="paging-search" id="paging-search"> -->
                                  <div  class="paging-buttons">
                                    <div>

                                    </div>
                                    <div style="padding-left: 100px;" class='pagination-container'>
                                        <nav class="pagination-nav">
                                            <ul class="pagination">
                                                <li data-page="prev">
                                                    <span>
                                                        «
                                                        <span class="sr-only">(current)</span></span>
                                                </li>
                                                <!-- Here the JS Function Will Add the Rows -->
                                                <li data-page="next" id="prev">
                                                    <span>
                                                        »
                                                        <span class="sr-only">(current)</span></span>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div></div>
                                    <div>
                                      <button class="my-buttons" onclick="btn_close()">닫기</button>
                                    </div>    
                                <!-- </div> -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MAIN CONTENT -->
            </div>
            <!-- END MAIN -->

            <div class="clearfix"></div>
            <footer>
                <div class="container-fluid"></div>
            </footer>
        <!-- END WRAPPER -->
        <!-- Javascript -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/scripts/klorofil-common.js"></script>

                    <!-- 신고메시지 모달 -->
<div class="modal hidden" id="reportModal">
    <div class="bg"></div>
    <div class="modalBox">
      <p style="min-height: 130px;">일이삼사구십 일팔구십일이삼삼사육칠팔구십오육칠팔구십일칠팔구십일이삼사오육칠팔구십 </p>
      
      <div class="modal-footer">
          <button class="closeBtn">확인</button>
  
      </div>
    </div>
  </div>
  
  <script>
    function open(rpt_msg) {
      console.log("모달창 뜬다요~");
      document.querySelector(".modal").classList.remove("hidden");
      $("#reportModal").children(".modalBox").children("p").text(rpt_msg);
    }
  
    const close = () => {
      document.querySelector(".modal").classList.add("hidden");
    }
  
    document.querySelector(".closeBtn").addEventListener("click", close);
    document.querySelector(".bg").addEventListener("click", close);
  
  </script>




        <!-- 팝업창 닫는 함수 -->
        <script>
            function btn_close(){
                window.close();
            }
            getPagination('#products');
        </script>
    </body>

</html>