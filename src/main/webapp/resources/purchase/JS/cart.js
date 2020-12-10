var _csrf = $("input:hidden[name=_csrf]").val();
callList();

function cancle(e) {
	var parent = $(e).parents("tr");
	var purchaseno = parent.attr("data-no");
	
	$.ajax({
		url: "./deletecart?purchaseno=" + purchaseno +"&_csrf=" + _csrf,
		type: "DELETE",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					parent.remove();
				}else {
					alert("삭제에 실패했어요.");
				}
			} else {
				alert("삭제에 실패했어요.");
			}
		}
	});
};

$(".clear").click(function() {
	cartDeleteAll()
});

function callList(){
	var email = $("span[class=username]").text();
	
	$.ajax({
		url: "./cartList?email=" + email,
		type: "GET",
		cache: false,
		success: function(data, status) {
			if(status == "success"){
				cartList(data);
			}
		}
	});
}

function cartList(jsonObj){
	var data = jsonObj.data;
	var count = jsonObj.count;
	
	var str = "";
	for (var i = 0; i < count; i++) {
		var price = "";
		$(data[i].price.split(",")).each(function(index, item){
			price += item;
		});
		price = parseInt(price);
		
		str += '<tr class="cart" data-no="'+data[i].purchaseno+'"><th class="goDetail" scope="row">';
		if(data[i].pchk == 0){
			str += '<div class="name"><a href="'+getContextPath()+'/purchase/pdetail?no='+data[i].pid+'">' + data[i].p_name + '</a></div>';             
		} else {
			str += '<div class="name"><a href="'+getContextPath()+'/purchase/rdetail?pid='+data[i].pid+'">' + data[i].p_name + '</a></div>';             
		}
        str += '<div class="price">' + data[i].price + '</div></th>';             
        str += '<td><div class="count">' + data[i].count + '</div></td>';                
        str += '<td><div class="total">' + (data[i].count * price) + '</div></td>';                
        str += '<td><button class="btn-cancle btn btn-dark" onclick="cancle(this)">취소</button></td></tr>';                
	}
	
	$("#tbody").html(str);
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

function cartDeleteAll(){

    var data = "";
	var cart = document.getElementsByClassName("cart");
	for (var i = 0; i < cart.length; i++) {
		data += "&purchaseno="+parseInt($(cart[i]).attr("data-no"));
	}
	
    if(cart.length == 0){
		alert("삭제할 장바구니가 없습니다.");
	} else {
		if(!confirm("전부 삭제하시겠습니끼?")){ 
			return false;
		}
        
        $.ajax({
            url : "./deletecartall?_csrf=" + _csrf + data,
            type : "DELETE",
            cache : false,
            success : function(data, status){
                if(status == "success"){
                    if(data.status == "OK"){	
                    	$("#tbody").html("");
                    } else {
                    	alert("삭제에 실패했습니다.")
                        return false;
                    }
                }
            }
        });
    }
    return true;
}
