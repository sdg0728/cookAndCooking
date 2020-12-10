$("li[class=nav-item]").click(function(event) {
    $(".nav-item").attr("class", "nav-item");
    $(event.target).parent().attr("class", "nav-item active");
});

var pageCode = "000";
var pageCurrent = 1;

ready();

$(".nav-content li").click(function(e) {
    $(".nav-content li").attr("class", "");
    $(e.target).attr("class", "black");
    
    var code = $(e.target).attr("data-cate-code");
    pageCode = code;
    var length = $(".prod-info").length;
    
    if(code != "000"){
    	var cnt = 0;
    	for(var i = 0; i < length; i++){
    		if(code != $($(".prod-info")[i]).attr("data-cate-code")){
    			$($(".prod-info")[i]).attr("class", "prod-info hidden");
    		} else{
    			if(cnt != 10){
    				$($(".prod-info")[i]).attr("class", "prod-info");
    				cnt++;
    			} else{
    				$($(".prod-info")[i]).attr("class", "prod-info hidden");
    			}
    		}
    	}
    	
    	var h_length = $("tr[data-cate-code="+code+"]").length;
        var page_length = length - h_length;
        
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
    } else {
    	for(var i = 0; i < length; i++){
    		if($($(".prod-info")[i]).attr("data-direction") == "0" && parseInt($($(".prod-info")[i]).attr("data-value")) > 5){
				$($(".prod-info")[i]).attr("class", "prod-info");
    		} else{
    			$($(".prod-info")[i]).attr("class", "prod-info hidden");
    		}
    	}
    	$(".page-ul").html("");
    }
});

$(".hamberger").click(function(e) {
    var $wrap = $(e.target).parents(".top-nav");
    console.log($wrap.css("height"));
    if ($wrap.css("height") == "50px") {
        $wrap.css("height", "100px");
    }
    if ($wrap.css("height") == "100px") {
        $wrap.css("height", "50px");
    }

});

function ready() {
	for(var i = 0; i < $(".prod-info").length; i++){
		if($($(".prod-info")[i]).attr("data-direction") == "0" && parseInt($($(".prod-info")[i]).attr("data-value")) > 5){
			$($(".prod-info")[i]).attr("class", "prod-info");
		} else{
			$($(".prod-info")[i]).attr("class", "prod-info hidden");
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
	var length = $("tr[data-cate-code="+pageCode+"]").length;
	
	for (var i = 0; i < length; i++) {
		if(i >= start && i < end){
			$($("tr[data-cate-code="+pageCode+"]")[i]).attr("class", "prod-info");
		} else {
			$($("tr[data-cate-code="+pageCode+"]")[i]).attr("class", "prod-info hidden");
		}
	}
	console.log("현재페이지: " + pageCurrent);
}

$("input:text[name=search]").keydown(function() {
	console.log(event.keyCode)
	if(event.keyCode == 13){
		search();
	}
});

function search() {
	var text = $("input:text[name=search]").val().trim();
	if(text == ""){
		alert("검색어를 입력해 주세요.");
		return false;
	}
	
	for (var i = 0; i < $(".prod-info").length; i++) {
		if($($(".prod-info")[i]).attr("data-name").indexOf(text) != -1 || $($(".prod-info")[i]).attr("data-name") == text) {
			$($(".prod-info")[i]).attr("class", "prod-info");
		} else {
			$($(".prod-info")[i]).attr("class", "prod-info hidden");
		}
	}
	
}