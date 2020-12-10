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
        <!--강의 개설 페이지-->
        <title>Cooking</title>
        
        <!--Bootstrap-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />   
         


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
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/cookingcls/CSS/clsDetail.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">
          <!--  
          
          //제이쿼리 ui css-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        
        <!-- //제이쿼리 style css-->
        <link rel="stylesheet" href="/resources/demos/style.css">
        
        <!--//제이쿼리 js-->
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        
        <!--//제이쿼리 ui js-->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
		
		<!-- Modernizer Script for old Browsers -->
        <script src="${pageContext.request.contextPath}/resources/js/vendor/modernizr-2.6.2.min.js"></script>
        
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
  
       
   
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
                        <a href="${pageContext.request.contextPath}/">
                            <img src="${pageContext.request.contextPath}/resources/img/logo_w.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->
    
                </div>
    
                <!-- main nav -->
                <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                    <ul id="nav" class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath }/cooking/mycls">마이클래스</a></li>
                        <li><a href="${pageContext.request.contextPath }/cooking/usercls">쿠킹클래스</a></li>
                        <li><a href="#">구매</a></li>
                              <c:if test="${fn:length(username) == 0 }">
                  <li><a href="member/sign">회원가입</a></li>
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

        <div class="tt">

            <section>
            <form action="" name="userInfo" id="userInfo"  method="post">
             <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
              <input type="hidden" name="user_id" value="${user_id}" />
              <input type="hidden" name="email" value="${username }">
                <div class="mar">
                    <p>강의명</p>
                    <input class="form-control dis cls-size" name="name" id="clsname" type="text" placeholder="등록할 강의명을 입력하세요" maxlength="30">
                </div>
                <div class="mar">
                    <p>${username }</p>
                </div>
                <div class="mar">
                   <p>카테고리 </p>
                    <div class="dropdown">
                         <select id="dropdown-menu" name="kind" aria-labelledby="dropdownMenu1">
                          <option value="1">한식</option>
                          <option value="2">일식</option>
                          <option value="3">중식</option>
                          <option value="4">양식</option>
                          <option value="5">퓨전</option>
                          <option value="6">기타</option>
       
                        </select>
                      </div>              
                 </div>
                  
                 
                <div class="mar">
				 <p>모집마감일: <input type="date" id="datepicker" name="enddate"></p>
				
					
					
                </div>
                <div class="mar">
                   <label for="">모집인원</label>
                    <input type="text" name="people" id="" value="">
                </div>
				
				
				<div class="mar">
                <p>강의일자: <input type="date" id="datepicker2" name="dday"></p>
                
                </div>
               
                
                <div class="mar">
                	<p> 가격 : <input type="text" name = "c_price"></p>
                </div>
                <div class="form-group mar">
                    <label for="exampleFormControlTextarea1">강의소개</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" maxlength="2000"
                    name="c_content"></textarea>
                  </div>
                <div class="mar">
				<div class="address_box">
               <input type="hidden" name="zip" value=""/>
               <input type="hidden" name="currentPage" value="1" />
               <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
               <input type="hidden" name="countPerPage" value="100" />
               <!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) -->
               <input type="hidden" name="resultType" value="json" />
               <!-- 요청 변수 설정 (검색결과형식 설정, json) -->
               <input type="hidden" name="confmKey"
                  value="devU01TX0FVVEgyMDIwMTEyNzIzNDExMjExMDQ3MzU=" />
               <!-- 요청 변수 설정 (승인키) -->
                  <input type="text" name="address"
                  class="address form-control" placeholder="address" readonly /> 
                  <input type ="hidden" name ="c_address" value="">
                  <input type="text" id="addr_input" name="keyword" class="form-control"
                  value="" placeholder="입력..." onkeydown="enterSearch();" />
               <!-- 요청 변수 설정 (키워드) -->
               <input type="button" id="addr_btn" class="btn btn-primary"
                  onClick="getAddr();" value="주소검색하기" />
               <div id="list"></div>
               <!-- 검색 결과 리스트 출력 영역 -->
            </div>
				</div>

                <div class="mar">
                
                    <input type="button" class="btn btn-success signSub" value="신청하기">
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
		
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
       <script>
		
       $("input:text[name=c_price]").change(function(){
    	   var regexp = /^[0-9]*$/;
    	   var price = $(this).val();
    	   
    		   if( !regexp.test(price) ) {
    		   	alert("가격 : 숫자만 입력하세요");
    		   	price.val("");

    		   }
       })
       
       $("input:text[name=people]").change(function(){
    	   var regexp = /^[0-9]*$/
   		   var people = $(this).val();

    	   if( !regexp.test(people) ) {

    		   	alert("모집인원 : 숫자만 입력하세요");
    		   	people = "";

   		   }
       })
       
       //// 신청 ajax
       $(".signSub").click(function(){
		
    	 var add = $("input:text[name=address]").val();
    	 $("input:hidden[name=c_address]").val(add)
    	   ///// input 데이터
    	/*
    	   var name = $(".cls-size").val();	
    	   var username = $(".username").text();
    	   var kind = $("select[name=kind]").val();
    	   var enddate =  $( "#datepicker" ).datepicker("getDate");
    	   var people = $("input:text[name=people]").val();
    	   var dday =  $( "#datepicker2" ).datepicker( "getDate" );
    	   var c_content = $("textarea[name=c_content]").val();
    	   var c_price = $("input:text[name=c_price]").val();
    	   var c_address = $("input:text[name=c_address]").val()
    	   
    	   url : "./create.ajax?username="+username+"&name="+name+"&enddate="+enddate+
	    				"&kind="+kind+"&people="+people+"&dday="+dday+"&c_content="+c_content+
	    				"&c_price"+c_price+"&c_address="+c_address,
    	 */  
    	 
    	 
    	 
    	 
    	   $.ajax({
	    		
	    		type :"POST",
	    		url : "./create.ajax",
	    		data : $("form[name=userInfo]").serialize(),
	    		cache : false,
	    		success: function(jsonObj, status){
	    			if(status == "success"){
	    				console.log("success인가")
	    				/// 시랭함수
	    				var count = jsonObj.count;
	    		    	var data = jsonObj.data;
	    		    	  
	    		    	if(jsonObj.status == "OK"){
	    		    		alert("성공")
	    		    		location.href = "mycls"
	    		    	   return true
	    		    	}else{
	    		    		alert("실패")
	    		    	   return false
	    		     }
	    			}
	    			
	    		}
    	   })
    	   
       })//// 신청버튼 ajax 끝 
       
       
		</script>
       <script src="${pageContext.request.contextPath }/resources/member/JS/address.js"></script>
        <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
        
        
        
    </body>
</html>
