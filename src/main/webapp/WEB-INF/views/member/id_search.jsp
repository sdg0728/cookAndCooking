<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/member/CSS/id_search.css?ver=<%= System.currentTimeMillis()%>" />
	
	<!-- Modernizer Script for old Browsers -->
       <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>

	<title>아이디 찾기</title>
</head>
<body>

	<section id="logo_sec">
		<div class="container">
			<div id="logo-box"><a href="${pageContext.request.contextPath }/"><img id="center-logo" src="${pageContext.request.contextPath }/resources/memberLogo.png" alt="" /></a></div>
		</div>
	</section>
	
	<section id="sign_secA">
		<div class="container">
			
			<form method="get" action="id_searchOk?${_csrf.parameterName}=${_csrf.token}" name="idSearch" onsubmit="return check()">
				 <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<label for="name"><b>NickName</b></label>
	            <input type="text" id="input_nickName" class="form-control" name="name" placeholder="Enter nickName..." required>
	            <p></p>
				
				<label for="tel"><b>Tel</b></label>
	            <input type="text" id="input_phone" class="form-control" name="tel" placeholder="Enter phone number..." required>
	            <p></p>
	            
	            <div class="row">
	            	<div>
						<ul class="action">
							<li><a href="id_search" class="btn btn-primary">아이디 찾기</a></li>
							<li><a href="pw_search" class="btn btn-primary">비밀번호 찾기</a></li>
						</ul>
					</div>
	            </div>
	            
	            <p></p>
	            
	            <button type="submit" id="btn_id_search" class="btn btn-success">찾기</button>
            
            </form>
            
		</div>
	</section>
	
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


</body>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/member/JS/id_search.js?ver=<%= System.currentTimeMillis()%>" type="text/javascript"></script>

</html>