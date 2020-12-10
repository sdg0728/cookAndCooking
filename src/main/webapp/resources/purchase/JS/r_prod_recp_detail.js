$(".recommand-recipe-wrap").hide();
$(".review-wrap").hide();
var csrf = $("input:hidden[name=_csrf]").val();

$(".recm-btn").click(function() {
    $(".recommand-recipe-wrap").toggle();
});

$(".review-btn").click(function() {
    $(".review-wrap").toggle();
});

$(".btn-purchase").click(function() {
	var chkCount = /^[0-9]*$/;
	
	var pid = $(".prod-info-wrap").attr("data-pid");
	var email = $(".username").text();
	var price = $(".prod-price span").text();
	var count = $("input:text[name=count]").val().trim();
	var p_name = $(".prod-name").text();
	var pchk = $(".prod-info-wrap").attr("data-pchk");
	
	if(count == "" || count < 0 || !chkCount.test(count)){
		alert("수량을 확인해 주세요.");
		return;
	}
	
	$.ajax({
		url: "./cartGo?pid=" + pid + "&p_name=" + p_name + "&email=" + email + "&price=" + price + "&count=" + count + "&pchk=" + pchk + "&_csrf=" + csrf,
		type: "POST",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
		    	   location.href = getContextPath() + "/purchase/buy";
				} else {
				   alert("다시 주문해 주세요.");
				}
			} else {
				alert("다시 주문해 주세요.");
			}
		}
	});
});

$(".btn-cart").click(function() {
	var chkCount = /^[0-9]*$/;
	
	var pid = $(".prod-info-wrap").attr("data-pid");
	var email = $(".username").text();
	var price = $(".prod-price span").text();
	var count = $("input:text[name=count]").val().trim();
	var p_name = $(".prod-name").text();
	var pchk = $(".prod-info-wrap").attr("data-pchk");
	
	if(count == "" || count < 0 || !chkCount.test(count)){
		alert("수량을 확인해 주세요.");
		return;
	}
	console.log(pid+" "+email+" "+price+" "+count);
	$.ajax({
		url: "./cartGo?pid=" + pid + "&p_name=" + p_name + "&email=" + email + "&price=" + price + "&count=" + count + "&pchk=" + pchk + "&_csrf=" + csrf,
		type: "POST",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				cart(data);
			}
		}
	});
});

function cart(jsonObj){
    if(jsonObj.status == "OK"){
       if(confirm("장바구니로 이동하시겠습니까?")){
    	   location.href = getContextPath() + "/purchase/cart";
       }else {
    	   history.back();
       }
    } else {
        alert("장바구니에 넣지 못 했어요");
    }
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}