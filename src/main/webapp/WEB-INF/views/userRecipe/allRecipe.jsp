<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="email" value='<%=session.getAttribute("username") %>' />
<!DOCTYPE html>

    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
       
        <!-- Site Title -->
        <title>추천 레시피</title>
        
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
		<!-- allRecipeCSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/userRecipe/CSS/allRecipe.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/userRecipe/CSS/star.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">
		
		<!-- Modernizer Script for old Browsers -->
        <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
		
    </head>
	
    <body>

        <!--
        Fixed Navigation
        ==================================== -->
      <header id="navigation" class="navbar-fixed-top" style="background-image: url('${pageContext.request.contextPath }/resources/img/slider/main2.jpg');">
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
                    <a href="${pageContext.request.contextPath }/">
                        <img src="${pageContext.request.contextPath }/resources/img/logo_w.png" alt="log">
                    </a>
                </h1>
                <!-- /logo -->

            </div>

            <!-- main nav -->
            <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                <ul id="nav" class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath }/userRecipe/allRecipe">추천 레시피</a></li>
                    <li><a href="${pageContext.request.contextPath }/userRecipe/uploadRecipe">레시피 업로드</a></li>
                    <li ><a href="${pageContext.request.contextPath }/userRecipe/myRecipe?email=${email }">나의 레시피</a></li>
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

        </div>
    </header>
        <!--
        End Fixed Navigation
        ==================================== -->
		
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<input type="hidden" name="email" id="emailId" value="${username}"/> 
		<input type="hidden" id="path" value="${pageContext.request.contextPath}">
        
        <section id="portfolio">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
            <div class="section-title text-center wow fadeInDown">
               <br>
                <h2>레시피의 모든 것</h2>    
                <p>원하는대로 골라 보는 레시피 </p>
                		<input id="search-text" type="text" name="search-text" value=""
				placeholder="레시피 및 쉐프를 입력해주세요" />
            </div>
            
            <nav class="project-filter clearfix text-center wow fadeInLeft"  data-wow-delay="0.5s">
                <ul class="list-inline">
                    <li><a  class="kind_num">추천</a></li>
                    <li><a  class="kind_num" >전체</a></li>
                    <li><a class="kind_num" >한식</a></li>
                    <li><a  class="kind_num">중식</a></li>
                    <li><a class="kind_num" >양식</a></li>
                    <li><a  class="kind_num" >일식</a></li>
                    <li><a class="kind_num" >퓨전</a></li>
                    <li><a  class="kind_num">기타</a></li>
                </ul>
            </nav>

          	<div id="projects" class="clearfix"></div>
          	
			<!-- The Modal -->
				
				<div class="modal modal-center " id="recipe" data-toggle="0">
					<div class="modal-dialog modal-center modal-dialog-scrollable">
						<div id="modal_size" class="modal-content ">

							<!-- Modal Header -->
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title">요리제목</h3>
								<h4 class="modal-id">by 초코바</h4>
								
								<!-- 신고하기 -->
								<div class="user_delete_btn">
							  <input type="hidden" name="user_rid" id="user_rid" value="${user_rid }"/> 
							  <input type="hidden" name="emailId" id="email" value="${username}"/> 
							  
									<button id="notify" type="button" name="singo">신고</button>
								</div>
								
								
							
								<!-- 포스트 제목 가져와야됨 -->
							</div>

							<!-- Modal body -->
							<div class="modal-body main_content">
								<div class="recipe_content_img">
									<div>
										<img id="modal_img" class="upload_img">
									</div>

									<div class="category">
										<h4 class="modal-kind">한식</h4>
										<h5 class="modal-taste">찜</h5>
									</div>


									<!-- 레시피 설명 -->
									<div class="recipe_content">
										<div id="recipe_order1" class="recipe_order"></div>
										<div id="recipe_order2" class="recipe_order"></div>
										<div id="recipe_order3" class="recipe_order"></div>
										<div id="recipe_order4" class="recipe_order"></div>
										<div id="recipe_order5" class="recipe_order"></div>
										<div id="recipe_order6" class="recipe_order"></div>
										<div id="recipe_order7" class="recipe_order"></div>
										<div id="recipe_order8" class="recipe_order"></div>
										<div id="recipe_order9" class="recipe_order"></div>
										<div id="recipe_order10" class="recipe_order"></div>
									</div>

								</div>


								<!-- 사용재료 -->
								<h3>사용재료</h3>
								<div class="food_content">
									<table class="table table-striped use_food">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">재료 및 중량</th>

											</tr>
										</thead>
										<tbody id="ing">

										</tbody>
									</table>
								</div>
								<div class="like">
									<div class="startRadio">
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="0.5">
				                           <span class="startRadio__img"><span class="blind">별 1개</span></span>
				                       </label>
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="1.0">
				                           <span class="startRadio__img"><span class="blind">별 1.5개</span></span>
				                       </label>
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="1.5">
				                           <span class="startRadio__img"><span class="blind">별 2개</span></span>
				                       </label>
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="2.0">
				                           <span class="startRadio__img"><span class="blind">별 2.5개</span></span>
				                       </label>
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="2.5">
				                           <span class="startRadio__img"><span class="blind">별 3개</span></span>
				                       </label>
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="3.0">
				                           <span class="startRadio__img"><span class="blind">별 3.5개</span></span>
				                       </label>
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="3.5">
				                           <span class="startRadio__img"><span class="blind">별 4개</span></span>
				                       </label>
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="4.0">
				                           <span class="startRadio__img"><span class="blind">별 4.5개</span></span>
				                       </label>
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="4.5">
				                           <span class="startRadio__img"><span class="blind">별 5개</span></span>
				                       </label>
				                       <label class="startRadio__box">
				                           <input type="radio" name="preference" id="" value="5.0">
				                           <span class="startRadio__img"><span class="blind">별 5.5개</span></span>
				                       </label>
				                   </div>
				                   <span class="p_score"></span>
									<input type="button" id="preference" class="btn preference" value="추천" data-status="0" />
								</div>
								
								<!-- 색상 변경 -->
							</div>
							<!-- Modal footer -->
			
				   <div class="modal-footer">
          <input type="hidden" value="${user_id }" name="user_id"/>
         
             <div class="comment_rapper">
           		
           	
                <div class="comment">
					<div class="commentPage" >
						
					</div>
                </div>
          
            
                <input id="comment-text" type="text" name="content" value=""
                   placeholder="댓글을 입력해주세요." />
                <!-- </form> -->
             </div>

          </div>

       </div>
    </div>
 </div>

  
        </section>
	
				<!-- !!!! -->

		
		<!-- end #projects -->
          

        <!--
        End #Portfolio
        ========================== -->

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
        
        <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>

    	<script src="${pageContext.request.contextPath }/resources/userRecipe/JS/allRecipe.js"></script>   
    </body>
</html>
        
 