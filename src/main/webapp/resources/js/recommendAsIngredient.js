
var _csrf = $("input:hidden[name=_csrf]").val();

$(".food_cate li").click(function(e) {
	var code = $(e.target).attr("data-cate-code");
	console.log(code)
	for (var i = 1; i <= $('.food_detail').length; i++) {
		if(code.charAt(0)==i)
			$('#food_detail'+i).css('display', 'block')
		else
			$('#food_detail'+i).css('display', 'none')
	}
	
});

$(document).ready(function() {
	for (var i = 1; i <= $('.food_detail').length; i++) {
		if(i==1)
			$('#food_detail'+i).css('display', 'block')
		else
			$('#food_detail'+i).css('display', 'none')
	}
	var arr = new Array()
	
	for (var i = 0; i < $('.ingre_text').length; i++) {
		arr[i] = $($('.ingre_text')[i]).text()
	}
	
	var ingre = ""
	for (var i = 0; i < arr.length; i++) {
		ingre += arr[i] + ','
	}
	
	$.ajax({
    	url : "./recommend/fristRecipes/?&_csrf=" + _csrf,
    	type : 'POST',
    	cache : false,
    	data: {ingre : ingre},
    	success : function(data, status) {
    		
    		if(status=="success") {
    			if(data.status == "OK") {
    				
    				parseJSON(data)
    				
    			}
    		}
    		
    	}
  
    });
	
	
	
});



function recommendSearch () {
	
	var res = ''
	for (var i = 0; i < $('.i_list').length; i++) {
		res += $('.i_list')[i].value + ","
	}
	
	$('#recomId').val(res)
	
}

function btnRemove(e) {	
	$(e).remove()
}

		
$('input[type="text"]').keydown(function() {
	if (event.keyCode === 13) {
		if($('.i_list').length > 0) {
			
			var chk = false
			
			for (var i = 0; i < $('.i_list').length; i++) {
				if($('.i_list')[i].value == $('#input_search').val()) {
					alert('등록된 재료입니다.');
					chk = true
					break;
				}
			}
			if(!chk)
				$('.selected_list').append('<input type="button" class="i_list btn btn-info" value="'+$('#input_search').val()+'" onclick="btnRemove(this)">');
				
		}else {
			$('.selected_list').append('<input type="button" class="i_list btn btn-info" value="'+$('#input_search').val()+'" onclick="btnRemove(this)">')

		}
		event.preventDefault();
	};
}); 

$('.in-del').click(function() {
	$(event.target).parents('.closing').remove();
}); 

function getRecipe(kind, taste, ingre){
	
	$.ajax({
    	url : "./recommend/recipes/?&_csrf=" + _csrf,
    	type : 'POST',
    	cache : false,
    	data: {kind : kind,
    		taste : taste,
    		ingre : ingre},
    	success : function(data, status) {
    		
    		if(status=="success") {
    			if(data.status == "OK") {
    				
    				parseJSON(data)
    				
    			}
    		}
    		
    	}
  
    });
	
}



function parseJSON(jsonObj){	
	
	var data1 = jsonObj.data1;
	var data2 = jsonObj.data2;
			
	$(".cardhei").empty()
	$('#recipeCnt').text(data1.length+data2.length)
	for (var i = 0; i <  data1.length; i++) {

		//// 카드 div
       var card = document.createElement("div")
       $(card).attr("class","card cc dis rcard")
       
       /// 이미지
       var imgTag = document.createElement("img");
       $(imgTag).addClass("card-img-top imgcard")
       $(imgTag).attr("src",$('#path').val()+"/upload/recipe/"+data1[i].img)
       $(card).append(imgTag)

       /// 카드 안 div
       var body = document.createElement("div");
       $(body).attr("class","card-body")

		/// 카드 제목
       var title = document.createElement("h5");
       $(title).attr("class","card-title");
    	$(title).text(data1[i].name)
       $(body).append(title);

    	/// 버튼 rid 전송
       var atag = document.createElement("a");
       $(atag).attr("href","#recipe")
       $(atag).addClass("btn")
       $(atag).addClass("recipe_bnt btn-success")
       $(atag).addClass("clk")
       $(atag).text("레시피보기")
       $(atag).attr("data-rid",data1[i].rid)
       $(atag).attr("data-chk",0)
       $(atag).attr("onclick","modal()")
       $(body).append(atag)
       $(card).append(body)
       $(".cardhei").append(card)
           
	}
	
	for (var i = 0; i <  data2.length; i++) {

		//// 카드 div
       var card = document.createElement("div")
       $(card).attr("class","card cc dis urcard")
       
       /// 이미지
       var imgTag = document.createElement("img");
       $(imgTag).addClass("card-img-top imgcard")
       $(imgTag).attr("src",$('#path').val()+"/upload/userRecipe/"+data2[i].img)
       $(card).append(imgTag)

       /// 카드 안 div
       var body = document.createElement("div");
       $(body).attr("class","card-body")

		/// 카드 제목
       var title = document.createElement("h5");
       $(title).attr("class","card-title");
       $(title).text(data2[i].name)
       $(body).append(title);

    	/// 버튼 rid 전송
       var atag = document.createElement("a");
       $(atag).attr("href","#recipe")
       $(atag).addClass("btn")
       $(atag).addClass("recipe_bnt btn-success")
       $(atag).addClass("clk")
       $(atag).text("레시피보기")
       $(atag).attr("data-rid",data2[i].user_rid)
       $(atag).attr("data-chk",1)
       $(atag).attr("onclick","modal()")
       $(body).append(atag)
       $(card).append(body)
       $(".cardhei").append(card)
           
	}
	
}

$('#research').click(function() {
	
	var kind = "";

	$('input:checkbox[name="kind_info"]').each(function() {

		if(this.checked) {
			kind += this.value + ","
		}

	});

	 var taste = "";
		
	 $('input:checkbox[name="taste_info"]').each(function() {

		 if(this.checked) {
			 taste += this.value + ","
			}

	 });
	 
	 var ingre = "";
	 
	 for (var i = 0; i < $('.ingre_text').length; i++) {
		 ingre += $($('.ingre_text')[i]).text() + ","
	}
	 
	 $('#kindId').val(kind)
	 $('#tasteId').val(taste)
	 $('#ingreId').val(ingre)
	 
	 getRecipe(kind, taste, ingre)
}); 

function modal() {
    var target = $(event.target);
    
    
    
    if($("#recipe").attr("data-toggle") == "0"){
       rid = target.attr('data-rid')
       loadPage(target);
       $("#recipe").show();
       $("#recipe").attr("data-toggle", "1");
       
    } else {
       $("#recipe").hide();
       $("#recipe").attr("data-toggle", "0");
    }
}
 
 $(".close").click(function() {
    $("#recipe").hide();
    $("#recipe").attr("data-toggle", "0");
    $("#ing").empty();
    });
   
    	
 // page번째 목록 읽어오기
function loadPage(target){
   var rid = target.attr("data-rid");
   var chk = target.attr("data-chk");
   
   console.log("chk: "+chk)
   if(chk==0) {
	   $.ajax({
	        url : "./view.ajax?rid=" + rid,
	        type : "GET",
	        cache : false,
	        success : function(data, status){
	            if(status == "success"){
	               updateList(data, chk);
	            }
	        }

	    });   
   }else {
	   $.ajax({
	        url : "./view2.ajax?rid=" + rid,
	        type : "GET",
	        cache : false,
	        success : function(data, status){
	            if(status == "success"){
	               updateList(data, chk);
	            }
	        }

	    });
   }
    
    
    
    
} // end loadPage()

function updateList(jsonObj, chk){
    result = "";  // 최종 결과물

    if(jsonObj.status == "OK"){
        var count = jsonObj.count;
        var items = jsonObj.data[0];  // 글 배열
       
        
        
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

 	  $("#ing").text(items.ingredient);     
 	  if(chk==0)
 		  $('#modal_img').attr('src',$('#path').val()+'/upload/recipe/'+items.img)
      else 
 		  $('#modal_img').attr('src',$('#path').val()+"/upload/userRecipe/"+items.img)
 	  
 	  
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
      
      
        return true;
    } else {
        alert("내용이 없습니다");
        return false;
    }
}

