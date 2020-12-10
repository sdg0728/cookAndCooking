var _csrf = $("input:hidden[name=_csrf]").val();
var pageCurrent = 1;

$("document").ready(function() {
	$.ajax({
    	url : "./memberlist/?&_csrf=" + _csrf,
    	type : 'POST',
    	cache : false,
    	success : function(data, status) {
    		if(status=="success") {
    			if(data.status == "OK") {
    				
    				parseJSON(data)
    				
    			}
    		}
    		
    	}

    });
	
});

function parseJSON(jsonObj){	
	
	var data = jsonObj.data;
	
    //var page_length = length - h_length;
	console.log(data)
	for (var i = 0; i < data.length; i++) {
		//$('#list_content').append('<tr><th scope="row"><a class="email">'+data[i].email+'</a></th><td class="name">'+data[i].name+'</td><td class="score">'+data[i].score+'</td><td class="tel">'+data[i].tel+'</td><td class="buttons"><div class="admin-btn-wrap"><a href="${pageContext.request.contextPath }/admin/aupdate"> <button type="button" class="btn btn-dark">보기</button></a></div></td></tr>')
		$('#list_content').append('<tr><th scope="row"><a class="email" href="'+$('#pathId').val()+'/member/myPage?email='+data[i].email+'">'+data[i].email+'</a></th><td class="name">'+data[i].name+'</td><td class="score">'+data[i].score+'</td><td class="tel">'+data[i].tel+'</td><td class="buttons"><div class="admin-btn-wrap"><a href="'+$('#pathId').val()+'/member/myPage?email='+data[i].email+'"><button type="button" class="btn btn-dark">보기</button></a></div></td></tr>')
	}
	
	var h_length = $($('#list_content').children('tr')).length;
	var page_length = h_length;
	
    if((h_length % 10) == 0){
    	page_length = h_length / 10 + 0.1;
    } else{
    	page_length = h_length / 10 + 1
    }
	
	 var str = '';
     for (var i = 1; i < page_length; i++) {
     	if(i == 1){
     		str += '<li class="page-item active"><a class="page-link" data-page='+i+' onclick="viewPage()">'+i+'</a></li>';
     	}else{
     		str += '<li class="page-item"><a class="page-link" data-page='+i+' onclick="viewPage()">'+i+'</a></li>';
     	}
 	}
     $(".page-ul").html(str);
     
     pageCurrent = 1;
     console.log("현재페이지: " + pageCurrent);
     
    var length = $($('#list_content').children('tr')).length;
 	
 	for (var i = 0; i < length; i++) {
 		if(i < 10){
 			
 			$($($('#list_content').children('tr'))[i]).attr("class", "prod-info");
 		} else {
 			$($($('#list_content').children('tr'))[i]).attr("class", "prod-info hidden");
 		}
 	}
     
}

function viewPage() {
	$(".page-item").attr("class", "page-item");
	$(event.target).parent().addClass("active");
	
	var currentPage = $(event.target).attr("data-page");
	pageCurrent = currentPage;
	var start = (pageCurrent - 1) * 10;
	var end = start + 10;
	var length = $($('#list_content').children('tr')).length;
	
	for (var i = 0; i < length; i++) {
		if(i >= start && i < end){
			$($($('#list_content').children('tr'))[i]).attr("class", "prod-info");
		} else {
			$($($('#list_content').children('tr'))[i]).attr("class", "prod-info hidden");
		}
	}
	console.log("현재페이지: " + pageCurrent);
}

$('input[type="text"]').keydown(function() {
	if (event.keyCode === 13) {
		
		$.ajax({
	    	url : "./seletedMember/?&_csrf=" + _csrf,
	    	type : 'POST',
	    	cache : false,
	    	data: {search : $('#searchId').val()},
	    	success : function(data, status) {
	    		if(status=="success") {
	    			if(data.status == "OK") {
	    				
	    				parseJSON2(data)
	    				
	    			}
	    		}
	    		
	    	}

	    });
		
		event.preventDefault();
	};
}); 


function parseJSON2(jsonObj){	
	
	var data = jsonObj.data;
	$('#list_content').empty();
	$('#list_content').append('<tr><th scope="row"><a class="email" href="'+$('#pathId').val()+'/member/myPage?email='+data[0].email+'">'+data[0].email+'</a></th><td class="name">'+data[0].name+'</td><td class="score">'+data[0].score+'</td><td class="tel">'+data[0].tel+'</td><td class="buttons"><div class="admin-btn-wrap"><a href="'+$('#pathId').val()+'/member/myPage?email='+data[0].email+'"> <button type="button" class="btn btn-dark">보기</button></a></div></td></tr>')
     
}