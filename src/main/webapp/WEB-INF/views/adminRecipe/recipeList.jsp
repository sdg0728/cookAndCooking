<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />
<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="en" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="en" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Always force latest IE rendering engine -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Meta Keyword -->
        <meta name="keywords" content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
        <!-- meta character set -->
        <meta charset="utf-8">

        <!-- Site Title -->
        <!--관리자 레시피 리스트-->
        <title>레시피</title>
        
        <!--
        Google Fonts
        ============================================= -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
		
        <!--
        CSS
        ============================================= -->
        <!-- Fontawesome -->
		<link rel="stylesheet"
		   href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css">
		<!-- Bootstrap -->
		<link rel="stylesheet"
		   href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
		<!-- Fancybox -->
		<link rel="stylesheet"
		   href="${pageContext.request.contextPath }/resources/css/jquery.fancybox.css">
		<!-- owl carousel -->
		<link rel="stylesheet"
		   href="${pageContext.request.contextPath }/resources/css/owl.carousel.css">
		<!-- Animate -->
		<link rel="stylesheet"
		   href="${pageContext.request.contextPath }/resources/css/animate.css">
		<!-- Main Stylesheet -->
		<link rel="stylesheet"
		   href="${pageContext.request.contextPath }/resources/css/main.css">
		<!-- Main Responsive -->
		<link rel="stylesheet"
		   href="${pageContext.request.contextPath }/resources/css/responsive.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/cookingcls/CSS/recipeList.css">
		
		<!-- Modernizer Script for old Browsers -->
        <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
        
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">

    </head>
	
    <body>
        <header id="navigation" class="navbar-fixed-top" style="background-image: url(${pageContext.request.contextPath}/resources/img/slider/main2.jpg);">
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
                        <a href="${pageContext.request.contextPath}/admin/admin_main">
                            <img src="g${pageContext.request.contextPath}/resources/img/logo_w.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->
    
                </div>
    
                <!-- main nav -->
                <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                    <ul id="nav" class="nav navbar-nav">
                        <li><a>레시피 관리</a></li>
                       <c:if test="${fn:length(username) == 0 }">
                  <li><a href="member/sign">회원가입</a></li>
                  <li><a href="${pageContext.request.contextPath }/security/login">로그인</a></li>
               </c:if>
               <c:if test="${fn:length(username) != 0 }">
                  <li><span class="username">${username }</span></li>
                  <li><span class="logout">로그아웃</span></li>
                  <form name="logoutFrm" action="${pageContext.request.contextPath }/security/logout" method="POST">
                     <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  </form>
               </c:if>
                    </ul>
                </nav>
                <!-- /main nav -->
            </div>
    
            </div>
        </header>


     <div class="tt">
        <section>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">no</th>
                    <th scope="col">레시피명</th>
                    <th scope="col">분류</th>
                </tr>
                </thead>
                <tbody>
                
                <c:forEach var ="list" items="${list}">                
                <tr>
                    <td>${list.rid }</td>
                    <td><a href="detail?rid=${list.rid}">${list.name}</a></td>
                    <td></td>
				     	
				 </tr>
                </c:forEach>
                </tbody>
            </table>

            <div>
            	<form action="create" method="post">
            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                <input type="submit" value="등록" class="btn btn-success" >
                </form>
            </div>
            
            <div>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    </ul>
                </nav>
            </div>
        </section>
    </div>


        <!--
        #footer
        ========================== -->
        <footer id="footer" class="text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="footer-logo wow fadeInDown">
                            <img src="img/logo.png" alt="logo">
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
         <!-- main jQuery -->
        <script src="${pageContext.request.contextPath}/resources/js/vendor/jquery-1.11.1.min.js"></script>
        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <!-- jquery.nav -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.nav.js"></script>
        <!-- Portfolio Filtering -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.mixitup.min.js"></script>
        <!-- Fancybox -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js"></script>
        <!-- Parallax sections -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.parallax-1.1.3.js"></script>
        <!-- jQuery Appear -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.appear.js"></script>
        <!-- countTo -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery-countTo.js"></script>
        <!-- owl carousel -->
        <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
        <!-- WOW script -->
        <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
        <!-- theme custom scripts -->
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

        <script src="${pageContext.request.contextPath}/resources/security/JS/logout.js"></script>
    </body>
    

    
</html>
