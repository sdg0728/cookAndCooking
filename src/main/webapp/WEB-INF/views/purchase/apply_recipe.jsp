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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/r_prod_recp_detail.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/product_detail.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/apply_recipe.css">
	
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
                    <li class="current apply"><a>상품신청</a></li>
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
	        <form name="userInfo" action="${pageContext.request.contextPath }/purchase/applyOk" method="POST" 
	        	id="userInfo" enctype="multipart/form-data" onsubmit="return check()">
	        	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	        	<input type="hidden" name="u_name" value="${username }" />
	            <h3 class="black">상품 신청</h3>
                <div class="prod-info-wrap">
                    <div class="form-group prod-name black">
                        <label for="a_name">상품명</label>
                        <input type="text" name="a_name" class="form-control" id="a_name" placeholder="상품명을 입력해 주세요." required>
                    </div>
                    <div class="form-group add-prod-price black">
                        <label for="a_price">가격</label>
                        <input type="text" name="a_price" class="form-control" id="a_price" placeholder="숫자만 입력" required/>
                    </div>
                    <div class="form-group add-prod-kind black">
                        <label for="a_kind">음식 분류</label>
                        <select class="form-control" name="a_kind" id="a_kind" required>
                            <option value="1">한식</option>
                            <option value="2">중식</option>
                            <option value="3">일식</option>
                            <option value="4">양식</option>
                            <option value="5">퓨전</option>
                            <option value="6">기타</option>
                        </select>
                    </div>
                    <div class="form-group add-prod-taste black">
                        <label for="a_taste">조리 분류</label>
                        <select class="form-control" name="a_taste" id="a_taste" required>
                            <option value="1">밥/죽/떡</option>
                            <option value="2">면/만두</option>
                            <option value="3">국물</option>
                            <option value="4">구이/찜/조림</option>
                            <option value="5">볶음/튀김/부침</option>
                            <option value="6">나물/샐러드</option>
                            <option value="7">베이킹/디저트</option>
                            <option value="8">양념</option>
                            <option value="9">음료</option>
                        </select>
                    </div>
                    <div class="form-group a-prod-content black">
                        <label for="a_content">상품 설명</label>
                        <textarea class="form-control" name="a_content" id="a_content" rows="3" placeholder="상품 설명 입력" required></textarea>
                    </div>
                    <div class="form-group prod-name black">
                        <label for="a_count">신청 수량</label>
                        <input type="text" name="a_count" class="form-control" id="a_count" placeholder="수량을 입력해 주세요." required>
                    </div>
					<div class="form-group black">
						<label for="up-file">이미지</label> 
						<input type="file" class="form-control-file" id="up-file" name="upload" accept=".gif, .jpg, .png, .jpeg" required/>
					</div>
				</div>
                <div class="button-wrap">
                    <button type="submit" class="btn btn-dark btn-submit">등록하기</button>
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

    <script src="${pageContext.request.contextPath }/resources/purchase/JS/apply_in.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
</body>

</html>