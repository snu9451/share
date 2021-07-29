<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
				<!-- 중고거래 상품 갤러리-->
				<div class="row hidden" id = "itemAll">
					<div
						class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0"
						data-aos="zoom-in" data-aos-delay="200">
						<!-- 인기상품 아이콘 -->
						<a class="position-absolute text-decoration-none ml-1" href="#">
							<i id="top__rank" class="fas fa-crown"></i> <span
							class="position-absolute translate-middle badge rounded-pill bg-light text-dark">
								인기상품 </span>
						</a>
						<div class="product__box">
							<div class="card rounded-0 mb-2">
								<div
									class="pImgBox img-fluid d-flex flex-column justify-content-end align-items-lg-stretch">
									<img id="pimg" class="card-img rounded-0 img-fluid"
										src="assets/img/nike_shoe.png">
								</div>
								<!-- 좋아요버튼 -->
								<button type="button" class="likeBtn"
									class="btn-sm text-danger position-absolute" href="">
									<i class="far fa-heart"></i>
								</button>
							</div>
							<div class="p-3 text-left">
								<h3>
									<a id="pTitle" name="pr_bm_no" href="http://localhost:9696/item/selectItemDetail.nds?pr_bm_no=<%= 3 %>">nike 데이브레이크</a>
								</h3>
								<p id="pDescrip">[[ 상품내용 ]]Duis aute irure dolor in
									reprehenderit in voluptate velit esse cillum dolore</p>
								<div
									class="row d-flex justify-content-between align-items-center mt-3">
									<div class="col-lg-auto d-flex align-items-baseline">
										<h2 id="pPrice">45,000</h2>
										<span>원</span>
									</div>
									<label id="pCategory" for="" class="col-lg-auto">* 카테고리
										*</label>
								</div>
							</div>
						</div>
					</div>

					<div
						class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0"
						data-aos="zoom-in" data-aos-delay="200">
						<!-- 인기상품 아이콘 -->
						<a class="position-absolute text-decoration-none" href="#"> <i
							id="top__rank" class="fas fa-crown"></i> <span
							class="position-absolute translate-middle badge rounded-pill bg-light text-dark">인기상품</span>
						</a>
						<div class="product__box">
							<div class="card rounded-0 mb-2">
								<div class="pImgBox d-flex flex-column justify-content-center">
									<img id="pimg" class="card-img rounded-0 img-fluid"
										src="assets/img/portfolio/portfolio-4.jpg">
								</div>
								<!-- 좋아요버튼 -->
								<button type="button" class="likeBtn"
									class="btn-sm text-danger position-absolute" href="">
									<i class="far fa-heart"></i>
								</button>
							</div>
							<div class="p-3 text-left">
								<h3>
									<a id="pTitle" href="/item/detail_page.jsp">like Rayban 선글라스</a>
								</h3>
								<p id="pDescrip">[[ 상품내용 ]]Duis aute irure dolor in
									reprehenderit in voluptate velit esse cillum dolore</p>
								<div
									class="row d-flex justify-content-between align-items-center mt-3">
									<div class="col-lg-auto d-flex align-items-baseline">
										<h2 id="pPrice">55,000</h2>
										<span>원</span>
									</div>
									<label id="pCategory" for="" class="col-lg-auto">* 카테고리
										*</label>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</section>
</body>
</html>