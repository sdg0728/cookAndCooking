<%@page import="org.springframework.web.servlet.function.ServerResponse.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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



        <!-- Site Title -->
        <!--유저 강의/ 강의 신청 페이지-->
        <title>Cooking</title>
        
        <!--
        Google Fonts
        ============================================= -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
		
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
       
        <!--Style-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/cookingcls/CSS/adminCooking.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/security/CSS/login_logout.css">
		<!-- Modernizer Script for old Browsers -->
        <script src="${pageContext.request.contextPath}/resources/js/vendor/modernizr-2.6.2.min.js"></script>

 

    </head>
	
    <body>
    	<input type="hidden" id="path" value="${pageContext.request.contextPath}">
    
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
                        <a href="${pageContext.request.contextPath}/admin/admin_main">
                            <img src="${pageContext.request.contextPath}/resources/img/logo_w.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->
    
                </div>
    
                <!-- main nav -->
                <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                    <ul id="nav" class="nav navbar-nav">
                        
                        <li><a href="#">클래스 관리</a></li>
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
    
            </div>
        </header>


     <div class="tt">

    <section>
        <div class="container col-8 ">

            <div class="col-4 "><h3>쿠킹클래스</h3></div>
		</div>
    </section>

   
    <section>
      


    <div class="cardhei">
     
    
<!-- The Modal -->
<div class="modal modal-center " id="cooking">
    <div class="modal-dialog modal-center modal-dialog-scrollable">
       <div id="modal_size" class="modal-content ">

          <!-- Modal Header -->
          <div class="modal-header">
             <h4 class="modal-title"></h4>
             <div class= "permit"></div>
             <!-- 포스트 제목 가져와야됨 -->
             <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
              <div>
                  <img src="" id="imgBox" class="imgcard dis" alt="">
                    <div class="dis recipe-size">
                   
                    </div>
              </div>
              
              <div class="people"></div>
            <div class="enddate"></div>
            <div class="dday"></div>
            <div class="c_price"></div>
              <div class="over mar">
               <div class="c_content"></div>
                  <hr>
                <!--강의 위치 지도-->
                 <div class="c_address">
                 	
                 </div>
                
              </div>


          
          <!-- Modal footer -->
          <div class="modal-footer">
             <div class="comment_rapper">
                <!--    <form action="commentOk.do"> -->
                    <input type="button" value="승인" name="register" class="btn btn-success"
                    	data-cno = "0">
                     <input type="button" value="거절" name="nono" class="btn btn-success"
                    	data-cno = "0">

                <!-- <input type="hidden" name="post_id" value="${feed.post_id }" /> -->
                <!--  <input type="hidden" id="postId${status.index }" name="post_id" value="${feed.post_id }" />
             <input type="hidden" name="user_id" value="yo2s" /> -->
                  
                <!-- </form> -->
             </div>

          </div>
</div>
       </div>
    </div>
 </div>

    <!-- modal 끝 -->

    </div>
    
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
                            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo">
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
        
        <script>
        
        $(document).ready(function(){
        	clsList();
        })
        
        function clsList(){
     	   
     	   
     	   $.ajax({

                url : "./adClsAll.ajax" ,
                type : "GET",
                cache : false,
                success : function(data, status){
                    if(status == "success"){
                 	   clsAll(data);
                    }
                }

            });
        }  	
         	
         	function clsAll(jsonObj){
         		
         		result = ""
         		
         		if(jsonObj.status == "OK"){
         			//console.log("들어오니....")
         			var conut = jsonObj.count;
     				var data = jsonObj.data;
         		
         		for (var i = 0; i < data.length; i++) {
         			
         			
 						//// 카드 div
                        var card = document.createElement("div")
                        $(card).attr("class","card cc dis")
                        
                        /// 이미지
                        var imgTag = document.createElement("img");
                        $(imgTag).addClass("card-img-top imgcard")
                        console.log(data[i])
                        $(imgTag).attr("src","${pageContext.request.contextPath}/upload/member/"+data[i].img)
                        $(card).append(imgTag)

                        /// 카드 안 div
                        var body = document.createElement("div");
                        $(body).attr("class","card-body")

 						/// 카드 제목
                        var title = document.createElement("h5");
                        $(title).attr("class","card-title");
                     	$(title).text(data[i].name)
                        $(body).append(title);
						
                     	/// 현재 상태
						var permit = document.createElement("p");
                     	
						if(data[i].chk == 0){
	                     	$(permit).text("대기");
	                     	$(permit).css("color","blue");
                     	}
                     	
                     	if(data[i].chk == 1){
	                     	$(permit).text("승인");     
	                     	$(permit).css("color","black");
                     	}
                     	
                     	if(data[i].chk == 2){
                     		$(permit).text("거절");
                     		$(permit).css("color","red");
                     	}
                     	
                     	$(body).append(permit);
                     	
                     	/// 버튼 rid 전송
                        var atag = document.createElement("a");
                        $(atag).attr("href","#cooking")
                        //$(atag).attr("class","btn btn-success recipe_bnt")
                         $(atag).addClass("btn")
                        $(atag).addClass("recipe_bnt btn-success")
                         $(atag).addClass("clk")
                        $(atag).text("클래스 보기")
                        $(atag).attr("data-rid",data[i].cno)
                        $(atag).attr("onclick","modal()")
                        //$(atag).text("레시피 보기")
                        $(body).append(atag)

                        $(card).append(body)
                        $(".cardhei").append(card)
                        
 				}
         		return true
         }else{
             alert("내용이 없습니다")
             return false
         }
         	
        

         }
         
   
      
        
        
        function modal() {
            var target = $(event.target);
        		var cno = target.attr("data-rid");
            	console.log($("#cooking").attr("data-toggle"))
           if($("#cooking").attr("data-toggle") == "0"){
               loadPage(target);
               $("#cooking").show(); 
               $("#cooking").attr("data-toggle", "1");
            } else {
               $("#cooking").hide();
               $("#cooking").attr("data-toggle", "0");
            }
         }
         
         $(".close").click(function() {
            $("#cooking").hide();
            $("#cooking").attr("data-toggle", "0");
           
         });
         
         
         
         
         function loadPage(target){
             var cno = target.attr("data-rid");
            
              $.ajax({
                  //   /board/{page}/{pageRows}
                  //   현재  /board/rest
                  url : "./AdclsOne.ajax?cno="+ cno ,
                  type : "GET",
                  cache : false,
                  success : function(data, status){
                      if(status == "success"){
                         updateList(data, target);
                      }
                  }

              });
          } // end loadPage()

          function updateList(jsonObj, target){
              result = "";  // 최종 결과물

              if(jsonObj.status == "OK"){
                  var count = jsonObj.count;
                  var items = jsonObj.data[0];  // 글 배열
      			
                  
                $(".modal-title").text(items.name);
                $('#imgBox').attr('src',$('#path').val()+"/upload/member/"+items.img);
                if(items.chk == 0){
                 	$(".permit").text("대기");
                 	$(".permit").css("color","blue");
             	}else{
             		 $("input:button[name=register]").attr("disabled","true");
                     $("input:button[name=nono]").attr("disabled","true");
             	}
             	
             	if(items.chk == 1){
                 	$(".permit").text("승인");     
                 	$(".permit").css("color","black");
             	}
             	
             	if(items.chk == 2){
             		$(".permit").text("거절");
             		$(".permit").css("color","red");
             	}
                  
                if(items.kind == 1) $(".modal-kind").text("한식");
                if(items.kind == 2) $(".modal-kind").text("중식");
                if(items.kind == 3) $(".modal-kind").text("일식");
                if(items.kind == 4) $(".modal-kind").text("양식");
                if(items.kind == 5) $(".modal-kind").text("퓨전");
                if(items.kind == 6) $(".modal-kind").text("기타");
                
                $(".people").text("모집 인원 : "+items.people);
            //    $(".enddate").text(items.enddate);
            	var dday = formatDate(items.dday)
                $(".dday").text("강의 날짜 : "+dday);
                $(".c_content").text(items.c_content);
                $(".c_price").text("가격 : "+items.c_price+"원");
 
                var today = new Date();
                today.setHours(23);
                today.setMinutes(59);
                today.setSeconds(59);
             
                if(items.enddate< today){
             	   $(".enddate").text("모집마감")
             	   
                }else{
             	   $(".enddate").text("모집중")
                }
                $(".c_address").text("위치 : "+items.c_address)
                
                $("input:button[name=register]").attr("data-cno",items.cno);
                $("input:button[name=nono]").attr("data-cno",items.cno);
                
                  return true;
              } else {
                  alert("내용이 없습니다");
                  return false;
              }
          }  
          
          
          /// 날짜 모양 함수
          function formatDate(date) { 
         	 var d = new Date(date), 
         	 month = '' + (d.getMonth() + 1), 
         	 day = '' + d.getDate(), 
         	 year = d.getFullYear(); 
         	 if (month.length < 2) 
         		 month = '0' + month; 
         	 if (day.length < 2) day = '0' + day; 
         	 
         	 return [year, month, day].join('-'); 
         }
          
          $("input:button[name=register]").click(function(){
        	  var cno =  $("input:button[name=register]").attr("data-cno");
        	  permit(1,cno)
        	  cookMove(cno)
        	 
          })
          
          $("input:button[name=nono]").click(function(){
        	  var cno = $("input:button[name=nono]").attr("data-cno");
        	  permit(2,cno)
        	 
          })
          
          function permit(chk,cno){
        	  var cno = cno
        	  var chk = chk;
        	  
        	  $.ajax({
          		url : "./permit.ajax?cno="+cno+"&chk="+chk,
          		type : "GET",
          		cache : false,
          		success : function(jsonObj, status){
          			if(status == "success"){
          				
          				var count = jsonObj.count;
          				var data = jsonObj.data;
          				
          				if(jsonObj.status == "OK"){
          					alert("성공")		
          					window.location.reload()
          					return true
          				}else{
          					alert("실패")
          					return false
          				}
          				
          			}
          		}
          	  })
          }
          
          function cookMove(cno){
        	  
        	  $.ajax({
        		  url : "./move.ajax?cno="+cno,
        		  type : "GET",
        		  cache : false,
        		  success : function(jsonObj, status){
        			  if(status == "success"){
        				  
        				  console.log("dmdafslkasdasdflj;afsd;ljk")
        				  
        				  var count = jsonObj.count;
        				  var data = jsonObj.data;
        				  
        				  if(jsonObj.status == "OK"){
        					  alert("성공")	
        					  return true
        				  }else{
        					  alert("ㅅㄹ퍂")	
        					  return false
        				  }
        			  }
        		  }
        	  })
          }
          
          

        </script>
        
        <script src="${pageContext.request.contextPath }/resources/security/JS/logout.js"></script>
        
    </body>
</html>
