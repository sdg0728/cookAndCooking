<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />


<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<title>회원가입</title>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/member/CSS/sign.css?ver=<%= System.currentTimeMillis()%>" />

<!-- Modernizer Script for old Browsers -->
<script
	src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>

</head>

<script language="javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup?csrf=${_csrf.token}", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

	}

	function jusoCallBack(roadFullAddr, zipNo, jibunAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		$("input:text[name=roadFullAddr]").val(roadFullAddr);
		$("input:hidden[name=jibunAddr]").val(jibunAddr);
	}
</script>

<body>
	<section id="logo_sec">
		<div class="container">
			<div id="logo-box">
				<a href="${pageContext.request.contextPath }/"><img
					id="center-logo"
					src="${pageContext.request.contextPath }/resources/memberLogo.png"
					alt="" /></a>
			</div>
		</div>
	</section>

	<section id="sign_secA">

		<div class="container">

			<form method="POST" action="${pageContext.request.contextPath }/member/signOk" name="userInfo" id="userInfo"
				enctype="multipart/form-data" onsubmit="return onSign()">
				
				<input type="hidden" id="_csrf" name="${_csrf.parameterName }" value="${_csrf.token}" />
				<!-- default header name is X-CSRF-TOKEN -->
				<input type="hidden" id="_csrf_header" name="_csrf_header" value="${_csrf.headerName}" /> 
				
					<label for="email"><b>Email</b></label>
				<div class="box70">
					<input type="email" id="input_email" class="form-control"
						name="email" placeholder="Enter email..." required>
					<button type="button" id="email_load" class="btn btn-primary">이메일 중복체크</button>
				</div>
				<p id="email_check"></p>

				<label for="psw"><b>Password</b></label> 
				<input type="password" id="input_pwd" class="form-control" placeholder="Enter Password..." name="pw" required>
				<p id="pwd_check"></p>

				<label for="psw_chk"><b>Password Check</b></label> 
				<input type="password" id="input_pwd_chk" class="form-control"
					placeholder="Enter Password..." name="pw_chk" required>
				<p id="pwd_chk_check"></p>

				<label for="name"><b>Nickname</b></label>
				<div class="box70">
					<input type="text" id="input_name" class="form-control"
						placeholder="Enter Nickname..." name="name" required>
					<button type="button" id="name_load" class="btn btn-primary">닉네임 중복체크</button>
				</div>
				<p id="name_check"></p>

				<input type="hidden" id="addr" name="address" value="">

				<!-- <label for="address"><b>Address</b></label>
            <div class="address_box">
				<input type="text" id="roadFullAddr" class="form-control" name="roadFullAddr" value="" placeholder="address" readonly /> 
				<input id="addr_btn" type="button" class="btn btn-primary" onClick="goPopup();" value="검색하기" class="button"></input>
			</div> -->

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
						<input type="text" id="addr_input" name="keyword" class="form-control"
						value="" placeholder="입력..." onkeydown="enterSearch();" />
					<!-- 요청 변수 설정 (키워드) -->
					<input type="button" id="addr_btn" class="btn btn-primary"
						onClick="getAddr();" value="주소검색하기" />
					<div id="list"></div>
					<!-- 검색 결과 리스트 출력 영역 -->
				</div>
				<p id="address_check"></p>
					
				<div class="clear"></div>
				
				<label for="phone"><b>Tel</b></label> <input type="text"
					id="input_phone" class="form-control" name="tel"
					placeholder="Enter phone number..." required>
				<p id="phone_check"></p>

				<label><b>음식 취향</b></label> <input type="hidden" id="kindId"
					name="kind" value=""> <input type="hidden" id="tasteId"
					name="taste" value="">

				<p></p>
				<div class="dis">
					<label>나라별</label>
				</div>
				<label for="success1" class="btn btn-success">한식 <input
					type="checkbox" id="success1" name="kind_info" class="badgebox"
					value="1"><span class="badge">&check;</span></label> <label
					for="success2" class="btn btn-success">중식 <input
					type="checkbox" id="success2" name="kind_info" class="badgebox"
					value="2"><span class="badge">&check;</span></label> <label
					for="success3" class="btn btn-success">일식 <input
					type="checkbox" id="success3" name="kind_info" class="badgebox"
					value="3"><span class="badge">&check;</span></label> <label
					for="success4" class="btn btn-success">양식 <input
					type="checkbox" id="success4" name="kind_info" class="badgebox"
					value="4"><span class="badge">&check;</span></label> <label
					for="success5" class="btn btn-success">퓨전 <input
					type="checkbox" id="success5" name="kind_info" class="badgebox"
					value="5"><span class="badge">&check;</span></label> <label
					for="success6" class="btn btn-success">기타 <input
					type="checkbox" id="success6" name="kind_info" class="badgebox"
					value="6"><span class="badge">&check;</span></label>

				<p></p>

				<div class="dis">
					<label>조리법별</label>
				</div>
				<label for="info1" class="btn btn-info">밥/죽/떡<input
					type="checkbox" id="info1" name="taste_info" class="badgebox"
					value="1"><span class="badge">&check;</span></label> <label
					for="info2" class="btn btn-info">면/만두 <input
					type="checkbox" id="info2" name="taste_info" class="badgebox"
					value="2"><span class="badge">&check;</span></label> <label
					for="info3" class="btn btn-info">국물<input type="checkbox"
					id="info3" name="taste_info" class="badgebox" value="3"><span
					class="badge">&check;</span></label> <label for="info4"
					class="btn btn-info">구이/찜/조림<input type="checkbox"
					id="info4" name="taste_info" class="badgebox" value="4"><span
					class="badge">&check;</span></label> <label for="info5"
					class="btn btn-info">볶음/튀김/부침 <input type="checkbox"
					id="info5" name="taste_info" class="badgebox" value="5"><span
					class="badge">&check;</span></label> <label for="info6"
					class="btn btn-info">나물/샐러드<input type="checkbox"
					id="info6" name="taste_info" class="badgebox" value="6"><span
					class="badge">&check;</span></label> <label for="info7"
					class="btn btn-info">베이킹/디저트<input type="checkbox"
					id="info7" name="taste_info" class="badgebox" value="7"><span
					class="badge">&check;</span></label> <label for="info8"
					class="btn btn-info">양념<input type="checkbox" id="info8"
					name="taste_info" class="badgebox" value="8"><span
					class="badge">&check;</span></label> <label for="info9"
					class="btn btn-info">음료<input type="checkbox" id="info9"
					name="taste_info" class="badgebox" value="9"><span
					class="badge">&check;</span></label>

				<p></p>

				<label><b>사진</b></label>

				<div id="img_box"></div>

				<label class="btn btn-primary btn-file"> 사진 <input
					id="up-file" type="file" name="upload" class="btn btn-primary"
					style="display: none;" accept=".gif, .jpg, .png, .jpeg">
				</label> <label class="btn btn-primary btn-file"> 삭제<input
					type="button" id="delete-file" name="deletefile"
					class="btn btn-primary" onclick="deleteFiles();">
				</label>

				<p></p>
				<button type="submit" id="btn_sign" class="btn btn-success">Sign</button>

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

</body>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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

<script src="${pageContext.request.contextPath }/resources/member/JS/address.js"></script>


<script
	src="${pageContext.request.contextPath }/resources/member/JS/sign.js?ver=<%= System.currentTimeMillis()%>"
	type="text/javascript"></script>

</html>