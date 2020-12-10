<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <title>상품 관리</title>

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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/admin_main.css">
    
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
                    <a href="${pageContext.request.contextPath }/admin/admin_main">
                        <img src="${pageContext.request.contextPath }/resources/purchase/image/cookLogo.png">
                    </a>
                </h1>
                <!-- /logo -->

            </div>

            <!-- main nav -->
            <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                <ul id="nav" class="nav navbar-nav">
                    <li class="current"><a href="${pageContext.request.contextPath }/admin/alist">상품리스트</a></li>
                    <li><a href="${pageContext.request.contextPath }/admin/aplist">신청 레시피 상품</a></li>
                    <li><a href="${pageContext.request.contextPath }/admin/slist">판매내역</a></li>
                    <c:if test="${true }">
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
        	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
            <div class="top-wrap">
                <h3 class="black recipe-title">상품리스트</h3>
                <div class="right">
	                <div class="admin-search-wrap">
	                	<input type="text" class="admin-search" name="admin-search" placeholder="검색할 상품을 입력해 주세요." />
	                	<button type="button" class="btn btn-dark btn-search">검색</button>
	                </div>
	                <div class="right">
		                <a href="${pageContext.request.contextPath }/admin/ainsert"><button type="button" class="btn btn-dark reg-btn">등록하기</button></a>
		                <button type="button" class="btn btn-dark btn-delete">삭제하기</button>
	                </div>
                </div>
            </div>
            <table id="table" class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">체크</th>
                        <th scope="col">상품명</th>
                        <th scope="col">가격</th>
                        <th scope="col">수량</th>
                        <th scope="col">분류</th>
                    </tr>
                </thead>
                <tbody id="tbody">
                	<c:forEach var="dto" items="${list }">
	                	<tr data-pid="${dto.pid }">
	                		<td class="check"><input type="checkbox" name="delete-chk" value="${dto.pid }"/></td>
	                        <th scope="row"><a href="${pageContext.request.contextPath }/admin/aupdate?pid=${dto.pid }" class="name">${dto.p_name }</a></th>
	                        <td class="price">${dto.p_price }</td>
	                        <td class="count">${dto.p_count }</td>
	                        <td class="kind">${dto.p_kind }</td>
	                    </tr>
                	</c:forEach>
                </tbody>
            </table>
			<nav class="page-wrap d-flex justify-content-center" aria-label="Page navigation example">
				<ul class="pagination page-ul">
					<c:forEach var="i" begin="1" end="${totalPage }">
						<c:if test="${i == 1 }">
							<li class="page-item active"><a class="page-link" data-page=${i } onclick="viewPage()">${i }</a></li>
						</c:if>
						<c:if test="${i != 1 }">
							<li class="page-item"><a class="page-link" data-page=${i } onclick="viewPage()">${i }</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</nav>
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

    <script src="${pageContext.request.contextPath }/resources/purchase/JS/admin_prod_ajax.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
</body>

</html>