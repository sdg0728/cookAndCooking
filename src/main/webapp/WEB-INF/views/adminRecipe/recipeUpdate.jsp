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
        <!--레시피 쓰기-->
        <title>레시피</title>
        
        <!--
        Google Fonts
        ============================================= -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
		
        <!--
        CSS
        ============================================= -->
 
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
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/cookingcls/CSS/recipeWrite.css">
		
		<!-- Modernizer Script for old Browsers -->
        <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
        
    	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">

    </head>
	
    <body>
        <header id="navigation" class="navbar-fixed-top" style="background-image:url(${pageContext.request.contextPath}/resources/img/slider/main2.jpg);">
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
 	<form action="updateOk?${_csrf.parameterName }=${_csrf.token }" enctype="multipart/form-data" method="POST">
          <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
           <input type="hidden" name="rid" id="rid" value="${rid }"/>
            <div>
              <hr>
               <label for="">레시피명</label>
             	
               <input class="recipe_Uploadname" type="text" name="name" id="" placeholder="레시피를 입력해주세요" 
               value="${list.name}">
            
            </div>
            <hr>
                <div>
                    <label for="">카테고리</label>
                    <div class="dropdown">
                   
                        <select id="dropdown-menu" name="kind"  aria-labelledby="dropdownMenu1">
                        <c:forEach var="i" begin="1" end="6">
                        	<c:if test="${i == list.kind }">
	                          <option value=${i } selected>${kind[i] }</option>
                        	</c:if>
                        	<c:if test="${i != list.kind }">
	                          <option value=${i }>${kind[i] }</option>
                        	</c:if>
                        </c:forEach>
                        </select>
                      </div>
                </div>
            <hr>
              <div>
                    <label for="">분류</label>
                    <div class="dropdown">
                   
                        <select id="dropdown-menu" name="taste"  aria-labelledby="dropdownMenu1">
                       	  <c:forEach var="i" begin="1" end="9">
                       	  	<c:if test="${i == list.taste }">
                       	  		<option value=${i } selected>${taste[i] }</option>
                       	  	</c:if>	
                       	  	<c:if test="${i !=list.taste }">
                       	  		<option value=${i }>${taste[i] }</option>
                       	  	</c:if>
                       	  </c:forEach>
                        </select>
                      </div>
                </div>
            <hr>
            <div>
                <label for="">IMAGE</label>
                <input type="hidden" name="img" value="${list.img}">	
                <input type="file" name="upload" id="up-file">
            </div>
            <hr>
            <div>
                <!--버튼-->
                
                <label for="">재료</label>
                <input type="hidden" id="ingredientId" name="ingredient"> 
                <div class="mar dis">
                    <svg id="plus2" width="20px" height="20px" margin="10px" viewBox="0 0 16 16" class="bi bi-plus-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                    </svg>
                </div>
                <div class="mar dis">
                    <svg id="minus2" width="20px" height="20px" margin="10px" viewBox="0 0 16 16" class="bi bi-dash-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
                      </svg>
                </div>

                <div id="plusbox2" >
                 <c:forEach  items="${fn:split(list.ingredient, ',') }" var="item">
                 		
                 			 <input class="sp2" type="text" onkeyup="escrecipe(this)" style="width:200px; margin: 7px;" value="${item }" name=""> 
                 	</c:forEach>
                </div>
                <div id="chkBox2" class="dis mar">
                    
                </div>
                <div id="del2" class="dis mar">

                </div>
            </div>

            <hr>

            <div>
                <label for="">레시피</label>
                
                <input type="hidden" name="recipe_1" id="recipe_1" value=""> 
                <input type="hidden" name="recipe_2" id="recipe_2" value=""> 
                <input type="hidden" name="recipe_3" id="recipe_3" value=""> 
                <input type="hidden" name="recipe_4" id="recipe_4" value=""> 
                <input type="hidden" name="recipe_5" id="recipe_5" value=""> 
                <input type="hidden" name="recipe_6" id="recipe_6" value=""> 
                <input type="hidden" name="recipe_7" id="recipe_7" value=""> 
                <input type="hidden" name="recipe_8" id="recipe_8" value=""> 
                <input type="hidden" name="recipe_9" id="recipe_9" value=""> 
                <input type="hidden" name="recipe_10" id="recipe_10" value=""> 
                <div class="mar dis">
                    <svg id="plus" width="20px" height="20px" margin="10px" viewBox="0 0 16 16" class="bi bi-plus-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                    </svg>
                </div>
                <div class="mar dis">
                    <svg id="minus" width="20px" height="20px" margin="10px" viewBox="0 0 16 16" class="bi bi-dash-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z"/>
                      </svg>
                </div>

                <div id="plusbox">
                 <c:forEach items="${rec_list}" var="rec" varStatus="status">
                	 
                	 <input class="sp" type="text" id="rec${status.count } " onkeyup="escrecipe(this)" style="width:350px; margin: 7px;" value="${rec }" name="recipe_${status.count }"> 
                </c:forEach> <!-- id값이 rec1 부터 증가해야됨  -->
                
                </div>
                
                
                <div id="chkBox" class="dis mar">
                    
                </div>
                <div id="del" class="dis mar">

                </div>
            </div>
            <!--끝-->
            <hr>

                <div>
                    <input type="submit" class="btn btn-success submit-btn" value="수정">
                </div>
         </form>
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
                            <img src="${pageContext.request.contextPath}/resource/img/logo.png" alt="logo">
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
            var cnt = 1;
            var btn = document.createElement("input")
            /// 레시피 확인 버튼
            $(btn).attr("type","button")
            $(btn).attr("class","btn btn-success")
            $(btn).val("확인")

            $("#plus").click(function(){
               
                var add = document.createElement("input")
                  if(cnt >=11) return;
               // plus 버튼
                $(add).attr("class","sp")   /// 버튼 단체 비활 클래스
                $(add).css("width","350px")
                $(add).css("margin","7px")
                $(add).attr("type","text")  
                $(add).attr("id","rec"+cnt) //데이터에 담기위해 name 추가 
                $(add).attr("onkeyup","escrecipe(this)")    // esc 누르면 없어짐
                cnt++
            
                $("#plusbox").append(add)
                $(btn).css("display","block")   // 확인버튼 보여지기(다시 눌렀을 때)
                if(cnt!=0){ // input이 하나라도 생기면
                   
                   $("#chkBox").append(btn)
                }
            })

            var del = document.createElement("input")   
            /// 레시피 취소 버튼 
                $(del).attr("type","button")
                $(del).attr("class","btn")
                $(del).attr("id","rec"+cnt)
                $(del).val("취소")

            $("#chkBox").click(function(){
                $(".sp").attr("readonly","true")/// 확인 버튼 눌렀을 때 비활성화
                $(del).css("display","block")
                
                for (var i = 0; i < $('.sp').length; i++) {
               var res = $(".sp")[i].value
               $('#recipe_'+(i+1)).val(res)
            }
                
                $("#del").append(del)   // 확인 버튼 누르면 취소버튼 생성
                
            })

            $("#del").click(function(){
                $(".sp").removeAttr("disabled") // 취소 버튼 누르면 비활 해제
                $(del).css("display","none")  // 취소버튼 사라짐
            })

            $("#minus").click(function(){   // 마이너스 버튼 
                var num = $(".sp").length - 1
                $($(".sp")[num]).remove()   // 맨 마지막 input 사라짐
            cnt--
                if(num<=0){
                    $(btn).css("display","none")    // input 다사라지면 확인버튼 없어짐
               cnt=1;
                }
                
            })





            // + 눌렀을 때 
            $("#plus2").click(function(){
                var dd = document.createElement("div");
                $(dd).addClass("wrap");

                var add2 = document.createElement("input")
                $(add2).attr("class","sp2") // input 모음
                $(add2).css("width","200px")    // 디자인
                $(add2).css("margin","7px")
                $(add2).attr("type","text") 
                $(add2).attr("onkeyup","escinput(this)") 
                cnt2++  // input이 하나 이상인지


                var spinner = document.createElement("input")
                $(spinner).attr("type","text")
                $(spinner).attr("class","num")
               
                $(spinner).css("width","50px")
                $(spinner).css("margin","7px")
                // spinner 생성


                $(dd).append(add2) // div에 input 넣기
                $(dd).append(spinner)  
                $("#plusbox2").append(dd);

                $(btn2).css("display","block")  
                // - 누른 뒤 다시 + 눌렀을 때 확인 버튼 보이기

                // input이 1개라도 있으면 확인버튼 넣기
                if(cnt2!=0){
                   
                   $("#chkBox2").append(btn2)
                }
            })
            
                        // 재료 +, - 버튼 input
            var cnt2 = 0;
            var btn2 = document.createElement("input")
            // 확인 버튼 누르면 변경 못함
            $(btn2).attr("type","button")
            $(btn2).attr("class","btn btn-success ing_btn")
            $(btn2).val("확인")
            //재료 확인 버튼 눌렀을 때 문자열로 합쳐주기 
            $(btn2).click(function(){
            
               var res = ''
               
               for (var i = 0; i < $('.sp2').length; i++) {
               res += $(".sp2")[i].value+' '+$(".num")[i].value + ','
            }
               
               $('#ingredientId').val(res)
               
            })

            // 취소 버튼
            var del2 = document.createElement("input")
                $(del2).attr("type","button")
                $(del2).attr("class","btn")
                $(del2).val("취소")

            // 확인 눌렀을 때 disabled
            $("#chkBox2").click(function(){
                $(".sp2").attr("disabled","true")
                $(".num").attr("disabled","true")
                $(del2).css("display","block")
                $("#del2").append(del2)
                
            })

            // 누르면 disabled 해제
            $("#del2").click(function(){
                $(".sp2").removeAttr("disabled")
                $(".num").removeAttr("disabled")
                $(del2).css("display","none")
            })

            // 마이너스 누르면 input 제거
            $("#minus2").click(function(){
                var num2 = $(".sp2").length - 1
                $($(".sp2")[num2]).remove()

                var spin = $(".num").length - 1
                $($(".num")[spin]).remove()

                if(num2==0){
                    $(btn2).css("display","none")

                }
                
            })
            
             $(".submit-btn").click(function() {
            	var res = ''
                	
                	for (var i = 0; i < $('.sp2').length; i++) {
                		if(i == $('.sp2').length - 1){
    						res += $(".sp2")[i].value;
                		} else{
    						res += $(".sp2")[i].value+','
                		}
    				}
                	
                	$('#ingredientId').val(res)
            });
            
                    
            function escinput(e){
                var put = $(".sp2").length - 1

                if(event.keyCode == 27){
                    $(e).parent().remove();

                    if(put==0){
                        $(btn2).css("display","none")
                    }
                }
            }

            function escrecipe(e){
                var put2 = $(".sp").length -1

                if(event.keyCode == 27){
                    $(e).remove();

                    if(put2==0){
                        $(btn).css("display","none")
                    }

                }
            }
            $("#dropdownMenu1").click(function(){
                $('li').children('a')
                
            })

          $('input[type="text"]').keydown(function() {
              if (event.keyCode === 13) {
                event.preventDefault();
                 };
         }); 
            
            $(function() {
                $("#up-file").on('change', function(){
                    readURL(this);
                });
            });

            function readURL(input) {
                if (input.files && input.files[0]) {
                var reader = new FileReader();
                
            

                reader.onload = function (e) {
                        $('#uploadImg').attr('src', e.target.result);
                    }
                   console.log(input.files[0])
                  reader.readAsDataURL(input.files[0]);
                
                }
            }
        </script>



    </body>
</html>
