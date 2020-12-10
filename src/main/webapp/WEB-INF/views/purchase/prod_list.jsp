<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />

<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="en" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="en" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="ko" class="no-js">
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
    <title>농수산물</title>

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
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/recipe_product_list.css">
    <!-- 로그인 로그아웃 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">

    <!-- Modernizer Script for old Browsers -->
    <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>

</head>

<body>
    <!--
        Fixed Navigation
        ==================================== -->
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
                    <li class="current"><a href="${pageContext.request.contextPath }/purchase/plist">농수산물</a></li>
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
    <!--
        End Fixed Navigation
        ==================================== -->
    <section>
        <div class="top-nav">
            <div class="nav-wrap">
                <div class="nav-title">
                    <span class="black">레시피 도시락</span>
                </div>
                <div class="nav-content">
                    <ul>
                        <li data-cate-code="000" id="recommand" class="black">추천</li>
                        <li data-cate-code="100">식량작물</li>
                        <li data-cate-code="200">채소</li>
                        <li data-cate-code="300">특용작물</li>
                        <li data-cate-code="400">과일</li>
                        <li data-cate-code="500">축산</li>
                        <li data-cate-code="600">수산</li>
                    </ul>
                </div>
                <div class="hamberger">
                    <i class="fas fa-bars"></i>
                </div>
                <div class="nav-search">
                    <input type="text" name="search" class="prod-search" placeholder="검색">
                    <button type="button" class="btn btn-success" onclick="search()">검색</button>
                </div>
            </div>
        </div>

        <div class="content-wrap">
            <table id="table" class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">상품명</th>
                        <th scope="col">단위</th>
                        <th scope="col">가격</th>
                        <th scope="col">등락률</th>
                    </tr>
                </thead>
                <tbody class="prod_tbody">
                    <c:forEach var="prod" items="${list }">
                    	<tr class="prod-info" data-cate-code="${prod.category_code }" 
                    		data-direction="${prod.direction }" data-value="${prod.value }"
                    		data-name="${prod.productName }">
                    		<th scope="row" class="prod-name">
                    			<a href="${pageContext.request.contextPath }/purchase/pdetail?no=${prod.productno }&name=${prod.productName }">${prod.productName }</a>
                    		</th>
                    		<td class="prod-unit">${prod.unit }</td>
                    		<td class="prod-price">${prod.dpr1 }</td>
                    		<c:choose>
	                    		<c:when test="${prod.direction == 0 }">
		                    		<td class="prod-value price-down">${prod.value }</td>
	                    		</c:when>
	                    		
	                    		<c:when test="${prod.direction == 1 }">
		                    		<td class="prod-value price-up">${prod.value }</td>
	                    		</c:when>
	                    		
	                    		<c:when test="${prod.direction == 2 }">
		                    		<td class="prod-value">${prod.value }</td>
	                    		</c:when>
                    		</c:choose>
                    	</tr>
                    </c:forEach>
                </tbody>
            </table>
			<div id="pagenation">
				<nav class="page-wrap d-flex justify-content-center" aria-label="Page navigation example">
					<ul class="pagination page-ul"></ul>
				</nav>
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
    
    <script src="${pageContext.request.contextPath }/resources/purchase/JS/jquery.ajax-cross-origin.min.js"></script>
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

    <script src="${pageContext.request.contextPath }/resources/purchase/JS/product_list.js"></script>
    <!-- 재료 api ajax -->
    <script src="${pageContext.request.contextPath }/resources/purchase/JS/product_list_ajax.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/purchase/JS/apply_in.js"></script>
</body>

</html>