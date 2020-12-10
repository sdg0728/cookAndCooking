var _csrf = $("input:hidden[name=_csrf]").val();

var rid = 0;

categoryFun(7);

    
  $(".category").click(function(){
	 $(".cardhei").empty()
	if($(this).text() == "추천")
    	categoryFun(7)  
    if($(this).text() == "전체")
    	categoryFun(0)
    if($(this).text() == "한식")
		categoryFun(1)
    if($(this).text() == "중식")
    	categoryFun(2)
    if($(this).text() == "일식")
    	categoryFun(3)
    if($(this).text() == "양식") 	
    	categoryFun(4)           	
    if($(this).text() == "퓨전")
    	categoryFun(5)
    if($(this).text() == "기타")
    	categoryFun(6)
	
    
    	
   // location.reload();	
    })
     
   	
   function categoryFun(num){
   	/// kind가 0이면 전체 아니면 맞는 종류로 load
/// kind 값 바꿀 방법 생각해봐야함
	
	var kind = num;

	if(kind != 7) {
	    $.ajax({
            url : "./kind.ajax?kind=" + kind,
            type : "GET",
            cache : false,
            success : function(data, status){
                if(status == "success"){
                    clsList(data);
                    }
                }

	    });
	}else {
		$.ajax({
	    	url : "./itembased?_csrf="+_csrf,
	    	type : 'POST',
	    	cache : false,
	    	data: {rid : rid},
	    	success : function(data, status) {
	    		
	    		if(status=="success") {
	    			if(data.status == "OK") {
	    				console.log('아이템?')
	    				clsList(data)
	    				
	    			}
	    		}
	    		
	    	}
	  
	    });
			
		$.ajax({
	    	url : "./userbased?_csrf="+_csrf,
	    	type : 'POST',
	    	cache : false,
	    	data: {email : $('#emailId').val()},
	    	success : function(data, status) {
	    		
	    		if(status=="success") {
	    			if(data.status == "OK") {
	    				console.log('유저?')
	    				clsList(data)
	    				
	    			}
	    		}
	    		
	    	}
	  
	    });
		
		$.ajax({
	    	url : "./tastebased?_csrf="+_csrf,
	    	type : 'POST',
	    	cache : false,
	    	data: {email : $('#emailId').val()},
	    	success : function(data, status) {
	    		
	    		if(status=="success") {
	    			if(data.status == "OK") {
	    				console.log('취향?')
	    				clsList(data)
	    				
	    			}
	    		}
	    		
	    	}
	  
	    });
		
	}


   	 function clsList(jsonObj){
 
			result=""
		
		if(jsonObj.status == "OK"){
			var conut = jsonObj.count;
			var data = jsonObj.data;
			
			//console.log(data)
		for (var i = 0; i <  data.length; i++) {
		//console.log(i)
			if(data[i].name!=null)
    
				//// 카드 div
               var card = document.createElement("div")
               $(card).attr("class","card cc dis")
               
               /// 이미지
               var imgTag = document.createElement("img");
               $(imgTag).addClass("card-img-top imgcard")
               $(imgTag).attr("src",$('#path').val()+"/upload/recipe/"+data[i].img)
               $(card).append(imgTag)

               /// 카드 안 div
               var body = document.createElement("div");
               $(body).attr("class","card-body")

				/// 카드 제목
               var title = document.createElement("h5");
               $(title).attr("class","card-title");
            	$(title).text(data[i].name)
               $(body).append(title);

            	/// 버튼 rid 전송
               var atag = document.createElement("a");
               $(atag).attr("href","#recipe")
               //$(atag).attr("class","btn btn-success recipe_bnt")
                $(atag).addClass("btn")
               $(atag).addClass("recipe_bnt btn-success")
                $(atag).addClass("clk")
               $(atag).text("레시피보기")
               $(atag).attr("data-rid",data[i].rid)
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
       	
  

         } 
               
function modal() {
	var target = $(event.target);
	if($("#recipe").attr("data-toggle") == "0"){
		rid = target.attr('data-rid')
		loadPage(target);
		$("#recipe").show();
       	comload($(target).attr("data-rid"))  		   
       	$("#recipe").attr("data-toggle", "1");
    } else {
       $("#recipe").hide();
    
       $("#recipe").attr("data-toggle", "0");
    }
 }
 
 $(".close").click(function() {
    $("#recipe").hide();
    $(".commentPage").empty();
    $("#recipe").attr("data-toggle", "0");
    $("#recipe").attr("data-rid", "0");
    $("#ing").empty();
    $(".cardhei").empty()
    categoryFun(7)
     });
   
    	
 // page번째 목록 읽어오기
function loadPage(target){
   var rid = target.attr("data-rid");
   var email = $(".username").text();
   
    $.ajax({
        //   /board/{page}/{pageRows}
        //   현재  /board/rest
        url : "./view.ajax?rid=" + rid + "&user_id=" + email,
        type : "GET",
        cache : false,
        success : function(data, status){
            if(status == "success"){
               updateList(data, target , rid);
            }
        }

    });
} // end loadPage()

function updateList(jsonObj, target , rid){
    result = "";  // 최종 결과물
	
    if(jsonObj.status == "OK"){
        var count = jsonObj.count;
        var items = jsonObj.data[0];  // 글 배열
       var pref = jsonObj.pref;
        
        
      $(".modal-title").text(items.name);
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

      $('#modal_img').attr('src',$('#path').val()+'/upload/recipe/'+items.img)

      
 		$("#ing").text(items.ingredient);     
 
      
      if(items.recipe_1 != null) 
    	  $('#recipe1').text("1. "+items.recipe_1) 
      else 
    	  $('#recipe1').text("")
      if(items.recipe_2 != null) $('#recipe2').text("2. "+items.recipe_2)   
      else $('#recipe2').text("")
      if(items.recipe_3 != null) $('#recipe3').text("3. "+items.recipe_3)   
      else $('#recipe3').text("")
      if(items.recipe_4 != null) $('#recipe4').text("4. "+items.recipe_4)   
      else $('#recipe4').text("")
      if(items.recipe_5 != null) $('#recipe5').text("5. "+items.recipe_5)   
      else $('#recipe5').text("")
      if(items.recipe_6 != null) $('#recipe6').text("6. "+items.recipe_6)   
      else $('#recipe6').text("")
      if(items.recipe_7 != null) $('#recipe7').text("7. "+items.recipe_7)   
      else $('#recipe7').text("")
      if(items.recipe_8 != null) $('#recipe8').text("8. "+items.recipe_8)   
      else $('#recipe8').text("")
      if(items.recipe_9 != null) $('#recipe9').text("9. "+items.recipe_9)   
      else $('#recipe9').text("")
      if(items.recipe_10 != null) $('#recipe10').text("10. "+items.recipe_10) 
      else $('#recipe10').text("")
      
      $("#recipe").attr("data-rid", items.rid);
      console.log("[pref] "+pref)
      //console.log("rid"+items.rid)
      if(pref.length != 0){
		var preference = pref[0].preference;
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
               
                return false;
            }
        }
  

        
        $("#recipeSearch").keydown(function(){
	if(event.keyCode == 13){
		
		search()
	}
	//event.preventDefault();
})

$(".search-btn").click(function(){
    	search()
    })
    
    
   function search(){
    	
    	//$(".category").hide();
	
	var search = $("#recipeSearch").val();

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
	
	function searchName(jsonObj){
		var count = jsonObj.count;
		var data = jsonObj.data;
		
		if(jsonObj.status == "OK"){
			$(".cardhei").empty()
			
	for (var i = 0; i <  data.length; i++) {
		//console.log(i)
			if(data[i].name!=null)
    
				//// 카드 div
               var card = document.createElement("div")
               $(card).attr("class","card cc dis")
               
               /// 이미지
               var imgTag = document.createElement("img");
               $(imgTag).addClass("card-img-top imgcard")
               $(imgTag).attr("src","${pageContext.request.contextPath}/upload/recipe/"+data[i].img)
               $(card).append(imgTag)

               /// 카드 안 div
               var body = document.createElement("div");
               $(body).attr("class","card-body")

				/// 카드 제목
               var title = document.createElement("h5");
               $(title).attr("class","card-title");
            	$(title).text(data[i].name)
               $(body).append(title);

            	/// 버튼 rid 전송
               var atag = document.createElement("a");
               $(atag).attr("href","#recipe")
               //$(atag).attr("class","btn btn-success recipe_bnt")
                $(atag).addClass("btn")
               $(atag).addClass("recipe_bnt btn-success")
                $(atag).addClass("clk")
               $(atag).text("레시피보기")
               $(atag).attr("data-rid",data[i].rid)
               $(atag).attr("onclick","modal()")
               //$(atag).text("레시피 보기")
               $(body).append(atag)

               $(card).append(body)
               $(".cardhei").append(card)
			
	}
	return true
		}else{
			
			return false
		}      		
	}

	
}
/////// 레시피 리스트 끝


$("input:text[name=content]").keydown(function(){
if(event.keyCode == 13){
	var rid = $("#recipe").attr("data-rid");
	var chk = chk
	var user_id = $(".username").text()
	var _csrf = $("input:hidden[name=_csrf]").val();
	var content = $("input:text[name=content]").val()

	$.ajax({
		url : "./comment.ajax?rid= "
				+ rid+"&content="+content+"&username="+user_id
						+"&_csrf=" + _csrf,
		type : "GET",
		cache : false,
        success : function(jsonObj, status){
        	console.log("success")
            if(status == "success"){
            	var count = jsonObj.count;
        		var data = jsonObj.data;
        		
        		
        		if(jsonObj.status == "OK"){
  
        			alert("성공")
//	            			comload(rid)
					window.location.reload();
        			$("input:text[name=content]").val("")
        			return true
        		}else{
        			alert("실패")
//            			comload(rid)
					window.location.reload();
        			$("input:text[name=content]").val("")
            			return false
            		}           		
            		
                }
            }
		});
	}
	
});


 function comload(rid){
	console.log("rid "+rid)
$.ajax({
     url : "./comload.ajax?rid=" + rid,
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

 function commentLoad(jsonObj){
	 var count = jsonObj.count;
	 var data = jsonObj.data;
	 
	 if(jsonObj.status == "OK"){
	 console.log("OK")
   $(".commentPage").empty();
	 for(var i = 0; i<data.length; i++){
		 
		 
		 var comment_id = document.createElement("p");
		 $(comment_id).attr("id","comment_id");
		 $(comment_id).text(data[i].name);
		 
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
		 
		 if(data[i].email == $(".username").text()){
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
 $("#preference").click(function(e) {
 	var rid = $("#recipe").attr("data-rid");
	var user_id = $(".username").text();
	var preference = $("input:radio[name=preference]:checked").val();
	var _csrf = $("input:hidden[name=_csrf]").val();
	if(preference == undefined){
		preference = 0;
	}
	
	console.log("[rid: "+rid + "]")
	if($(event.target).attr("data-status") == 0){
		$.ajax({
			url: "./preference?rid="+rid + "&user_id=" + user_id + "&preference=" + preference + "&_csrf=" + _csrf,
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
		$.ajax({
			url: "./preference?rid="+rid + "&user_id=" + user_id + "&_csrf=" + _csrf,
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