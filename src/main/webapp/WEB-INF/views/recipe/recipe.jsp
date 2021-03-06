<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
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
        <!-- 레시피/레시피 상세-->
        <title>레시피</title>
        
        <!--
        Google Fonts
        ============================================= -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
		
        <!--
        CSS
        ============================================= -->
        <!-- Fontawesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css">
        <!-- owl carousel -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
        <!-- Animate -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
        <!-- Main Responsive -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/recipe_tt.css">
		
		<!-- Modernizer Script for old Browsers -->
        <script src="${pageContext.request.contextPath}/resources/js/vendor/modernizr-2.6.2.min.js"></script>
        


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
                        <a href="#body">
                            <img src="${pageContext.request.contextPath}/resources/img/logo_w.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->
    
                </div>
    
                <!-- main nav -->
                <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                    <ul id="nav" class="nav navbar-nav">
                        <li><a href="product_list.html">HOME</a></li>
                        <li><a href="recipe_product_list.html">레시피</a></li>
                        <li class="current"><a href="#portfolio">유저레시피</a></li>
                        <li><a href="orders.html">강의</a></li>
                        <li><a href="#">구매</a></li>
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

	<input type="hidden" id="emailId" value="${username }">

     <div class="tt">

    <section>
    	<input type="hidden" id="path" value="${pageContext.request.contextPath}">
        <div class="container col-8 ">

            <div class="col-4 ">
                <form action="">  
                    <input class="form-control search dis" id="searchText" type="text" id="recipeSearch" placeholder="검색하세요" value="">
                    <button type="submit" class="btn btn-success dis search-btn"><i class="fa fa-search"></i></button>
                </form>
             </div>
             
              <div class="col-4 ">
              	<a class="category" data-filter="7">추천</a>
              	<a class="category" data-filter="0">전체</a>
                <a class="category" data-filter="1">한식</a>
                <a class="category" data-filter="2">중식</a>
                <a class="category" data-filter="3">일식</a>
                <a class="category" data-filter="4">양식</a>
                <a class="category" data-filter="5">퓨전</a>
                <a class="category" data-filter="6">기타</a>
             </div>
             

</div>
    </section>

 <!-- 리스트 끝 -->
  <section>
  
  <div class="cardhei">
 	
 	
        
    </div>
        </section>

   </div>


	<!-- The Modal -->
	<div class="modal modal-center " id="recipe" data-toggle ="0">
    <div class="modal-dialog modal-center modal-dialog-scrollable">
       <div id="modal_size" class="modal-content ">

          <!-- Modal Header -->
          <div class="modal-header">
             <h4 class="modal-title"> </h4>
             <!-- 포스트 제목 가져와야됨 -->
             <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
              <img src="img/food/pizza.jpg" class="imgcard" alt="">
				<div class="modal-kind"></div>
				<div class="modal-taste"></div>
              <div id="ing"></div>
              
            
              <div id="recipe1"></div>
              <div id="recipe2"></div>
              <div id="recipe3"></div>
              <div id="recipe4"></div>
              <div id="recipe5"></div>
              <div id="recipe6"></div>
              <div id="recipe7"></div>
              <div id="recipe8"></div>
              <div id="recipe9"></div>
              <div id="recipe10"></div>


          </div>
          
          
          <!-- Modal footer 댓글 -->
          <div class="modal-footer">
             <div class="comment_rapper">
           
                <div class="comment">
                <!-- 
                   <c:forEach var="com" items="${comArr }">
                      <c:if test="${com.post_id == feed.post_id }">
                         <div class='com' onclick="">
                            <img src='' />
                            <p class='userId'></p>
                            <div></div>
                         </div>
                         <hr>
                      </c:if>
                   </c:forEach>
 -->
                </div>
                <!-- <input type="hidden" name="post_id" value="${feed.post_id }" /> -->
                <!--  <input type="hidden" id="postId${status.index }" name="post_id" value="${feed.post_id }" />
             <input type="hidden" name="user_id" value="yo2s" /> -->
                <input id="comment-text" type="text" name="content" value=""
                   placeholder="댓글을 입력해주세요." onkeypress="enterSubmit(this)" />
                <!-- </form> -->
             </div>

          </div>

       </div>
    </div>
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
        <script src="${pageContext.request.contextPath}/resources/recipe/JS/recipe.js"></script>
        
    </body>
</html>
