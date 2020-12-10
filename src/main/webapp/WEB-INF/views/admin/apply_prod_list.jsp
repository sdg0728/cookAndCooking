<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="en" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="en" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="en" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Always force latest IE rendering engine -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Meta Keyword -->
    <meta name="keywords"
        content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
    <!-- meta character set -->
    <meta charset="utf-8">

    <!-- Site Title -->
    <title>상품 관리</title>

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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/product_list.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/recipe_product_list.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/admin_main.css?<%=System.currentTimeMillis()%>">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/purchase/CSS/apply_prod_list.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">

    <!-- Modernizer Script for old Browsers -->
    <script src="${pageContext.request.contextPath }/resources/js/vendor/modernizr-2.6.2.min.js"></script>

</head>

<body>
    <!-- header -->
    <header id="navigation" class="navbar-fixed-top" style="background-image: url(${pageContext.request.contextPath }/resources/img/slider/main2.jpg);">
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
                    <a href="${pageContext.request.contextPath }/admin/admin_main">
                        <img src="${pageContext.request.contextPath }/resources/purchase/image/cookLogo.png">
                    </a>
                </h1>
                <!-- /logo -->

            </div>

            <!-- main nav -->
            <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                <ul id="nav" class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath }/admin/alist">상품리스트</a></li>
                    <li class="current"><a href="${pageContext.request.contextPath }/admin/aplist">신청 레시피 상품</a></li>
                    <li><a href="${pageContext.request.contextPath }/admin/slist">판매내역</a></li>
                    <c:if test="${true }">
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

    <section>
       <div class="top-nav">
            <div class="nav-wrap">
                <div class="nav-title">
                    <span class="black">신청 상태</span>
                </div>
                <div class="nav-content">
                    <ul>
                        <li data-check="-1" class="black">전체</li>
                        <li data-check="0">승인대기</li>
                        <li data-check="1">승인완료</li>
                        <li data-check="2">승인취소</li>
                    </ul>
                </div>
                <div class="hamberger">
                    <i class="fas fa-bars"></i>
                </div>
                <div class="nav-search">
                    <input type="text" name="search" class="recipe-search" placeholder="신청인을 입력해주세요.">
                    <button type="button" class="btn btn-success search-btn">검색</button>
                </div>
            </div>
        </div>
        
        <div class="content-wrap">
           <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
            <div class="top-wrap">
                <h3 class="black">상품 신청 리스트</h3>
            </div>
            <table id="table" class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">레시피명</th>
                        <th scope="col">가격</th>
                        <th scope="col">신청인</th>
                        <th scope="col">신청일자</th>
                        <th scope="col">신청상태</th>
                    </tr>
                </thead>
                <tbody id="tbody">
                   <c:forEach var="item" items="${list }">
                      <tr data-aid="${item.applyno }">
                           <th scope="row" data-toggle="modal" data-target="#staticBackdrop" class="modal-toggle"><div class="name">${item.a_name }</div></th>
                           <td class="price">${item.a_price }</td>
                           <td class="seller">${item.u_name }</td>
                           <td class="regdate">${item.regdate }</td>
                           <c:choose>
                              <c:when test="${item.a_check == 0 }">
                                 <td class="check">승인대기</td>   
                              </c:when>
                              <c:when test="${item.a_check == 1 }">
                                 <td class="check">승인완료</td>
                              </c:when>
                              <c:when test="${item.a_check == 2 }">
                                 <td class="check">승인취소</td>
                              </c:when>
                           </c:choose>
                       </tr>
                   </c:forEach>
                </tbody>
            </table>
        </div>

      <!-- Modal -->
      <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true" data-recode="0">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content w-1000" data-applyno="0">
               <div class="modal-header">
                  <h4 class="modal-title black" id="staticBackdropLabel" style="display: inline">상품 신청서</h4>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                  <span aria-hidden="true" style="font-size: 20px;">X</span>
                  </button>
               </div>
               <div class="modal-body black">
                  <div class="apply-item apply-name">
                     <div class="title">상품명</div>
                     <div class="item apply-prod-name"></div>
                  </div>
                  <div class="apply-item apply-img">
                     <img src=""/>
                  </div>
                  <div class="apply-item apply-price">
                     <div class="title">상품 가격</div>
                     <div class="item apply-prod-price"></div>
                  </div>
                  <div class="apply-item apply-content">
                     <div class="contnet-title">상품 설명</div>
                     <div class="apply-prod-content"></div>
                  </div>
                  <div class="apply-item apply-kind">
                     <div class="title">상품 분류</div>
                     <div class="item apply-prod-kind"></div>
                  </div>
                  <div class="apply-item apply-taste">
                     <div class="title">조리 분류</div>
                     <div class="item apply-prod-taste"></div>
                  </div>
                  <div class="apply-item apply-count">
                     <div class="title">신청 개수</div>
                     <div class="item apply-prod-count"></div>
                  </div>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-dark apply" data-apply="1" data-dismiss="modal">신청 승인</button>
                  <button type="button" class="btn btn-dark apply" data-apply="2" data-dismiss="modal">신청 거부</button>
               </div>
            </div>
         </div>
      </div>
   </section>

    <!-- footer -->
    <footer id="footer" class="text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <div class="footer-logo wow fadeInDown">
                        <img src="${pageContext.request.contextPath }/resources/purchase/image/cookLogo.png" alt="logo">
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

    <script src="${pageContext.request.contextPath }/resources/purchase/JS/admin_apply_ajax.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
</body>

</html>