var page = 1;
var pageRows = 10;
var kind = 7;

// 페이지 최초 로딩되면 게시글 목록 첫페이지분 로딩
// [이전] 버튼 눌렀을때 -> 이전 페이지 게시글목록 로딩
// [다음] 버튼 눌렀을때 -> 다음 페이지 게시글목록 로딩

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

$(".nav-content li").click(function(e) {
    $(".nav-content li").attr("class", "");
    $(e.target).attr("class", "black");
    kind = $(e.target).attr("data-kind");
    page = 1;
    loadPage();
});

function pageLoad(currentPage){
	page = currentPage;
	loadPage();
}

function recommendPage() {
	$(".content-wrap").html("")
	$.ajax({
    	url : "./recommend",
    	type : 'GET',
    	cache : false,
    	data: {email : $('#emailId').val()},
    	success : function(data, status) {
    		
    		if(status=="success") {
    			if(data.status == "OK") {
    				
    				updateList2(data);
    				
    			}
    		}
    		
    	}
  
    });
	
	$.ajax({
    	url : "./taste",
    	type : 'GET',
    	cache : false,
    	data: {email : $('#emailId').val()},
    	success : function(data, status) {
    		
    		if(status=="success") {
    			if(data.status == "OK") {
    				
    				updateList2(data);
    				
    			}
    		}
    		
    	}
  
    });
	
}

// page번째 목록 읽어오기
function loadPage(){
	
	if(kind != 7) {
		$.ajax({
	        url : "./" + kind,
	        type : "GET",
	        cache : false,
	        success : function(data, status){
	            if(status == "success"){
	                updateList(data);
	            }
	        }
	    });
	}else {
		recommendPage()
	}
    
} // end loadPage()

function updateList(jsonObj){
    result = "";  // 최종 결과물

    if(jsonObj.status == "OK"){
    	var count = jsonObj.count;
   
        window.page = jsonObj.page;
        window.pageRows = jsonObj.pagerows;

        var items = jsonObj.data;  // 글 배열
        
        var str = "";
        
        for(var i = 0; i < count; i++){
        	str += '<div class="product">';
        	str += '<a href="' + getContextPath() + '/purchase/rdetail?pid='+items[i].pid+'"><div class="prod-img">';
    		str += '<img src="' + getContextPath() + '/upload/recipe/' + items[i].p_img + '"/></div><div class="prod-info">';
			str += '<span class="prod-name">' + items[i].p_name + '</span>';
			str += '<span class="prod-price">' + items[i].p_price + '</span>';
			str += '<span class="prod-rate">';
			if(items[i].r_score >= 0 && items[i].r_score < 1){
				str += '<i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score >= 1 && items[i].r_score < 2){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score >= 2 && items[i].r_score < 3){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score >= 3 && items[i].r_score < 4){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score >= 4 && items[i].r_score < 5){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score == 5){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i>';
			}
			str += '<span> ' + items[i].r_score + '</span></span></div></a></div>';
        }
        
        $(".content-wrap").html(str)
        return true;
    } else {
        alert("내용이 없습니다");
        return false;
    }
}

function updateList2(jsonObj){
    result = "";  // 최종 결과물

    if(jsonObj.status == "OK"){
    	var count = jsonObj.count;
   
        window.page = jsonObj.page;
        window.pageRows = jsonObj.pagerows;

        var items = jsonObj.data;  // 글 배열
        
        var str = $(".content-wrap").html();
        
        for(var i = 0; i < count; i++){
        	str += '<div class="product">';
        	str += '<a href="' + getContextPath() + '/purchase/rdetail?pid='+items[i].pid+'"><div class="prod-img">';
    		str += '<img src="' + getContextPath() + '/upload/recipe/' + items[i].p_img + '"/></div><div class="prod-info">';
			str += '<span class="prod-name">' + items[i].p_name + '</span>';
			str += '<span class="prod-price">' + items[i].p_price + '</span>';
			str += '<span class="prod-rate">';
			if(items[i].r_score >= 0 && items[i].r_score < 1){
				str += '<i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score >= 1 && items[i].r_score < 2){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score >= 2 && items[i].r_score < 3){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score >= 3 && items[i].r_score < 4){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score >= 4 && items[i].r_score < 5){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star gray"></i>';
			} else if(items[i].r_score == 5){
				str += '<i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i><i class="fas fa-star blue"></i>';
			}
			str += '<span> ' + items[i].r_score + '</span></span></div></a></div>';
        }
        
        $(".content-wrap").html(str)
        return true;
    } else {
        alert("내용이 없습니다");
        return false;
    }
}

$("input:text[name=search]").keydown(function() {
	if(event.keyCode == 13){
		search();
	}
});

$(".search-btn").click(function(){
	search();
});

function search() {
	var search = $("input:text[name=search]").val();
	$.ajax({
        url : "./recipeSearch?search=" + search,
        type : "GET",
        cache : false,
        success : function(data, status){
            if(status == "success"){
            	$(".nav-content li").attr("class", "");
                updateList(data);
            }
        }
    });
}


	
recommendPage();

