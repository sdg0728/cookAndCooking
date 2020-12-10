<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />

<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="en" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="en" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
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
    <title>농수산물 상세정보</title>

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
                    <li><a href="${pageContext.request.contextPath }/purchase/rlist">레시피 도시락</a></li>
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
            <div class="prod-info-wrap" data-pchk="0" data-pid="${dto.productno }">
                <div class="prod-img">
                    <img src="${thumbnail }" 
                    onError="event.target.src='${pageContext.request.contextPath}/upload/purchase/default.png'"/>
                </div>
                <div class="prod-info">
                    <div class="info">
                        <div class="prod-name black">${dto.productName }</div>
                        <div class="prod-price black"><span>${dto.dpr1 }</span></div>
                        <c:choose>
	                    		<c:when test="${dto.direction == 0 }">
		                    		<div class="prod-upDown price-down">${dto.value }</div>
	                    		</c:when>
	                    		
	                    		<c:when test="${dto.direction == 1 }">
		                    		<div class="prod-upDown price-up">${dto.value }</div>
	                    		</c:when>
	                    		
	                    		<c:when test="${dto.direction == 2 }">
		                    		<div class="prod-upDown">${dto.value }</div>
	                    		</c:when>
                    		</c:choose>
                        <div class="prod-rate">
                            
                        </div>
                    </div>
                    <div class="button-wrap">
                        <input type="text" name="count" class="form-control" placeholder="수량입력" />
                        <div class="buttons">
                            <button type="button" class="btn btn-dark btn-purchase">구매하기</button>
                            <button type="button" class="btn btn-dark btn-cart">장바구니</button>
                        </div>
                    </div>
                </div>
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
    <!-- End #footer -->

    <!-- JavaScripts -->

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
    
    <script src="${pageContext.request.contextPath }/resources/purchase/JS/apply_in.js"></script>
</body>

</html>