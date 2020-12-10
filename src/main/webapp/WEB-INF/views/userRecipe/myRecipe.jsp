<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="email" value='<%=session.getAttribute("username")%>' />
<!DOCTYPE html>

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Title -->
<title>나의(아이디박기) 레시피</title>

<!--
          Google Fonts
        ============================================= -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700"
	rel="stylesheet" type="text/css">
	
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
<!-- myRecipeCSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/userRecipe/CSS/myRecipe.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/userRecipe/CSS/star.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Modernizer Script for old Browsers -->
<script
	src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
        integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
</head>

<body>

	<!--
        Fixed Navigation
        ==================================== -->
	<header id="navigation" class="navbar-fixed-top"
		style="background-image: url('${pageContext.request.contextPath }/resources/img/slider/main2.jpg');">
		<div class="container">

			<div class="navbar-header">
				<!-- responsive nav button -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- /responsive nav button -->

				<!-- logo -->
				<h1 class="navbar-brand">
					<a href="${pageContext.request.contextPath }/"> <img
						src="${pageContext.request.contextPath }/resources/img/logo_w.png"
						alt="log">
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



	<section id="portfolio">

		<div class="section-title text-center wow fadeInDown">
			<br>
			<h2>${name[0] }</h2>
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
								
								<form action="deleteOk?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data" method="POST">
								<div class="user_delete_btn">
								
							    <input type="hidden" name="user_rid" id="user_rid" value="${user_rid }"/> 
							  <input type="hidden" name="email" id="email" value="${email}"/> 
									<button type="submit" name="delete">삭제</button>
								</div>
								</form>
								
								
								<!-- 수정하기 -->
								<form action="editorRecipe?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data" method="POST" > 
								<div class="user_editor_btn">
									<input type="hidden" name ="user_rid" value="${user_rid}">
									<button class="editor_btn" type="submit" name="editor">수정</button>
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
	
	
	$("#comment-text").keyup(function(){
		
		//	$(".comment").text($(".comment").text()+$(this).val()) 
		if(event.keyCode==13){
			insertCom()
		}
	});
	
	
	$("button[name=editor]").click(function(){
		var target= event.target
		console.log(target)
		
	});
	
	
	
	
	$("span[class=plus]").click(function() {
		var target = $(event.target);
		
		if($("#recipe").attr("data-toggle") == "0"){
			loadPage(target);
			comload($(target));
			$("#recipe").attr("data-toggle", "1");
		} else {
			$("#recipe").hide();
			$("#recipe").attr("data-toggle", "0");
		}
	});
	
	$(".close").click(function() {
		$("#recipe").hide();
		$("#ing").empty();
		$("#recipe").attr("data-toggle", 0);
		$(".commentPage").empty();
	});

	// page번째 목록 읽어오기
	function loadPage(target){
		var user_rid = target.parents(".user_recipe").attr("data-rid");
		var email = $(".username").text();
	    $.ajax({
	        //   /board/{page}/{pageRows}
	        //   현재  /board/rest
	        url : "./recipeView?user_rid=" + user_rid + "&email=" + email,
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
	} // end loadPage()

	function updateList(jsonObj, target){
	    result = "";  // 최종 결과물

	    if(jsonObj.status == "OK"){
	    	var count = jsonObj.count;
	        var items = jsonObj.data1[0];  // 글 배열
	        var names = jsonObj.data2[0];
	        var isChk = jsonObj.isChk;
	        
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

			
		//	var arr = $("#ingredient").text(items.ingredient).split(",");
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
			
			//이거추가 
			$("#recipe").attr("data-rid",items.user_rid);
			
			if(isChk != null){
				var preference = isChk[0].preference;
				var str = "";
				
				$(".startRadio").html("");
				$(".startRadio").attr("class", "starScore");
				
				if(preference >= 0 && preference < 1){
					str += '<i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>'
				} else if(preference >= 1 && preference < 2){
					str += '<i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>'
				} else if(preference >= 2 && preference < 3){
					str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>'
				} else if(preference >= 3 && preference < 4){
					str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>'
				} else if(preference >= 4 && preference < 5){
					str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i>'
				} else if(preference >= 5){
					str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i>'
				} else {
					str += ''
				}
				
				$(".starScore").html(str);
				$(".p_score").text(preference);
				
				console.log($("#preference").val());
				$("#preference").val("추천 취소");
				$("#preference").attr("data-status", 1);
			} else {
				$(".starScore").html("");
				$(".starScore").attr("class", "startRadio");
				$(".startRadio").html('<label class="startRadio__box">'+
                        '<input type="radio" name="preference" id="" value="0.5">'+
                        	'<span class="startRadio__img"><span class="blind">별 1개</span></span>'+
	                   '</label>'+
	                    '<label class="startRadio__box">'+
	                        '<input type="radio" name="preference" id="" value="1.0">'+
	                        '<span class="startRadio__img"><span class="blind">별 1.5개</span></span>'+
	                    '</label>'+
	                    '<label class="startRadio__box">'+
	                        '<input type="radio" name="preference" id="" value="1.5">'+
	                       '<span class="startRadio__img"><span class="blind">별 2개</span></span>'+
	                    '</label>'+
	                    '<label class="startRadio__box">'+
	                        '<input type="radio" name="preference" id="" value="2.0">'+
	                        '<span class="startRadio__img"><span class="blind">별 2.5개</span></span>'+
	                    '</label>'+
	                    '<label class="startRadio__box">'+
	                        '<input type="radio" name="preference" id="" value="2.5">'+
	                        '<span class="startRadio__img"><span class="blind">별 3개</span></span>'+
	                    '</label>'+
	                    '<label class="startRadio__box">'+
	                        '<input type="radio" name="preference" id="" value="3.0">'+
	                        '<span class="startRadio__img"><span class="blind">별 3.5개</span></span>'+
	                    '</label>'+
	                    '<label class="startRadio__box">'+
	                        '<input type="radio" name="preference" id="" value="3.5">'+
	                        '<span class="startRadio__img"><span class="blind">별 4개</span></span>'+
	                    '</label>'+
	                    '<label class="startRadio__box">'+
	                        '<input type="radio" name="preference" id="" value="4.0">'+
	                        '<span class="startRadio__img"><span class="blind">별 4.5개</span></span>'+
	                    '</label>'+
	                    '<label class="startRadio__box">'+
	                        '<input type="radio" name="preference" id="" value="4.5">'+
	                       '<span class="startRadio__img"><span class="blind">별 5개</span></span>'+
	                    '</label>'+
	                    '<label class="startRadio__box">'+
	                        '<input type="radio" name="preference" id="" value="5.0">'+
	                        '<span class="startRadio__img"><span class="blind">별 5.5개</span></span>'+
	                    '</label>');
				
				$(".p_score").text("");
				$("#preference").val("추천");
				$("#preference").attr("data-status", 0);
			}
			
	        return true;
	    } else {
	        alert("내용이 없습니다");
	        return false;
	    }
	}
	
	
	   function comload(rid){
	    	var user_rid = parseInt(rid.parents(".user_recipe").attr("data-rid"));
	          $.ajax({
	               url : "./comload.ajax?rid=" + user_rid,
	               type : "GET",
	               cache : false,
	               success : function(data, status){
	                   if(status == "success"){
	                      commentLoad(data)
	                   
	                     console.log("status")
	                   }
	               }

	           });
	      }  
	
	   function delTarget(del){
	        var del = del
	        $(del).click(function(){
	       var cid = $(event.target).attr("data-cid");
	           
	           
	           $.ajax({
	              url :"./del.ajax?cid="+cid,
	             type : "GET",
	             cache : false,
	                 success : function(jsonObj, status){
	                     if(status == "success"){
	                       // console.log("success")
	                          var count = jsonObj.count;
	                       var data = jsonObj.data;
	               
	                       if(jsonObj.status == "OK"){
	                          alert("댓글이 삭제되었습니다.")
	                          window.location.reload();
	                          
	                          return true
	                       }else{
	                          alert("삭제 실패하였습니다")
	                          window.location.reload();
	                          return false
	                       }           
	                     }
	                 }
	             
	           });
	     
	        })
	        
	     }
	   
	   function commentLoad(jsonObj){
	    	  console.log("???"+jsonObj)
	         var count = jsonObj.count;
	         var data = jsonObj.data;
	         var username = $(".username").text();   
	         if(jsonObj.status == "OK"){
	            console.log("OK")
	           $(".commentPage").empty();
	            for(var i = 0; i<data.length; i++){
	               console.log("[username: "+username+" ]" );
	               
	               var comment_id = document.createElement("p");
	               $(comment_id).attr("id","comment_id");
	               $(comment_id).text(data[i].name);
	               console.log()
	               var comment_cc = document.createElement("div");
	               $(comment_cc).attr("id","comment_cc");
	               $(comment_cc).text(data[i].content);
	               
	               var x_btn = document.createElement("input");
	               $(x_btn).attr("type","button");
	               $(x_btn).attr("value","X");
	               
	               
	               $(".commentPage").append(comment_id);
	               $(".commentPage").append(comment_cc);
	              // console.log($(".username").text()+"username")
	              // console.log(data[i].rid)
	              // console.log("data_email"+data[i].email)
	               
	               if(data[i].email == username){
	                  $(x_btn).attr("data-cid",data[i].cid);
	                 $(".commentPage").append(x_btn);      
	                 delTarget(x_btn)
	               }
	               
	            
	            }
	            
	            
	            return true
	         }else{
	           // alert("내용 XX")
	            return false
	         }
	         
	      }
	   function insertCom(){
			var content = $("#comment-text").val();
			var username = $(".username").text();
			var rid = $("#recipe").attr("data-rid");
		
			console.log(content+"내용")
			
			console.log(username+"이름")
			
			console.log(rid+"포스트")
			  $.ajax({
			        url : "./comment.ajax?content="+content +"&name="+username+"&user_rid="+rid,
			        type : "GET",
			        cache : false,
			        success : function(jsonObj, status){
			            if(status == "success"){		               
			            	
			            	var data = jsonObj.data;
			            	
			            	if(jsonObj.status == "OK"){
			            		
			            		alert("성공")
			            		$("#recipe").hide();
			            		$("#recipe").attr("data-toggle", 0);
			            		return true
			            	}else{

			            		alert("실패")
			            		return false 
			            	}
			            	
			            }
			        }
		
			
			});
			  
		}
	
	$(".preference").click(function(e) {
		var user_rid = $("input:hidden[name=user_rid]").val();
		var email = $(".username").text();
		var preference = $("input:radio[name=preference]:checked").val();
		var _csrf = $("input:hidden[name=_csrf]").val();
		var name = $(".modal-id").text();
		
		console.log(name)
		if($(event.target).attr("data-status") == 0){
			$.ajax({
				url: "./preference?user_rid="+user_rid + "&email=" + email + "&preference=" + preference + "&user_id=" + name + "&_csrf=" + _csrf,
				type: "PUT",
				cache: false,
				success: function(data, status) {
					if(status == "success"){
						if(data.status == "OK"){
							$(".startRadio").html("");
							$(".startRadio").attr("class", "starScore");
							var str = "";
							if(preference >= 0 && preference < 1){
								str += '<i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>'
							} else if(preference >= 1 && preference < 2){
								str += '<i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>'
							} else if(preference >= 2 && preference < 3){
								str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>'
							} else if(preference >= 3 && preference < 4){
								str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>'
							} else if(preference >= 4 && preference < 5){
								str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i>'
							} else if(preference >= 5){
								str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i>'
							} else {
								str += ''
							}
							$(".starScore").html(str);
							
							$(".p_score").text(preference);
							$("#preference").val("추천 취소");
							$("#preference").attr("data-status", 1);
							alert("추천!")
						}else {
							alert("OK 다시 시도해주세요.");
						}
					}else {
						alert("FAIL 다시 시도해주세요.");
					}
				}
			});
		} else {
			preference = parseFloat($(".p_score").text());
			$.ajax({
				url: "./preferenceDel?user_rid="+user_rid + "&email=" + email + "&preference=" + preference + "&user_id=" + name + "&_csrf=" + _csrf,
				type: "DELETE",
				cache: false,
				success: function(data, status) {
					if(status == "success"){
						if(data.status == "OK"){
							$(".starScore").html("");
							$(".starScore").attr("class", "startRadio");
							$(".startRadio").html('<label class="startRadio__box">'+
			                        '<input type="radio" name="preference" id="" value="0.5">'+
			                        	'<span class="startRadio__img"><span class="blind">별 1개</span></span>'+
				                   '</label>'+
				                    '<label class="startRadio__box">'+
				                        '<input type="radio" name="preference" id="" value="1.0">'+
				                        '<span class="startRadio__img"><span class="blind">별 1.5개</span></span>'+
				                    '</label>'+
				                    '<label class="startRadio__box">'+
				                        '<input type="radio" name="preference" id="" value="1.5">'+
				                       '<span class="startRadio__img"><span class="blind">별 2개</span></span>'+
				                    '</label>'+
				                    '<label class="startRadio__box">'+
				                        '<input type="radio" name="preference" id="" value="2.0">'+
				                        '<span class="startRadio__img"><span class="blind">별 2.5개</span></span>'+
				                    '</label>'+
				                    '<label class="startRadio__box">'+
				                        '<input type="radio" name="preference" id="" value="2.5">'+
				                        '<span class="startRadio__img"><span class="blind">별 3개</span></span>'+
				                    '</label>'+
				                    '<label class="startRadio__box">'+
				                        '<input type="radio" name="preference" id="" value="3.0">'+
				                        '<span class="startRadio__img"><span class="blind">별 3.5개</span></span>'+
				                    '</label>'+
				                    '<label class="startRadio__box">'+
				                        '<input type="radio" name="preference" id="" value="3.5">'+
				                        '<span class="startRadio__img"><span class="blind">별 4개</span></span>'+
				                    '</label>'+
				                    '<label class="startRadio__box">'+
				                        '<input type="radio" name="preference" id="" value="4.0">'+
				                        '<span class="startRadio__img"><span class="blind">별 4.5개</span></span>'+
				                    '</label>'+
				                    '<label class="startRadio__box">'+
				                        '<input type="radio" name="preference" id="" value="4.5">'+
				                       '<span class="startRadio__img"><span class="blind">별 5개</span></span>'+
				                    '</label>'+
				                    '<label class="startRadio__box">'+
				                        '<input type="radio" name="preference" id="" value="5.0">'+
				                        '<span class="startRadio__img"><span class="blind">별 5.5개</span></span>'+
				                    '</label>');
							
							$(".p_score").text("");
							$("#preference").val("추천");
							$("#preference").attr("data-status", 0);
						}else {
							alert("OK 다시 시도해주세요.");
						}
					}else {
						alert("FAIL 다시 시도해주세요.");
					}
				}
			});
		}
		
	});
	
	
	
	</script>

</body>
</html>
