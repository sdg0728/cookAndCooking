<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />
<c:set var="kind" value='<%=new String[]{"","한식","중식","일식","양식","퓨전","기타"} %>' />
<c:set var="taste" value='<%=new String[]{"","밥/죽/떡","면/만두","국물","구이/찜/조림","볶음/튀김/부침","나물/샐러드","베이킹/디저트 ","양념","음료"} %>'/>
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
        <!--관리자 레시피 보기-->
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
		   
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/cookingcls/CSS/recipeDetail.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">
		
		<!-- Modernizer Script for old Browsers -->
        <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
        

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
                            <img src="${pageContext.request.contextPath}/resources/img/logo_w.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->
    
                </div>
    
                <!-- main nav -->
                <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                    <ul id="nav" class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath }/admin/recipe/list">레시피 관리</a></li>
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
            <div>
                <h3>${list.name}</h3>
      			
            </div>
            <hr>
            <div>
                카테고리
                <c:forEach var="i" begin="1" end="6">
          <c:if test="${i == list.kind}">
	        ${kind[i] }
	       </c:if>
	         </c:forEach>
            </div>
            <hr>
                        <div>
               취향	
                <c:forEach var="i" begin="1" end="9">
              <c:if test="${i == list.taste }">
	        ${taste[i] }
	       </c:if>
	         </c:forEach>
            </div>
            <hr>
            <div>
            
                <img src="${pageContext.request.contextPath}/upload/recipe/${list.img}" class="imgcard" alt="">
                 
            </div>
            <hr>

            <div>
                재료
                ${list.ingredient}
            </div>
            
            <hr>

            <div>
                레시피
                <br>
 			${list.recipe_1}<br>
 			${list.recipe_2}<br>
 			${list.recipe_3}<br>
 			${list.recipe_4}<br>
 			${list.recipe_5}<br>
 			${list.recipe_6}<br>
 			${list.recipe_7}<br>
 			${list.recipe_8}<br>
 			${list.recipe_9}<br>
 			${list.recipe_10}<br>
            </div>
            <hr>

                <div>
            <form action="${pageContext.request.contextPath}/admin/recipe/update" method="get">
            		<input type="hidden" value="${list.rid}" name="rid">
            		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                    <input type="submit" class="btn btn-success" value="수정">
             	</form>     
                    
			<!-- Button trigger modal -->
				<button type="button" class="btn" data-toggle="modal" data-target="#exampleModal">
				  삭제
		</button>
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">DELETE</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        삭제하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
				       	<form action="deleteOk" method="post">
				        <input type="submit" class="btn btn-primary" value="YES" name="delete">
				        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				        <input type="hidden" value="${list.rid}" name="rid">
				        </form>
				      </div>
				    </div>
				  </div>
				</div>
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
                            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo">
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
        
        <script src="${pageContext.request.contextPath}/resources/security/JS/logout.js"></script>
        
        <script>
        	
        $("input[name='delete']").click(function(){
        	
        	location.href = "deleteOk"
        	
        	
        })
        
        </script>
        
    </body>
</html>
