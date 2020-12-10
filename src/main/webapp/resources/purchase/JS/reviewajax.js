/**
 * 
 */
var _csrf = $("input:hidden[name=_csrf]").val();
	
$(".review-update").click(function(){
	if($(event.target).attr("data-confirm") == 0){
		$(event.target).text("확인");
		$(event.target).attr("data-confirm","1");
		
		var content = $(event.target).parents(".review-content").children(".content");
		var textarea = "<textarea name='content' class='r_update' placeholder='리뷰를 작성해 주세요.'>"+content.text()+"</textarea>"
		
		content.replaceWith(textarea);
	} else {
		var content = $(event.target).parents(".review-content").children("textarea[name=content]");
		
		if(content.val().trim() == ""){
			alert("리뷰를 입력해주세요.")
			return false;
		}
		
		update(content.val(), $(event.target), function(target){
			console.log("in!!!")
			target.text("수정");
			target.attr("data-confirm","0");
			var $content = target.parents(".review-content").children("textarea[name=content]");
			var div = "<div class='content'>"+$content.val()+"</div>"
			
			content.replaceWith(div);
		});
	}
});

function update(r_comment, target, callback){
	var prid = target.parents(".review").attr("data-prid");
	
	$.ajax({
		url: "./updateOk?prid=" + prid + "&r_comment=" + r_comment + "&_csrf=" + _csrf,
		type: "PUT",
		cache: false,
		success: function(data, status){
			if(status != "success"){
				console.log("status!!")
				alert("수정하지 못했습니다.");
			} else {
				if(data.status == "OK"){
					console.log("OK")
					callback(target);
				} else {
					console.log("data.status!!!")
					alert("수정하지 못했습니다.");
				}
			}
		}
	});
}

$(".review-delete").click(function() {
	if(confirm("삭제 하시겠습니까?")){
		var target = $(event.target);
		
		deleteReview(target, function(target){
			target.parents(".review").remove();
		});
		
	}
});

function deleteReview(target, callback){
	var prid = target.parents(".review").attr("data-prid");
	
	$.ajax({
		url: "./deleteOk?prid=" + prid + "&_csrf=" + _csrf,
		type: "DELETE",
		cache: false,
		success: function(data, status){
			if(status != "success"){
				alert("삭제하지 못했습니다.");
			} else {
				if(data.status == "OK"){
					callback(target);
				} else {
					alert("삭제하지 못했습니다.");
				}
			}
		}
	});
}