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
    <title>구매하기</title>

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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/cart.css?<%=System.currentTimeMillis()%>">
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
	        <form name="userInfo" action="${pageContext.request.contextPath }/purchase/buyOk" method="POST" id="userInfo">
	        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	            <h3 class="black" style="margin-top: 20px;">구매하기</h3>
	            <table id="table" class="table">
	                <thead class="thead-dark">
	                    <tr>
	                        <th scope="col">상품정보</th>
	                        <th scope="col">금액</th>
	                        <th scope="col">수량</th>
	                        <th scope="col">총액</th>
	                    </tr>
	                </thead>
	                <tbody id="tbody"></tbody>
	            </table>
	            
	            <div id="total-price"></div>
	            <div id="setLine"></div>
	            <div class="deliver-info-wrap">
	            	<h3>[사용자 정보 입력]</h3>
	                <div class="form-check form-check-inline radio-btn">
	                    <input class="form-check-input" type="radio" name="addr-use" id="addr-input"
	                        value="option2" checked>
	                    <label class="form-check-label" for="addr-input">주소 직접 입력</label>
	                </div>
	                <div class="form-check form-check-inline radio-btn">
	                    <input class="form-check-input" type="radio" name="addr-use" id="addr-use"
	                        value="option1">
	                    <label class="form-check-label" for="addr-use">저장된 주소 사용</label>
	                </div>
					
	                <div class="inputs">
	                    <div class="form-group">
	                        <label for="name">이름</label>
	                        <input type="text" class="form-control" id="name" name="name" placeholder="">
	                    </div>
	                    <div class="form-group">
	                        <label for="phone">전화번호</label>
	                        <input type="text" class="form-control" id="phone" name="phone">
	                    </div>
	                    <div class="form-group address-input address_box">
		                    <input type="hidden" name="currentPage" value="1" />
							<input type="hidden" name="countPerPage" value="100" />
							<input type="hidden" name="resultType" value="json" />
							<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIwMTEyNzIzNDExMjExMDQ3MzU=" />
							<input type="hidden" name="zip" value=""/>
							
	                        <label for="address">주소</label>
							<input type="text" name="address" class="address form-control" placeholder="address" readonly /> 
							<input type="text" id="addr_input" name="keyword" class="form-control" onkeydown="enterSearch();" />
							<input type="button" id="addr_btn" name="addr_btn" class="btn btn-dark" onClick="getAddr();" value="주소찾기" />
	                    </div>
	                    <div id="list"></div>
	                </div>
	            </div>
	            <div class="btn-wrap">
	                <button type="submit" name="pay" class="btn btn-dark pay" >결제하기</button>
	                <a href="${pageContext.request.contextPath }/purchase/plist"><button type="button" class="btn btn-dark">목록으로</button></a>
	            </div>
	        </form>
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

    <script src="${pageContext.request.contextPath }/resources/purchase/JS/product_list.js"></script>

    <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/purchase/JS/buyAjax.js"></script>
    <!-- 주소 js -->
    <script src="${pageContext.request.contextPath }/resources/member/JS/address.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/purchase/JS/apply_in.js"></script>
</body>

</html>