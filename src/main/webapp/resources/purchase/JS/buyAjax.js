/**
 * 
 */
var _csrf = $("input:hidden[name=_csrf]").val();
var email = $("span[class=username]").text();
callList();

$("form[name=userInfo]").submit(function() {
	   var name = $("input:text[name=name]").val().trim();
	   var phone = $("input:text[name=phone]").val().trim();
	   var address = $("input:text[name=address]").val().trim();
	   
	   var regName = /^[가-힣]*$/;
	   var regNum = /^[0-9]*$/;
	   
	   if(name == "" || address == "" || phone == ""){
	      alert("공백없이 입력해 주세요.");
	      return false;
	   }
	   
	   if(!regName.test(name)){
	      alert("한글만 입력해 주세요.");
	      return false;
	   }
	   
	   if(!regNum.test(phone)) {
	      alert("숫자만 입력해 주세요.");
	      return false;
	   }
	   
	   return true;
	});

function callList(){
	$.ajax({
		url: "./cartList?email=" + email,
		type: "GET",
		cache: false,
		success: function(data, status) {
			if(status == "success"){
				orderList(data);
			}
		}
	});
}

function orderList(jsonObj){
	var data = jsonObj.data;
	var count = jsonObj.count;
	
	var str = "";
	var purchaseno = "";
	var total_price = 0;
	for (var i = 0; i < count; i++) {
		var price = "";
		$(data[i].price.split(",")).each(function(index, item){
			price += item;
		});
		price = parseInt(price);
		
		if(i == 0){
			purchaseno += data[i].purchaseno;
		} else {
			purchaseno += "," + data[i].purchaseno;
		}
		str += '<tr class="order" data-no="'+data[i].purchaseno+'"><th scope="row">';
        str += '<div class="name">' + data[i].p_name + '</div></th>';             
        str += '<td><div class="price">' + data[i].price + '</div></td>';             
        str += '<td><div class="count">' + data[i].count + '</div></td>';                
        str += '<td><div class="total">' + (data[i].count * price) + '</div></td></tr>';
        total_price += (data[i].count * price);
	}
	str += '<input type="hidden" name="purchaseno" value="'+purchaseno+'"/>';
	
	$("#tbody").html(str);
	$("div[id=total-price]").html(total_price);
}

$("input:radio[id=addr-use]").click(function() {
	$.ajax({
		url: "./userinfo?email=" + email,
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				setUserInfo(data);
			}
		}
	});
});

function setUserInfo(jsonObj){
	var data = jsonObj.data[0];
	
	$("input:text[name=name]").val(data.name);
	$("input:text[name=phone]").val(data.tel);
	$("input:text[name=address]").val(data.address);
	
	$("input:text[name=name]").attr("readonly", true);
	$("input:text[name=phone]").attr("readonly", true);
	$("input:text[name=keyword]").attr("readonly", true);
	
	$("input:button[name=addr_btn]").attr("disabled", true);
}

$("input:radio[id=addr-input]").click(function() {
	$("input:text[name=name]").val("");
	$("input:text[name=phone]").val("");
	$("input:text[name=keyword]").val("");
	$("input:text[name=address]").val("");
	
	$("input:text[name=name]").attr("readonly", false);
	$("input:text[name=phone]").attr("readonly", false);
	$("input:text[name=keyword]").attr("readonly", false);
	
	$("input:button[name=addr_btn]").attr("disabled", false);
});