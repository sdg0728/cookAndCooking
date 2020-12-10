var _csrf = $("input:hidden[name=_csrf]").val();

var user_rid = 0

$(document).ready(function(){
		kindpage(7)
        });
        
        $(".kind_num").click(function(){
            $(".kind_view").empty()
           if($(this).text() == "추천")
               kindpage(7)
           if($(this).text() == "전체")
        	   kindpage(0)
           if($(this).text() == "한식")
        	   kindpage(1)
           if($(this).text() == "중식")
        	   kindpage(2)
           if($(this).text() == "일식")
        	   kindpage(3)
           if($(this).text() == "양식")    
        	   kindpage(4)              
           if($(this).text() == "퓨전")
        	   kindpage(5)
           if($(this).text() == "기타")
        	   kindpage(6)
          
           
              
          // location.reload();   
       })
        
	$("#comment-text").keyup(function(){
		
		//	$(".comment").text($(".comment").text()+$(this).val()) 
		if(event.keyCode==13){
			insertCom()
		}
	});
	
	
	$("button[name=editor]").click(function(){
		var target= event.target
	});
	
	
	
	
	function plus(target) {
		if($("#recipe").attr("data-toggle") == 0){
			
			loadPage($(target));
			comload($(target));
			$("#recipe").attr("data-toggle", 1);
		} else {
			$("#recipe").hide();
			$("#recipe").attr("data-toggle", 0);
		}
	}
	
	$(".close").click(function() {
		$("#recipe").hide();
		$("#ing").empty();
		$("#recipe").attr("data-toggle", 0);
		$(".commentPage").empty();
		$(".kind_view").empty()
		kindpage(7)
	});

	// page번째 목록 읽어오기
	function loadPage(target){
		console.log("[loadPage]")
		$('#notify').text('신고')
		var user_rid = parseInt(target.parents(".user_recipe").attr("data-rid"));
			console.log(user_rid)
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
			
		  $.ajax({
		        url : "./notifyChk?email="+$('#email').val()+"&user_rid="+user_rid,
		        type : "GET",
		        cache : false,
		        success : function(data, status){
		            if(status == "success"){		               
		            	 notifyselect(data, target)
		            }
		        }
	
		
		});
			
	} // end loadPage()
	
	function notifyselect(jsonObj, target) {
		var data = jsonObj.notifydata
		console.log(data)
		
		var user_rid = parseInt(target.parents(".user_recipe").attr("data-rid"));
		if(user_rid == data) {
			$('#notify').text('신고취소')
		}else {
			$('#notify').text('신고') 
		}
		
	}

	function updateList(jsonObj, target){
	    result = "";  // 최종 결과물

	    if(jsonObj.status == "OK"){
	        var count = jsonObj.count;
	        var items = jsonObj.data1[0];  // 글 배열
	        var names = jsonObj.data2[0];
	        var isChk = jsonObj.isChk;
	        user_rid = items.user_rid;
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
			$('#modal_img').attr('src', $('#path').val()+"/upload/userRecipe/"+items.img)
			
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
	
	
	//////////////////////////////////////////////////////////////////////
	
	function kindpage(num){
		
		var kind = num ;
		
		if(kind != 7) {
			$.ajax({
			    url : "./userkind?kind=" + kind,
			    type : "GET",
			    cache : false,
			    success : function(data, status){
			        if(status == "success"){               
			            	cateList(data)
			            }
			        }
			    });
		}else {
			$.ajax({
		    	url : "./userItembased?&_csrf=" + _csrf,
		    	type : 'POST',
		    	cache : false,
		    	data: {user_rid : user_rid},
		    	success : function(data, status) {
		    		
		    		if(status=="success") {
		    			if(data.status == "OK") {
		    				console.log('아이템?')
		    				cateList(data)
		    				
		    			}
		    		}
		    		
		    	}
		  
		    });
				
			$.ajax({
		    	url : "./userUserbased?&_csrf=" + _csrf,
		    	type : 'POST',
		    	cache : false,
		    	data: {email : $('#emailId').val()},
		    	success : function(data, status) {
		    		
		    		if(status=="success") {
		    			if(data.status == "OK") {
		    				console.log('유저?')
		    				cateList(data)
		    				
		    			}
		    		}
		    		
		    	}
		  
		    });
			
			$.ajax({
		    	url : "./userTastebased?&_csrf=" + _csrf,
		    	type : 'POST',
		    	cache : false,
		    	data: {email : $('#emailId').val()},
		    	success : function(data, status) {
		    		
		    		if(status=="success") {
		    			if(data.status == "OK") {
		    				console.log('취향?')
		    				cateList(data)
		    				
		    			}
		    		}
		    		
		    	}
		  
		    });
		}
	} // end loadPage()

	function cateList(jsonObj){
	    result = "";  // 최종 결과물

	    if(jsonObj.status == "OK"){
	        var count = jsonObj.count;
	        var items = jsonObj.data;  // 글 배열
		
	        console.log("오니오니")
	       	
	        $("#projects").html("");
	        for (var i = 0; i < items.length; i++) {
			console.log(items.length)
	 
	        	
	        	
				var fi = document.createElement("figure");
					$(fi).attr("class", "portfolio-item user_recipe")
					$(fi).attr("data-rid",items[i].user_rid)

				var img = document.createElement("img");
					 $(img).attr("class","img-responsive img_height")
					 $(img).attr("src",$('#path').val()+"/upload/userRecipe/"+items[i].img)
					 $(img).attr("alt","Portfolio Item")

				var a = document.createElement("a");
				  $(a).attr("href","#recipe")
				var span = document.createElement("span")
					$(span).attr("class","plus")  
					$(span).attr("onclick","plus(this)")  
				
				var figcaption = document.createElement("figcaption");
					$(figcaption).attr("class","mask")
				
				var div = document.createElement("div")
					$(div).attr("class","regdate")
					$(div).text(items[i].regdate)

				var h3 = document.createElement("h3")
					$(h3).text(items[i].name)

				var spanname= document.createElement("span")
				$(spanname).attr("class","user_name")
				$(spanname).text(items[i].email)

				
				
				
				$(figcaption).append(div)
				$(figcaption).append(h3)
				$(figcaption).append(spanname)

				$(fi).append(img)
				$(fi).append(a)
				$(fi).append(span)
				$(fi).append(figcaption)
				
				
				
				$("#projects").append(fi)
				console.log($("#projects")[0])

	        }
	        return true;
	    }else{
	        alert("내용이 없습니다");
	        return false;
	    }
	}
	
	$("#notify").click(function(){
		
		var status = 0;
		
		var user_rid = $('#user_rid').val()
		
		console.log($('#email').val())
		
		if($('#notify').text() == '신고') {
			status = 0;
		}else {
			status = 1;
			//텍스트 바꾸기 
			$('#notify').text() == ('신고취소')
		}
		
		  $.ajax({
		        url : "./notifyOk?email="+$('#email').val()+"&user_rid="+user_rid+"&status=" + status,
		        type : "GET",
		        cache : false,
		        success : function(data, status){
		            if(status == "success"){		               
		            	 notifyChk(data)
		            }
		        }

		
		});
		  
	});
	
	function notifyChk(jsonObj) {
		var data = jsonObj.count
		var notifydata = jsonObj.notifydata
		console.log(data)
		console.log(notifydata)
		if(notifydata == $('#user_rid').val()) {
			if($('#notify').text() == '신고') {
				if(data == 1) {
					$('#notify').text('신고취소') 
				}else {
					alert('신고 실패')
				}
			}else if($('#notify').text() == '신고취소') {
				if(data == 1) {
					$('#notify').text('신고') 	
				}else {
					alert('신고 취소 실패')
				}
				
			}
		}
		
	}
	
	$(".preference").click(function(e) {
		var user_rid = $("input:hidden[name=user_rid]").val();
		var email = $("input:hidden[name=emailId]").val();
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
	

	$("input:text[name=search-text]").keydown(function(){
			console.log(event.keyCode+"키다운")
		
		
		if(event.keyCode==13){
			search()
		}
	});
    function search(){
        
        //$(".category").hide();
        
        var search = $("input:text[name=search-text]").val();
		console.log(search)
        //console.log(name)
     
        $.ajax({
             //   /board/{page}/{pageRows}
             //   현재  /board/rest
             url : "./search.ajax?search=" + search,
             type : "GET",
             cache : false,
             success : function(data, status){
                 if(status == "success"){
                    searchName(data)
                 }
             }

         });
    }
    
        function searchName(jsonObj){
           var count = jsonObj.count;
           var data = jsonObj.data;
           
           if(jsonObj.status == "OK"){
              $("#projects").empty()
              
        for (var i = 0; i <  data.length; i++) {
            //console.log(i)
             if(data[i].name!=null)
            		
 				var fi = document.createElement("figure");
 					$(fi).attr("class", "portfolio-item user_recipe")
 					$(fi).attr("data-rid",data[i].user_rid)

 				var img = document.createElement("img");
 					 $(img).attr("class","img-responsive img_height")
 					 $(img).attr("src",$('#path').val()+"/upload/userRecipe/"+data[i].img)
 					 $(img).attr("alt","Portfolio Item")

 				var a = document.createElement("a");
 				  $(a).attr("href","#recipe")
 				var span = document.createElement("span")
 					$(span).attr("class","plus")  
 					$(span).attr("onclick","plus(this)")  
 				
 				var figcaption = document.createElement("figcaption");
 					$(figcaption).attr("class","mask")
 				
 				var div = document.createElement("div")
 					$(div).attr("class","regdate")
 					$(div).text(data[i].regdate)

 				var h3 = document.createElement("h3")
 					$(h3).text(data[i].name)

 				var spanname= document.createElement("span")
 				$(spanname).attr("class","user_name")
 				$(spanname).text(data[i].email)

 				
 				
 				
 				$(figcaption).append(div)
 				$(figcaption).append(h3)
 				$(figcaption).append(spanname)

 				$(fi).append(img)
 				$(fi).append(a)
 				$(fi).append(span)
 				$(fi).append(figcaption)
 				
 				
 				
 				$("#projects").append(fi)
              
      
         }
       return true
           }else{
              alert("없는 레시피 입니다.")
              return false
           }            
        }