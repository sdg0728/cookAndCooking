/**
 * 
 */
var page = 1;
var _csrf = $("input:hidden[name=_csrf]").val();

function viewPage(){
	var target = $(event.target);
	var currentPage = target.attr("data-page");
	page = currentPage;
	
	$.ajax({
		url: "./" + page,
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
		str += '<tr data-pid="' + data[i].pid + '">';
		str += '<td class="check"><input type="checkbox" name="delete-chk" value="'+data[i].pid+'"/></td>';
		str += '<th scope="row"><a href="' + getContextPath() + '/admin/aupdate?pid=' 
			   + data[i].pid + '" class="name">'+data[i].p_name+'</a></th>';
		str += '<td class="count">' + data[i].p_count + '</td>';
		str += '<td class="price">' + data[i].p_price + '</td>';
		str += '<td class="kind">' + data[i].p_kind + '</td></tr>';
	}
	
	$("#tbody").html(str);
	$(".pagination li").attr("class", "page-item");
	target.parent().addClass("active");
}

function deleteShowPage(jsonObj, totalPage){
	var data = jsonObj.data;
	var str = "";
	
	for (var i = 0; i < data.length; i++) {
		str += '<tr data-pid="' + data[i].pid + '">';
		str += '<td class="check"><input type="checkbox" name="delete-chk" value="'+data[i].pid+'"/></td>';
		str += '<th scope="row"><a href="' + getContextPath() + '/admin/aupdate?pid=' 
			   + data[i].pid + '" class="name">'+data[i].p_name+'</a></th>';
		str += '<td class="count">' + data[i].p_count + '</td>';
		str += '<td class="price">' + data[i].p_price + '</td>';
		str += '<td class="kind">' + data[i].p_kind + '</td></tr>';
	}
	
	$("#tbody").html(str);
	str = "";
	
	for (var i = 0; i < totalPage; i++) {
		if(i == page - 1){
			console.log("[IN]")
			str += '<li class="page-item active"><a class="page-link" data-page='+(i + 1)+' onclick="viewPage()">'+(i + 1)+'</a></li>';
		} else {
			str += '<li class="page-item"><a class="page-link" data-page='+(i + 1)+' onclick="viewPage()">'+(i + 1)+'</a></li>';
		}
	}
	console.log(str)
	$(".page-ul").html(str);
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

$(".btn-search").click(function(){
	search();
});

$("input:text[name=admin-search]").keydown(function(){
	if(event.keyCode == 13){
		search();
	}
});

function search() {
	var search = $("input:text[name=admin-search]").val().trim();
	if(search == ""){
		alert("검색어를 입력해 주세요.");
		return false;
	}
	
	$.ajax({
		url: "./rsearch?search=" + search,
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					var str = "";
					
					for (var i = 0; i < data.data.length; i++) {
						str += '<tr data-pid="' + data.data[i].pid + '">';
						str += '<td class="check"><input type="checkbox" name="delete-chk" value="'+data[i].pid+'"/></td>';
						str += '<th scope="row"><a href="' + getContextPath() + '/admin/aupdate?pid=' 
							   + data.data[i].pid + '" class="name">'+data.data[i].p_name+'</a></th>';
						str += '<td class="count">' + data.data[i].p_count + '</td>';
						str += '<td class="price">' + data.data[i].p_price + '</td>';
						str += '<td class="kind">' + data.data[i].p_kind + '</td></tr>';
					}
					
					$("#tbody").html(str);
				}
			}
		}
	});
}

$(".recipe-title").click(function(){
	var target = $($(".page-link")[0]);
	var currentPage = target.attr("data-page");
	page = currentPage;
	
	$.ajax({
		url: "./" + page,
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
});

$(".btn-delete").click(function() {
	var chk = $("input:checkbox[name=delete-chk]:checked");
	var param = "";
	
	$(chk).each(function(index, items){
		param += "&pid=" + $(items).val();
	});
	console.log(param)
	
	if (confirm("삭제 하시겠습니까?")) {
		$.ajax({
			url : "./rdelete?_csrf=" + _csrf + param,
			type : "DELETE",
			cache : false,
			success : function(data, status) {
				if (status == "success") {
					if (data.status == "OK") {
						var target = $($(".page-link")[page-1]);
						var totalPage = data.count;
						
						if(target.parents(".page-ul").children("li").length == 0){
							target = $($(".page-link")[page-2]);
						}
						
						$.ajax({
							url: "./" + page,
							type: "GET",
							cache: false,
							success: function(data, status){
								if(status == "success"){
									if(data.status == "OK"){
										deleteShowPage(data, totalPage);
									}
								}
							}
						});
						
					} else {
						alert("삭제하지 못했습니다.");
					}
				} else {
					alert("삭제하지 못했습니다.");
				}
			}
		});
	}
});