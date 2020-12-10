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
  
   })
    
$("#comment-text").keyup(function(){

	$(".comment").text($(".comment").text()+$(this).val()) 
if(event.keyCode==13){
	$(this).val("") 
	}
});


$("button[name=editor]").click(function(){
	var target= event.target
	console.log(target)
	
});




function plus(target) {
	console.log("[plus]")
if($("#recipe").attr("data-toggle") == 0){
	console.log("[toggle 0]")
	loadPage($(target));
	$("#recipe").attr("data-toggle", 1);
} else {
	console.log("[toggle 1]")
	$("#recipe").hide();
	$("#recipe").attr("data-toggle", 0);
	}
}

$(".close").click(function() {
	$("#recipe").hide();
	$("#ing").empty();
	$("#recipe").attr("data-toggle", 0);
	$(".kind_view").empty()
	kindpage(7)
});

// page번째 목록 읽어오기
function loadPage(target){
	console.log("[loadPage]")
var user_rid = parseInt(target.parents(".user_recipe").attr("data-rid"));
	console.log(user_rid)
$.ajax({
    url : "./recipeView?user_rid=" + user_rid,
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
} // end loadPage()

function updateList(jsonObj, target){
    result = "";  // 최종 결과물

if(jsonObj.status == "OK"){
    var count = jsonObj.count;
    var items = jsonObj.data1[0];  // 글 배열
    var names = jsonObj.data2[0];
	$(".modal-title").text(items.name);
	$(".modal-id").text(names);
	user_rid = items.user_rid;
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
	$('#modal_img').attr('src', '${pageContext.request.contextPath }/upload/userRecipe/'+items.img)
	
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
	
	
    return true;
} else {
    alert("내용이 없습니다");
        return false;
    }
}

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
	    				clsList(data)
	    				
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
	    				clsList(data)
	    				
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
	    				clsList(data)
	    				
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
			 $(img).attr("src","${pageContext.request.contextPath}/upload/userRecipe/"+items[i].img)
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