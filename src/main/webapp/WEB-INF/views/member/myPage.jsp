<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="username" value='<%=session.getAttribute("username") %>' />

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
	<title>마이페이지</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/recommend.css?ver=<%= System.currentTimeMillis()%>" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/member/CSS/myPage.css?ver=<%= System.currentTimeMillis()%>" />
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">
	<!-- Modernizer Script for old Browsers -->
    <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
    
   
</head>
<body>

		<c:choose>
	        <c:when test="${username eq 'admin@naver.com'}">
	        	<!-- header -->
			    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			    <header id="navigation" class="navbar-fixed-top" style="background-image: url(${pageContext.request.contextPath }/resources/img/slider/main2.jpg);">
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
			                    <a href="${pageContext.request.contextPath }/admin/admin_main">
			                        <img src="${pageContext.request.contextPath }/resources/purchase/image/cookLogo.png">
			                    </a>
			                </h1>
			                <!-- /logo -->
			
			            </div>
			
			            <!-- main nav -->
			            <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
			                <ul id="nav" class="nav navbar-nav">
			                    <li class="current"><a href="${pageContext.request.contextPath }/admin/admin_member_list">회원관리</a></li>
			                </ul>
			            </nav>
			            <!-- /main nav -->
			        </div>
			    </header>
			</c:when>
			<c:otherwise>
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
                            <li><a href="#recommend" id="janggo" class="fancybox"><img src="${pageContext.request.contextPath }/resources/img/nang2.png"></a></li>
                            <li><a href="#service">레시피</a></li>
                            <li><a href="#portfolio">유저 레시피</a></li>
                            <li><a href="#about">강사</a></li>
                            <li><a href="#pricing">구매</a></li>
                            <c:if test="${fn:length(username) == 0 }">
                               <li><a href="${pageContext.request.contextPath }/member/sign">회원가입</a></li>
                               <li><a href="${pageContext.request.contextPath }/security/login">로그인</a></li>
                            </c:if>
                            <c:if test="${fn:length(username) != 0 }">
                               <li class="current"><span class="username"><a href="${pageContext.request.contextPath }/member/myPage?email=${username }">${username }</a></span></li>
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
        </c:otherwise>
	</c:choose>

        
        
        <section class="content-wrap">
        	
        	<input type="hidden" id="textKind" value="${list[0].kind }">
        	<input type="hidden" id="textTaste" value="${list[0].taste }">
        		
        	<div id="myData_box">
        		<div id="myImg_box">
        			<img src="${pageContext.request.contextPath }/upload/member/${list[0].img}">
        		</div>
        		<div id="myEmail_box"><h2>이메일: ${list[0].email }</h2></div>        		
        		<div id="myName_box"><h2>닉네임: ${list[0].name }</h2></div>
        		<div id="myAddress_box"><h2>주소: ${list[0].address }</h2></div>
        		<div id="myTel_box"><h2>전화번호: ${list[0].tel }</h2></div>
        		<div id="myKind_box"></div>
        		<div id="myTaste_box"></div>
        		<div id="myScore_box"><h2>점수: ${list[0].score }</h2></div>
        		<div id="myAccountBtn_box">
        			<a id="myAccountBtn" href="${pageContext.request.contextPath }/member/myaccount?email=${param.email}" class="btn btn-success">회원정보 수정</a>
        			
        		</div>
        		
        		
        	</div>
        	
        </section>
        
        
        
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
				  		<c:forEach var="prod" items="${result }">
				  			<c:if test="${prod.category_code eq '100'}">
				  				
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail2" class="food_detail">
				  		<c:forEach var="prod" items="${result }">
				  			<c:if test="${prod.category_code eq '200'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail3" class="food_detail">
				  		<c:forEach var="prod" items="${result }">
				  			<c:if test="${prod.category_code eq '300'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail4" class="food_detail">
				  		<c:forEach var="prod" items="${result }">
				  			<c:if test="${prod.category_code eq '400'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail5" class="food_detail">
				  		<c:forEach var="prod" items="${result }">
				  			<c:if test="${prod.category_code eq '500'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
					 <div id="food_detail6" class="food_detail">
				  		<c:forEach var="prod" items="${result }">
				  			<c:if test="${prod.category_code eq '600'}">
					  			<div class="food_box" data-name="${prod.productName }">${prod.productName}</div>
					  		</c:if>
				  		</c:forEach>
					 </div>
					 
				</div>
				
				<form method="post" action="${pageContext.request.contextPath }/recommendAsIngredient" name="search" onclick="recommendSearch()">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<input type="hidden" id="recomId" name="ingredient" value="">
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
        <script src="${pageContext.request.contextPath }/resources/js/recommend.js"></script>
        <script src="${pageContext.request.contextPath }/resources/member/JS/myPage.js"></script>
        <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>

</html>