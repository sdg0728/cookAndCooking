<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="username" value='<%=session.getAttribute("username") %>' />   
    
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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/member/CSS/ch_and_mw.css?ver=<%= System.currentTimeMillis()%>" />
	
	<!-- Modernizer Script for old Browsers -->
	<script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>
	<title>비밀번호 변경</title>
</head>
<body>

	<section id="logo_sec">
		<div class="container">
			<c:choose>
		        <c:when test="${username eq 'admin@naver.com'}">
					<div id="logo-box"><a href="${pageContext.request.contextPath }/admin/admin_member_list"><img id="center-logo" src="${pageContext.request.contextPath }/resources/memberLogo.png" alt="" /></a></div>
				</c:when>
				<c:otherwise>
					<div id="logo-box"><a href="${pageContext.request.contextPath }/"><img id="center-logo" src="${pageContext.request.contextPath }/resources/memberLogo.png" alt="" /></a></div>
				</c:otherwise>
			</c:choose>
			
		</div>
	</section>
	
	<section id="sign_secA">
		<div class="container">
			
			
			<form method="post" action="${pageContext.request.contextPath }/member/password_updateOk?${_csrf.parameterName}=${_csrf.token}" name="passwordUpdate" onsubmit="return check()">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" id="emailId" name="email" value="${param.email }">
			
            <label for="pw"><b>Password</b></label>
            <input type="password" id="input_pwd" class="form-control" placeholder="Enter Password..." name="pw" required>
            <p></p>
            
            <label for="pwChk"><b>PasswordChk</b></label>
            <input type="password" id="input_pwdChk" class="form-control" placeholder="Enter Password..." name="pwChk" required>
            <p></p>
              
            <button type="submit" id="btn_change" class="btn btn-success">비밀번호 변경</button>
            
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
<script src="${pageContext.request.contextPath }/resources/member/JS/change_password.js?ver=<%= System.currentTimeMillis()%>" type="text/javascript"></script>

</html>