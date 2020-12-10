<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Always force latest IE rendering engine -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Meta Keyword -->
    <meta name="keywords" content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
    <!-- meta character set -->
	<meta charset="UTF-8">
	<title>recommendAsIngredient</title>
	<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
	<!--
    Google Fonts
    ============================================= -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <!--
    CSS
    ============================================= -->
    <!-- Fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <!-- Fancybox -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.fancybox.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.css">
    <!-- Animate -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
    <!-- Main Responsive -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">
    

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/recommendAsIngredient.css?ver=<%= System.currentTimeMillis()%>" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/recommend.css?ver=<%= System.currentTimeMillis()%>" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe_tt.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">
	<!-- Modernizer Script for old Browsers -->
    <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
	
</head>
<body>
	
	<!--
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar-fixed-top" style="background-image: url('${pageContext.request.contextPath }/resources/img/slider/main1.jpg')">
            <div class="container">

                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->

                    <!-- logo -->
                    <h1 class="navbar-brand">
                        <a href="${pageContext.request.contextPath }/">
                            <img src="${pageContext.request.contextPath }/resources/img/logo_w.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->

                    </div>

                    <!-- main nav -->
                     <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                        <ul id="nav" class="nav navbar-nav">
                            <li class="current"><a href="#recommend" id="janggo" class="fancybox"><img src="${pageContext.request.contextPath }/resources/img/nang2.png"></a></li>
                            <li><a href="#service">레시피</a></li>
                            <li><a href="#portfolio">유저 레시피</a></li>
                            <li><a href="#about">강사</a></li>
                            <li><a href="#puhs">구매</a></li>
                            <c:if test="${fn:length(username) == 0 }">
                               <li><a href="${pageContext.request.contextPath }/member/sign">회원가입</a></li>
                               <li><a href="${pageContext.request.contextPath }/security/login">로그인</a></li>
                            </c:if>
                            <c:if test="${fn:length(username) != 0 }">
                               <li><span class="username"><a href="${pageContext.request.contextPath }/member/myPage?email=${username }">${username }</a></span></li>
                               <li><span class="logout">로그아웃</span></li>
                               <form name="logoutFrm" action="${pageContext.request.contextPath }/security/logout" method="POST">
                                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                               </form>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- /main nav -->
                </div>
                
        </header>
        
        <div class="content-wrap">
        	<div class="intro-text">
        		<h3>원하는 카테고리를 선택해 주시면, 더 정확한 레시피 결과를 보실 수 있습니다.</h3>
        	</div>
        	
        	<input type="hidden" id="kindId" name="kind" value="">
            <input type="hidden" id="tasteId" name="taste" value="">
            <input type="hidden" id="ingreId" name="ingre" value="">
        	
        	<div class="select-category">
        		<div class="select-cate">
        			<div>나라별 요리</div>
        			<div class="national_cate">
        				<label for="success1" class="btn btn-success">한식 <input type="checkbox" id="success1" name="kind_info" class="badgebox" value="1"><span class="badge">&check;</span></label>
			            <label for="success2" class="btn btn-success">중식 <input type="checkbox" id="success2" name="kind_info" class="badgebox" value="2"><span class="badge">&check;</span></label>
			            <label for="success3" class="btn btn-success">일식 <input type="checkbox" id="success3" name="kind_info" class="badgebox" value="3"><span class="badge">&check;</span></label>
			            <label for="success4" class="btn btn-success">양식 <input type="checkbox" id="success4" name="kind_info" class="badgebox" value="4"><span class="badge">&check;</span></label>
			          	<label for="success5" class="btn btn-success">퓨전 <input type="checkbox" id="success5" name="kind_info" class="badgebox" value="5"><span class="badge">&check;</span></label>
			          	<label for="success6" class="btn btn-success">기타 <input type="checkbox" id="success6" name="kind_info" class="badgebox" value="6"><span class="badge">&check;</span></label>
        			</div>
        		</div>
        		
        		<div class="select-cate">
        			<div>조리법별 요리</div>
        			<div class="cooking_cate">
        				<label for="info1" class="btn btn-info">밥/죽/떡<input type="checkbox" id="info1" name="taste_info" class="badgebox" value="1"><span class="badge">&check;</span></label>
			            <label for="info2" class="btn btn-info">면/만두 <input type="checkbox" id="info2" name="taste_info" class="badgebox" value="2"><span class="badge">&check;</span></label>
			            <label for="info3" class="btn btn-info">국물<input type="checkbox" id="info3" name="taste_info" class="badgebox" value="3"><span class="badge">&check;</span></label>
			            <label for="info4" class="btn btn-info">구이/찜/조림<input type="checkbox" id="info4" name="taste_info" class="badgebox" value="4"><span class="badge">&check;</span></label>
			            <label for="info5" class="btn btn-info">볶음/튀김/부침 <input type="checkbox" id="info5" name="taste_info" class="badgebox" value="5"><span class="badge">&check;</span></label>
			            <label for="info6" class="btn btn-info">나물/샐러드<input type="checkbox" id="info6" name="taste_info" class="badgebox" value="6"><span class="badge">&check;</span></label>
			            <label for="info7" class="btn btn-info">베이킹/디저트<input type="checkbox" id="info7" name="taste_info" class="badgebox" value="7"><span class="badge">&check;</span></label>
			            <label for="info8" class="btn btn-info">양념<input type="checkbox" id="info8" name="taste_info" class="badgebox" value="8"><span class="badge">&check;</span></label>
			            <label for="info9" class="btn btn-info">음료<input type="checkbox" id="info9" name="taste_info" class="badgebox" value="9"><span class="badge">&check;</span></label>
        			</div>
        		</div>
        	</div>
        	
        	<div class="researchBtn"> 
        			<button id="research" class="btn btn-success">재검색</button>
        	
        	</div>
        	
        	<div class="clear"></div>
        	
        	<div class="result-ingredlient">
        		<div>재료</div>
        		
        		<div class="ingredlient-detail">
        				<c:forEach var="ingre" items="${arr }">
        					<span class="closing"><b class="ingre_text">${ingre}</b><a class="in-del">&#10006;</a></span>
	        			</c:forEach>
        		</div>
        	</div>
        	
        	<div class="clear"></div>
        	
        	<div class="main-content">
        		<div class="top-content">
        			<div class="intro-cnt">
        				<h3>조건에 맞는 레시피가 <b id="recipeCnt">${fn:length(res1)+fn:length(res2)}</b>개 있습니다.</h3>
        			</div>
        		</div>
        		<div class="recipe_content">
        			<div class="cardhei"> 
        			
        			 </div>
        			 
						<div class="modal modal-center " id="recipe" data-toggle="0">
					<div class="modal-dialog modal-center modal-dialog-scrollable">
						<div id="modal_size" class="modal-content ">

							<!-- Modal Header -->
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title">요리제목</h3>
								
								<!-- 포스트 제목 가져와야됨 -->
							</div>

							<!-- Modal body -->
							<div class="modal-body main_content">
								<div class="recipe_content_img">
									<div id="modalImg_box">
										<img id="modal_img" class="upload_img">
									</div>

									<div class="category">
										<h4 class="modal-kind">한식</h4>
										<h5 class="modal-taste">찜</h5>
									</div>


									<!-- 레시피 설명 -->
									<div class="recipe_content">
										<div id="recipe1" class="recipe_order"></div>
										<div id="recipe2" class="recipe_order"></div>
										<div id="recipe3" class="recipe_order"></div>
										<div id="recipe4" class="recipe_order"></div>
										<div id="recipe5" class="recipe_order"></div>
										<div id="recipe6" class="recipe_order"></div>
										<div id="recipe7" class="recipe_order"></div>
										<div id="recipe8" class="recipe_order"></div>
										<div id="recipe9" class="recipe_order"></div>
										<div id="recipe10" class="recipe_order"></div>
									</div>

								</div>


								<!-- 사용재료 -->
								<h3>사용재료</h3>
								<div class="food_content">
									<table class="table table-striped use_food">
										<tbody id="ing">
											




										</tbody>
									</table>
								</div>
						
							</div>
							

						</div>
					</div>
				</div>
				
				        
				   
        		
        		</div>
        	</div>
        	
        </div>
        
        
		<input type="hidden" id="path" value="${pageContext.request.contextPath}">
        
        <!--
        #footer
        ========================== -->
        <footer id="footer" class="text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="footer-logo wow fadeInDown">
                            <img src="${pageContext.request.contextPath }/resources/img/logo_w.png" alt="logo">
                        </div>

                        <div class="footer-social wow fadeInUp">
                            <h3>We are social</h3>
                            <ul class="text-center list-inline">
                                <li><a href="http://goo.gl/RqhEjP"><i class="fa fa-facebook fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/hUfpSB"><i class="fa fa-twitter fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/r4xzR4"><i class="fa fa-google-plus fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/k9zAy5"><i class="fa fa-dribbble fa-lg"></i></a></li>
                            </ul>
                        </div>

                        <div class="copyright">
                           
                           Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

                        </div>

                    </div>
                </div>
            </div>
        </footer>
        <!--
        End #footer
        ========================== -->
        
        <div id="recommend">
        	<div class="modal_container">
	        	<div class="intro">
	        		<h3>냉장고를 부탁해! 냉장고에 숨어 있는 재료로 맛있는 요리를 만들어보세요.</h3>
	        		<h1>내가 가진 재료로 레시피 추천받기</h1>
	        	</div>
	        
	        	<div class="d1">
				  <form>
				  	<input id="input_search" type="text" placeholder="검색어 입력">  	
				  </form>
				  
				  <div class="food_cate">
				  	<ul>
				  		<li data-cate-code="100">식량작물</li>
				  		<li data-cate-code="200">채소</li>
				  		<li data-cate-code="300">특용작물</li>
				  		<li data-cate-code="400">과일</li>
				  		<li data-cate-code="500">축산</li>
				  		<li data-cate-code="600">수산</li>
				  		
				  	</ul>
				  	
				  </div>
				  	<div id="food_detail1" class="food_detail">
				  		<c:forEach var="prod" items="${list }">
				  			<c:if test="${prod.category_code eq '100'}">
				  				
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail2" class="food_detail">
				  		<c:forEach var="prod" items="${list }">
				  			<c:if test="${prod.category_code eq '200'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail3" class="food_detail">
				  		<c:forEach var="prod" items="${list }">
				  			<c:if test="${prod.category_code eq '300'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail4" class="food_detail">
				  		<c:forEach var="prod" items="${list }">
				  			<c:if test="${prod.category_code eq '400'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail5" class="food_detail">
				  		<c:forEach var="prod" items="${list }">
				  			<c:if test="${prod.category_code eq '500'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail6" class="food_detail">
				  		<c:forEach var="prod" items="${list }">
				  			<c:if test="${prod.category_code eq '600'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
				</div>
				
				<form method="post" action="recommendAsIngredient" name="search" onclick="recommendSearch()">
					<input type="hidden" id="recomId" name="ingredient" value="">
					<input type="hidden" id="_csrf" name="${_csrf.parameterName }" value="${_csrf.token}" />
					<div class="food_list">
						<div><h3>내가 선택한 재료</h3></div>
						<div class="selected_list">
							
						</div>
						<div class="reBtn_box">
							<button type="submit" id="btn_search" class="btn btn-success">검색</button>
						</div>
					</div>
				
				</form>
				
			</div>
        </div>

		

</body>

        <!--
        JavaScripts
        ========================== -->
        
        <!-- main jQuery -->
        <script src="${pageContext.request.contextPath }/resources/js/vendor/jquery-1.11.1.min.js"></script>
        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
        <!-- jquery.nav -->
        <script src="${pageContext.request.contextPath }/resources/js/jquery.nav.js"></script>
        <!-- Portfolio Filtering -->
        <script src="${pageContext.request.contextPath }/resources/js/jquery.mixitup.min.js"></script>
        <!-- Fancybox -->
        <script src="${pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
        <!-- Parallax sections -->
        <script src="${pageContext.request.contextPath }/resources/js/jquery.parallax-1.1.3.js"></script>
        <!-- jQuery Appear -->
        <script src="${pageContext.request.contextPath }/resources/js/jquery.appear.js"></script>
        <!-- countTo -->
        <script src="${pageContext.request.contextPath }/resources/js/jquery-countTo.js"></script>
        <!-- owl carousel -->
        <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
        <!-- WOW script -->
        <script src="${pageContext.request.contextPath }/resources/js/wow.min.js"></script>
        <!-- theme custom scripts -->
        <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
        <script src="${pageContext.request.contextPath }/resources/js/recommendAsIngredient.js"></script>
        <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>

</html>