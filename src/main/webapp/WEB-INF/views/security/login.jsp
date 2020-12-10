<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/member/CSS/login.css?ver=<%= System.currentTimeMillis()%>" />

<!-- Modernizer Script for old Browsers -->
<script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
<title>로그인</title>
</head>

<body>

	<section id="logo_sec">
		<div class="container">
			<div id="logo-box"><a href="../"><img id="center-logo" src="${pageContext.request.contextPath }/resources/memberLogo.png" alt="" /></a></div>
		</div>
	</section>

	<section id="sign_secA">
		<div class="container">
			<form name="frm" action="${pageContext.request.contextPath }/login" method="post">
				<label for="email"><b>Email</b></label> <input type="text" id="input_id"
					name="username" class="form-control" placeholder="Enter Email..." required>
				<p></p>

				<label for="pw"><b>Password</b></label> <input type="password"
					id="input_pwd" class="form-control" placeholder="Enter Password..." name="password" required>
				<p></p>
	
				<div class="link_space button alt fit">
					<a class="find_link" href="${pageContext.request.contextPath }/member/id_search">ID/Password 찾기</a>
				</div>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<button type="submit" id="btn_login" class="btn btn-success">Login</button>
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
</html>