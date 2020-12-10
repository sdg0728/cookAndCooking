<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />

<!DOCTYPE html>
<html>
<head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Always force latest IE rendering engine -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Meta Keyword -->
        <meta name="keywords" content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
        <!-- meta character set -->
        <meta charset="utf-8">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
	<!--
<!--
        Google Fonts
        ============================================= -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <!--
        CSS
        ============================================= -->
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
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/CSS/admin.css">
        <!-- Main Responsive -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/responsive.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">

<title>요리조리 관리자 메인</title>
</head>
<body class="grey lighten-3">
	
	
	
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
                        <a href="${pageContext.request.contextPath }/admin/admin_main">
                            <img src="${pageContext.request.contextPath }/resources/img/logo_w.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->

                    </div>

                    <!-- main nav -->
                    <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                        <ul id="nav" class="nav navbar-nav">
                            <li class="current"><a href="${pageContext.request.contextPath }/admin/admin_main">홈</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin/admin_member_list">회원</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin/recipe/list">레시피</a></li>
                            <li><a href="${pageContext.request.contextPath }/adminRecipe/adminAllRecipe">유저레시피</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin/cooking">강의</a></li>
                            <li><a href="${pageContext.request.contextPath }/admin/alist">상품</a></li>
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
	<div class="space"></div>
  <!--Main layout-->
      <!-- Heading -->
      <div class="card mb-4 wow fadeIn">

        <!--Card content-->
        <div class="card-body d-sm-flex justify-content-between">

          <h4 class="mb-2 mb-sm-0 pt-1">
            <a href="#" target="_blank">Admin Page</a>
            <span>/</span>
            <span>Dashboard</span>
          </h4>

        </div>

      </div>
      <!-- Heading -->
  
  <main class="pt-5 mx-lg-5">
    <div class="container-fluid mt-5">
		
		<div class="small_space"></div>
	  	<div class="naemes"><h2>레시피 등록 현황</h2> <h2>유저레시피 등록 현황</h2></div>
	
	<div class="row wow fadeIn">
        <!--Grid column-->
        <!-- 레시피 -->
	  	
        
        <div class="col-md-4 mb-4">

          <!--Card-->
          <div class="card mb-4">



            <!--Card content-->
            <div class="card-body">

              <canvas id="pieChart"></canvas>

            </div>

          </div>
          <!--/.Card-->

          <!--Card-->
          <div class="card mb-4">

          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->
        
        <!--Grid column-->
        
        
        <div class="col-md-4 mb-4">

          <!--Card-->
          <div class="card mb-4">



            <!--Card content-->
            <div class="card-body">

              <canvas id="pieChart2"></canvas>

            </div>

          </div>
          <!--/.Card-->

          <!--Card-->
          <div class="card mb-4">

          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->
      
    </div>
            
		<div class="small_space"></div>
	  	<!-- 회원 -->
	  	<div><h2>연간 레시피 판매 량</h2></div>
	  
      <!--Grid row-->
      <div class="row wow fadeIn">

        <!--Grid column-->
        <div class="col-md-9 mb-4">

          <!--Card-->
          <div class="card">

            <!--Card content-->
            <div class="card-body">

              <canvas id="myChart"></canvas>

            </div>

          </div>
          <!--/.Card-->

        </div>
        <!--Grid column-->
	</div>
    
  </main>
  <!--Main layout-->
	<div class="space"></div>
	
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

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/mdbootstrap/Bootstrap-4-templates/admin/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/mdbootstrap/Bootstrap-4-templates/admin/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/mdbootstrap/Bootstrap-4-templates/admin/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/mdbootstrap/Bootstrap-4-templates/admin/js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    // Animations initialization
    new WOW().init();

  </script>
  
  <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/recommend.js"></script>
  <script src="${pageContext.request.contextPath }/resources/admin/JS/admin.js"></script>
  <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
</body>
</html>