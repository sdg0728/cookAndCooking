<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />
<c:set var="now" value='<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>'/>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="en" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="en" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
	<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
	
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Always force latest IE rendering engine -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Meta Keyword -->
    <meta name="keywords"
        content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
    <!-- meta character set -->
    <meta charset="utf-8">

    <!-- Site Title -->
    <title>도시락 상세정보</title>

    <!--
        Google Fonts
        ============================================= -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
        integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/product_list.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/r_prod_recp_detail.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/product_detail.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/star.css">
	<!-- 로그인 로그아웃 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">
    
    <!-- Modernizer Script for old Browsers -->
    <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>

</head>

<body>
    <!-- header -->
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
                    <a href="${pageContext.request.contextPath }">
                        <img src="${pageContext.request.contextPath }/resources/purchase/image/cookLogo.png">
                    </a>
                </h1>
                <!-- /logo -->

            </div>

            <!-- main nav -->
            <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                <ul id="nav" class="nav navbar-nav">
                    <li class="current"><a href="${pageContext.request.contextPath }/purchase/rlist">레시피 도시락</a></li>
                    <li><a href="${pageContext.request.contextPath }/purchase/plist">농수산물</a></li>
                    <li><a href="${pageContext.request.contextPath }/purchase/cart">장바구니</a></li>
                    <li><a href="${pageContext.request.contextPath }/purchase/orders">구매목록</a></li>
                    <li class="apply"><a>상품신청</a></li>
                    <c:if test="${fn:length(username) == 0 }">
						<li><a href="member/sign">회원가입</a></li>
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

    <section>
        <div class="content-wrap">
            <h3 class="black">상세정보</h3>
            <div class="prod-info-wrap" data-pid=${dto.pid } data-pchk="1">
                <div class="prod-img">
                    <img src="${pageContext.request.contextPath }/upload/recipe/${dto.p_img }" />
                </div>
                <div class="prod-info">
                    <div class="info">
                        <div class="prod-name black"><span>${dto.p_name }</span></div>
                        <div class="prod-price black"><span>${dto.p_price }</span></div>
                        <div class="prod-rate">
                            <c:choose>
                            	<c:when test="${dto.r_score >= 0 && dto.r_score <= 1}">
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            	</c:when>
                            	<c:when test="${dto.r_score > 1 && dto.r_score <= 2}">
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            	</c:when>
                            	<c:when test="${dto.r_score > 2 && dto.r_score <= 3}">
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            	</c:when>
                            	<c:when test="${dto.r_score > 3 && dto.r_score <= 4}">
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star gray"></i>
                            		<i class="fas fa-star gray"></i>
                            	</c:when>
                            	<c:when test="${dto.r_score > 4 && dto.r_score < 5}">
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star gray"></i>
                            	</c:when>
                            	<c:when test="${dto.r_score == 5}">
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            		<i class="fas fa-star blue"></i>
                            	</c:when>
                            </c:choose>
                       		<span class="black">${dto.r_score }</span>
                        </div>
                        <div class="prod-content black">
                        	<h4>상세설명</h4>
                        	<span>${dto.p_content }</span>
                        </div>
                    </div>
                    <div class="button-wrap">
                        <input type="text" name="count" class="form-control" placeholder="수량입력"/>
                        <div class="buttons">
                            <button type="button" class="btn btn-dark btn-purchase">구매하기</button>
                            <button type="button" class="btn btn-dark btn-cart">장바구니</button>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="black">리뷰작성</h3>

           	<form name="reviewForm" action="${pageContext.request.contextPath }/purchase/reviewOk" 
           		method="POST" enctype="multipart/form-data">
   				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	            <div class="write-review" data-pid="${dto.pid }">
	            	<input type="hidden" name="pid" value="${dto.pid }"/>
	                <div class="write-info">
	                    <span class="write-name">${username }</span>
	                    <input type="hidden" name="email" value="${username }"/>
	                    <span class="write-date">${now }</span>
	                </div>
	                <div class="startRadio">
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="0.5">
	                        <span class="startRadio__img"><span class="blind">별 1개</span></span>
	                    </label>
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="1.0">
	                        <span class="startRadio__img"><span class="blind">별 1.5개</span></span>
	                    </label>
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="1.5">
	                        <span class="startRadio__img"><span class="blind">별 2개</span></span>
	                    </label>
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="2.0">
	                        <span class="startRadio__img"><span class="blind">별 2.5개</span></span>
	                    </label>
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="2.5">
	                        <span class="startRadio__img"><span class="blind">별 3개</span></span>
	                    </label>
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="3.0">
	                        <span class="startRadio__img"><span class="blind">별 3.5개</span></span>
	                    </label>
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="3.5">
	                        <span class="startRadio__img"><span class="blind">별 4개</span></span>
	                    </label>
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="4.0">
	                        <span class="startRadio__img"><span class="blind">별 4.5개</span></span>
	                    </label>
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="4.5">
	                        <span class="startRadio__img"><span class="blind">별 5개</span></span>
	                    </label>
	                    <label class="startRadio__box">
	                        <input type="radio" name="r_score" id="" value="5.0">
	                        <span class="startRadio__img"><span class="blind">별 5.5개</span></span>
	                    </label>
	                </div>
	                <div class="write">
	                    <textarea name="r_comment" class="review-write" placeholder="리뷰를 작성해 주세요."></textarea>
	                </div>
	                <div class="upload-btn">
	                    <input id="up-file" type="file" name="upload" accept=".gif, .jpg, .png, .jpeg">
	                    <button type="submit" name="subnit-btn" class="btn btn-dark write-submit">작성완료</button>
	                </div>
	            </div>
            </form>

            <h3 id="recm" class="black">리뷰</h3>
            <div>
                <button type="button" class="review-btn btn btn-dark btn-full">리뷰 보기</button>
            </div>
            <div class="review-wrap">
            	<c:if test="${fn:length(list) != 0 }">
	            	<c:forEach var="review" items="${list }">
		                <div class="review" data-prid="${review.prid }">
		                    <div class="review-img">
		                        <img src="${pageContext.request.contextPath }/upload/purchase/${review.r_img }" />
		                    </div>
		                    <div class="review-content">
		                        <div class="userid">${review.email }</div>
		                        <div class="regdate">${review.r_regdate }</div>
		                        <div class="prod-rate">
	                            <c:choose>
	                            	<c:when test="${review.r_score >= 0 && review.r_score <= 1}">
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            	</c:when>
	                            	<c:when test="${review.r_score > 1 && review.r_score <= 2}">
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            	</c:when>
	                            	<c:when test="${review.r_score > 2 && review.r_score <= 3}">
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            	</c:when>
	                            	<c:when test="${review.r_score > 3 && review.r_score <= 4}">
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star gray"></i>
	                            		<i class="fas fa-star gray"></i>
	                            	</c:when>
	                            	<c:when test="${review.r_score > 4 && review.r_score < 5}">
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star gray"></i>
	                            	</c:when>
	                            	<c:when test="${review.r_score == 5}">
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            		<i class="fas fa-star blue"></i>
	                            	</c:when>
	                            </c:choose>
	                       		<span class="black">${review.r_score }</span>
	                        </div>
	                        <div class="content">${review.r_comment }</div>
		                    <c:if test="${username == review.email }">
			                    <div class="review-btns">
			                        <button type="button" class="btn btn-dark review-update" data-confirm="0">수정</button>
			                        <button type="button" class="btn btn-dark review-delete">삭제</button>
			                    </div>
		                    </c:if>
		                    </div>
		                    <div class="line"></div>
		                </div>
	                </c:forEach>
                </c:if>
                <c:if test="${fn:length(list) == 0 }">
                	<div class="review" data-prid="-1">
                		<span class="no-review">지금 바로 첫번째 리뷰의 주인공이 되어주세요!</span>
                	</div>
                </c:if>
            </div>
        </div>
    </section>

    <!-- footer -->
    <footer id="footer" class="text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <div class="footer-logo wow fadeInDown">
                        <img src="${pageContext.request.contextPath }/resources/purchase/image/cookLogo.png" alt="logo">
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

    <script src="${pageContext.request.contextPath }/resources/purchase/JS/r_prod_recp_detail.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/purchase/JS/reviewajax.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/purchase/JS/apply_in.js"></script>
</body>

</html>