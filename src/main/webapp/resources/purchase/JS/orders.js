/**
 * 
 */
var email = $(".username").text();
var _csrf = $("input:hidden[name=_csrf]").val();

callOrderList();

function callOrderList() {
	$.ajax({
		url: "./orderlist?email=" + email + "&_csrf=" + _csrf,
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				showlist(data);
			}
		}
	});
}

function showlist(jsonObj){
	var data = jsonObj.data;
	var deliverchk = ["","결제완료","배송준비중","배송중","배송완료"];
	var str = "";
	
	for (var i = 0; i < data.length; i++) {
		var price = "";
		$(data[i].price.split(",")).each(function(index, item){
			price += item;
		});
		price = parseInt(price);
		
		str += '<tr class="order" data-purchaseno="' + data[i].purchaseno + '"><th scope="row">';
		str += '<div class="name">' + data[i].p_name + '</div>';
		str += '<div class="price">' + data[i].price + '</div></th>';
		str += '<td><div class="count">' + data[i].count + '</div></td>';
		str += '<td><div class="total">' + (price * data[i].count) + '</div></td>';
		str += '<td><div class="deliver-status">'+deliverchk[data[i].deliverchk]+'</div></td>';
		str += '<td><div class="buydate">' + data[i].buydate + '</div></td>';
		if(data[i].deliverchk == 1){
			str += '<td><button class="btn-cancle btn btn-dark" onclick="ordercancle(this)">취소</button></td></tr>';
		} else {
			str += '</tr>';
			
		}
	}
	
	$("#tbody").html(str);
}

function ordercancle(target){
	var purchaseno = $(target).parents(".order").attr("data-purchaseno");
	$.ajax({
		url: "./deletecart?purchaseno=" + purchaseno + "&_csrf=" + _csrf,
		type: "DELETE",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					$(target).parents(".order").remove();
				} else {
					console.log("OKKKKKK");
					alert("주문이 취소되지 않았습니다.");
				}
			} else{
				console.log("FAILLLLLL");
				alert("주문이 취소되지 않았습니다.");
			}
		}
	});
}