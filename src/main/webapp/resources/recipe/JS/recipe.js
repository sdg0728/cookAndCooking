var _csrf = $("input:hidden[name=_csrf]").val();

var rid = 0

$(document).ready(function() {
	categoryFun(7)
})

    
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
	    	url : "./itembased?&_csrf=" + _csrf,
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
	    	url : "./userbased?&_csrf=" + _csrf,
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
	    	url : "./tastebased?&_csrf=" + _csrf,
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
			
			var data = jsonObj.data;
			
		console.log(data)
		for (var i = 0; i <  data.length; i++) {
		
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
   
    console.log(target)
    console.log($("#recipe").attr("data-toggle"))
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
    $(".cardhei").empty()
    categoryFun(7)
     });
   
    	
 // page번째 목록 읽어오기
function loadPage(target){
   var rid = target.attr("data-rid");
  
    $.ajax({
        url : "./view.ajax?rid=" + rid,
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

function enterSubmit(e){
	if(e.keycode == 13){
		$(".comment").text($(e.target).val());

	}
}

