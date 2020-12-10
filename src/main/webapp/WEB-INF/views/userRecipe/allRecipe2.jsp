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
                    <a href="/">
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
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">로그인</a></li>
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
		<input type="hidden" id="emailId" value="${username }">
        
        <section id="portfolio">

            <div class="section-title text-center wow fadeInDown">
               <br>
                <h2>레시피의 모든 것</h2>    
                <p>원하는대로 골라 보는 레시피 </p>
                		<input id="search-text" type="text" name="name" value=""
				placeholder="레시피 및 쉐프를 입력해주세요" />
            </div>
            
            <nav class="project-filter clearfix text-center wow fadeInLeft"  data-wow-delay="0.5s">
                <ul class="list-inline">
                    <li><a  class="kind_num">추천</a></li>
                    <li><a  class="kind_num">전체</a></li>                 
                    <li><a  class="kind_num" >인기</a></li>
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
								
								<form action="deleteOk?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data" method="POST">
								<div class="user_delete_btn">
								
								
								<!-- 신고하기 -->
							  <!--   <input type="hidden" name="user_rid" id="user_rid" value="${user_rid }"/>  -->
							  <input type="hidden" name="email" id="email" value="${email}"/> 
									<button type="submit" name="singo">신고</button>
								</div>
								</form>
								
								
							
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
								<div class="fa fa-heart heart command"></div>
								<span>추천</span>
								<!-- 색상 변경 -->
							</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<div class="comment_rapper">
									<!-- 	<form action="commentOk.do"> -->
									<div class="comment">

										<div class='com' onclick="deleteCom(${com.comment_id})">
											
											<p class='userId'>${com.user_id }</p>
											<div>${com.content }</div>
										</div>
										<hr>
									</div>

									<!-- <input type="hidden" name="post_id" value="${feed.post_id }" /> -->
									<!--  <input type="hidden" id="postId${status.index }" name="post_id" value="${feed.post_id }" />
							<input type="hidden" name="user_id" value="yo2s" /> -->
									<input id="comment-text" type="text" name="content" value=""
										placeholder="댓글을 입력해주세요." />
									<!-- </form> -->
								</div>

							</div>

						</div>
					</div>
				</div>
				<!-- !!!! -->

		
		<!-- end #projects -->
          

        </section>
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
        <script src="${pageContext.request.contextPath }/resources/userRecipe/JS/allRecipe.js"></script>
        
    </body>
</html>
        
 