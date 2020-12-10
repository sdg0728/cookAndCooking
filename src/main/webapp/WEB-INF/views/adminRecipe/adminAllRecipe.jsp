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
        <title>관리자 레시피</title>
        
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
                    <a href="${pageContext.request.contextPath}/admin/admin_main">
                        <img src="${pageContext.request.contextPath }/resources/img/logo_w.png" alt="log">
                    </a>
                </h1>
                <!-- /logo -->

            </div>

            <!-- main nav -->
            <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                <ul id="nav" class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath }/adminRecipe/adminAllRecipe">모든 레시피</a></li>
                    <li><a href="${pageContext.request.contextPath }/adminRecipe/adminWarningRecipe">신고된 업로드</a></li>
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


      
	<section id="portfolio">

		<div class="section-title text-center wow fadeInDown">
			<br>
			<h2>${name[0] }</h2>
		</div>
  		 <div class="section-title text-center wow fadeInDown">
               <br>
                <h2>모든 레시피</h2>    
                <p>유저 업로드 레시피 </p>
                		
            </div>

		<div id="projects" class="clearfix">
			<c:forEach items="${list}" var="list" varStatus="status">

				<figure class="mix portfolio-item user_recipe"
					data-rid=${list.user_rid }>
					<img class="img-responsive img_height"
						src="${pageContext.request.contextPath }/upload/userRecipe/${list.img}" alt="Portfolio Item">
					<a href="#recipe"><span class="plus"></span></a>
					<!-- href 에 포스트 id를 가져와야됨 -->
					<figcaption class="mask">
						<div class="regdate">${list.regdate }</div>
						<h3>${list.name}</h3>
						<span>${name[0] }</span>

					</figcaption>
				</figure>
				</c:forEach>
				<!-- The Modal -->
				
				<div class="modal modal-center " id="recipe" data-toggle="0">
					<div class="modal-dialog modal-center modal-dialog-scrollable">
						<div id="modal_size" class="modal-content ">

							<!-- Modal Header -->
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title">요리제목</h3>
								<h4 class="modal-id">by 초코바</h4>
								
								<form action="deleteOk2?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data" method="POST">
								<div class="user_delete_btn">
								
							    <input type="hidden" name="user_rid" id="user_rid" value="${user_rid }"/> 
							  <input type="hidden" name="email" id="email" value="${email}"/> 
									<button type="submit" name="delete">삭제</button>
								</div>
								</form>
								
								
								<!-- 수정하기 -->
							
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

			
		</div>




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
						<img
							src="${pageContext.request.contextPath }/resources/img/logo_w.png"
							alt="logo">
					</div>

					<div class="footer-social wow fadeInUp">
						<h3>We are social</h3>
						<ul class="text-center list-inline">
							<li><a href="http://goo.gl/RqhEjP"><i
									class="fa fa-facebook fa-lg"></i></a></li>
							<li><a href="http://goo.gl/hUfpSB"><i
									class="fa fa-twitter fa-lg"></i></a></li>
							<li><a href="http://goo.gl/r4xzR4"><i
									class="fa fa-google-plus fa-lg"></i></a></li>
							<li><a href="http://goo.gl/k9zAy5"><i
									class="fa fa-dribbble fa-lg"></i></a></li>
						</ul>
					</div>

					<div class="copyright">

						Shared by <i class="fa fa-love"></i><a
							href="https://bootstrapthemes.co">BootstrapThemes</a>

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
	<script
		src="${pageContext.request.contextPath }/resources/js/vendor/jquery-1.11.1.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<!-- jquery.nav -->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.nav.js"></script>
	<!-- Portfolio Filtering -->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.mixitup.min.js"></script>
	<!-- Fancybox -->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.fancybox.pack.js"></script>
	<!-- Parallax sections -->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.parallax-1.1.3.js"></script>
	<!-- jQuery Appear -->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.appear.js"></script>
	<!-- countTo -->
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-countTo.js"></script>
	<!-- owl carousel -->
	<script
		src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<!-- WOW script -->
	<script
		src="${pageContext.request.contextPath }/resources/js/wow.min.js"></script>
	<!-- theme custom scripts -->
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

	<script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
	<script>
	

	
	$(".plus").click(function() {
		var target = $(event.target).parents(".user_recipe").attr("data-rid"); 
console.log("eee"+target)
		
		console.log("[plus]")
		if($("#recipe").attr("data-toggle") == 0){
			console.log("[toggle 0]")
			loadPage(target);
			$("#recipe").attr("data-toggle", 1);
		} else {
			console.log("[toggle 1]")
			$("#recipe").hide();
			$("#recipe").attr("data-toggle", 0);
		}
	});
	
	$(".close").click(function() {
		$("#recipe").hide();
		$("#ing").empty();
		$("#recipe").attr("data-toggle", 0);
	});

	function loadPage(target){
	
		//var user_rid = target.parents(".user_recipe").attr("data-rid");
			
	    $.ajax({
	        //   /board/{page}/{pageRows}
	        //   현재  /board/rest
	        url : "./recipeView?user_rid=" + target,
	        type : "GET",
	        cache : false,
	        success : function(data, status){
	            if(status == "success"){
	                //alert("정상적으로 받았쥬?");

	                if(updateList(data, target)){
	                	$("#recipe").show();
	                }
	            }
	        }

	    });
			
	}
	
	function updateList(jsonObj, target){
	   

	    if(jsonObj.status == "OK"){
	        var count = jsonObj.count;
	        var items = jsonObj.data1[0];  // 글 배열
	        var names = jsonObj.data2[0];
			$(".modal-title").text(items.name);
			$(".modal-id").text(names);
		
			if(items.kind == 1) $(".modal-kind").text("한식");
			if(items.kind == 2) $(".modal-kind").text("중식");
			if(items.kind == 3) $(".modal-kind").text("일식");
			if(items.kind == 4) $(".modal-kind").text("양식");
			if(items.kind == 5) $(".modal-kind").text("퓨전");
			if(items.kind == 6) $(".modal-kind").text("기타");
			
			if(items.taste == 1) $(".modal-taste").text("밥/죽/떡");
			if(items.taste == 2) $(".modal-taste").text("면/만두");
			if(items.taste == 3) $(".modal-taste").text("국물");
			if(items.taste == 4) $(".modal-taste").text("구이/찜/조림");
			if(items.taste == 5) $(".modal-taste").text("볶음/튀김/부침");
			if(items.taste == 6) $(".modal-taste").text("나물/샐러드");
			if(items.taste == 7) $(".modal-taste").text("베이킹/디저트");
			if(items.taste == 8) $(".modal-taste").text("양념");
			if(items.taste == 9) $(".modal-taste").text("음료");

			
			var arr = items.ingredient.split(",");
			
			for (var i = 0; i < arr.length; i++) {
				$("#ing").append("<tr scope='col'><td>"+arr[i]+"</td><td></td></tr> ")
				
			}
			$('#modal_img').attr('src', '${pageContext.request.contextPath }/upload/userRecipe/'+items.img)
			
			$("input[name=user_rid]").val(items.user_rid);
			if(items.recipe_1 != null) $('#recipe_order1').text("1. "+items.recipe_1) 
			else $('#recipe_order1').text("")
			if(items.recipe_2 != null) $('#recipe_order2').text("2. "+items.recipe_2)	
			else $('#recipe_order2').text("")
			if(items.recipe_3 != null) $('#recipe_order3').text("3. "+items.recipe_3)	
			else $('#recipe_order3').text("")
			if(items.recipe_4 != null) $('#recipe_order4').text("4. "+items.recipe_4)	
			else $('#recipe_order4').text("")
			if(items.recipe_5 != null) $('#recipe_order5').text("5. "+items.recipe_5)	
			else $('#recipe_order5').text("")
			if(items.recipe_6 != null) $('#recipe_order6').text("6. "+items.recipe_6)	
			else $('#recipe_order6').text("")
			if(items.recipe_7 != null) $('#recipe_order7').text("7. "+items.recipe_7)	
			else $('#recipe_order7').text("")
			if(items.recipe_8 != null) $('#recipe_order8').text("8. "+items.recipe_8)	
			else $('#recipe_order8').text("")
			if(items.recipe_9 != null) $('#recipe_order9').text("9. "+items.recipe_9)	
			else $('#recipe_order9').text("")
			if(items.recipe_10 != null) $('#recipe_order10').text("10. "+items.recipe_10) 
			else $('#recipe_order10').text("")
		
			
	        return true;
	    } else {
	        alert("내용이 없습니다");
	        return false;
	    }
	
	}
	</script>

</body>
</html>
       