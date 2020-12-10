var deliverStatus = ["", "결제완료", "배송준비중", "배송중", "배송완료"];
var _csrf = $("input:hidden[name=_csrf]").val();

$(document).ready(function() {
	for (var i = 0; i < $(".status").length; i++) {
		$($(".status")[i]).text(deliverStatus[parseInt($($(".status")[i]).attr("data-deliver"))]);
	}
});

function change(e) {
	var $bnt_status = $(e).parent().children(".btn-status");
	var select = '<select class="form-control" id="status">' +
        '<option value="1">결제완료</option>' +
        '<option value="2">배송준비중</option>' +
        '<option value="3">배송중</option>' +
        '<option value="4">배송완료</option></select>';

    $(e).replaceWith(select);
    $bnt_status.removeClass("hidden");
};

function btnStatus(e){
	var $select = $(e).parent().children("#status");
	var purchaseno = $(e).parents("tr").children(".purchaseno").text();
	
	$.ajax({
		url: "./updateDeliver?_csrf="+_csrf+"&purchaseno=" + purchaseno + "&deliverchk=" + parseInt($select.val()),
		type: "PUT",
		dataType: "json",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					var status = "<div class='status' onclick='change(this)'>" + deliverStatus[parseInt($select.val())] + "</div>";
					$select.replaceWith(status);
					$(e).addClass("hidden");
				} else {
					alert("수정 실패!");
					location.reload();
				}
			} else {
				alert("수정 실패!");
				location.reload();
			}
		},
        error: function (jqXHR, textStatus, errorThrown) {
               alert(errorThrown + " " + textStatus);
        }
	});
}

$(".search-bar").keyup(function(e) {
    if (e.keyCode == 13) {
        var search = $(e.target).val();
        console.log(search)
        $.ajax({
        	url: "./searchPurchase?search=" + search,
        	type: "GET",
        	cache: false,
        	success: function(data, status){
        		if(status == "success"){
        			var datas = data.data;
        			var str = "";
        			
        			for (var i = 0; i < datas.length; i++) {
        				str += '<tr><th class="purchaseno" scope="row">'+datas[i].purchaseno+'</th>';
        				str += '<td class="name">'+datas[i].p_name+'</td>';
        				str += '<td class="user">'+datas[i].name+'</td>';
        				str += '<td class="count">'+datas[i].count+'</td>';
        				var arr = datas[i].price.split(",");
        				var price = "";
        				for (var j = 0; j < arr.length; j++) {
        					price += arr[j];
        				}
        				price = parseInt(price);
        				str += '<td class="price">'+(price * datas[i].count)+'</td>';
        				str += '<td class="buydate">'+datas[i].buydate+'</td>';
        				str += '<td class="buttons"><div class="admin-btn-wrap">';
        				str += '<div class="status" onclick="change(this)" data-deliver="'+datas[i].deliverchk+'">'+deliverStatus[parseInt(datas[i].deliverchk)]+'</div>';
        				str += '<button type="button" class="hidden btn btn-dark btn-status" onclick="btnStatus(this)">수정하기</button></div></td></tr>';
        				
        			}
        			
        			$("#tbody").html(str);
        		}
        	}
        });
    }
});

function viewPage(){
	var target = $(event.target);
	var page = target.attr("data-page");
	
	$.ajax({
		url: "./showSellList?page=" + page,
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					showPage(data, target);
				}
			}
		}
	});
}

function showPage(jsonObj, target){
	var data = jsonObj.data;
	var str = "";
	
	for (var i = 0; i < data.length; i++) {
		str += '<tr><th class="purchaseno" scope="row">'+data[i].purchaseno+'</th>';
		str += '<td class="name">'+data[i].p_name+'</td>';
		str += '<td class="user">'+data[i].name+'</td>';
		str += '<td class="count">'+data[i].count+'</td>';
		var arr = data[i].price.split(",");
		var price = "";
		for (var j = 0; j < arr.length; j++) {
			price += arr[j];
		}
		price = parseInt(price);
		str += '<td class="price">'+(price * data[i].count)+'</td>';
		str += '<td class="buydate">'+data[i].buydate+'</td>';
		str += '<td class="buttons"><div class="admin-btn-wrap">';
		str += '<div class="status" onclick="change(this)" data-deliver="'+data[i].deliverchk+'">'+deliverStatus[parseInt(data[i].deliverchk)]+'</div>';
		str += '<button type="button" class="hidden btn btn-dark btn-status" onclick="btnStatus(this)">수정하기</button></div></td></tr>';
		
	}
	
	$("#tbody").html(str);
	$(".pagination li").attr("class", "page-item");
	target.parent().addClass("active");
}




    
        
        
    

