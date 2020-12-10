
var _csrf = $("input:hidden[name=_csrf]").val();

$(".food_cate li").click(function(e) {
	var code = $(e.target).attr("data-cate-code");
	
	for (var i = 1; i <= $('.food_detail').length; i++) {
		if(code.charAt(0)==i)
			$('#food_detail'+i).css('display', 'block')
		else
			$('#food_detail'+i).css('display', 'none')
	}
	
});

$(document).ready(function() {
	for (var i = 1; i <= $('.food_detail').length; i++) {
		if(i==1)
			$('#food_detail'+i).css('display', 'block')
		else
			$('#food_detail'+i).css('display', 'none')
	}
});

function recommendSearch () {
	
	var res = ''
	for (var i = 0; i < $('.i_list').length; i++) {
		res += $('.i_list')[i].value + ","
	}
	
	$('#recomId').val(res)
	
}

function btnRemove(e) {	
	$(e).remove()
}

		
$('input[type="text"]').keydown(function() {
	if (event.keyCode === 13) {
		if($('.i_list').length > 0) {
			
			var chk = false
			
			for (var i = 0; i < $('.i_list').length; i++) {
				if($('.i_list')[i].value == $('#input_search').val()) {
					alert('등록된 재료입니다.');
					chk = true
					break;
				}
			}
			if(!chk)
				$('.selected_list').append('<input type="button" class="i_list btn btn-info" value="'+$('#input_search').val()+'" onclick="btnRemove(this)">');
				
		}else {
			$('.selected_list').append('<input type="button" class="i_list btn btn-info" value="'+$('#input_search').val()+'" onclick="btnRemove(this)">')

		}
		event.preventDefault();
	};
}); 

$('.food_box').click(function() {
	
	var e = $(event.target).text()
	var str = e.split('/')[0]
	
	
	if($('.i_list').length > 0) {
			
			var chk = false
			
			for (var i = 0; i < $('.i_list').length; i++) {
				if($('.i_list')[i].value == $('#input_search').val()) {
					alert('등록된 재료입니다.');
					chk = true
					break;
				}
			}
			if(!chk)
				$('.selected_list').append('<input type="button" class="i_list btn btn-info" value="'+str+'" onclick="btnRemove(this)">');
				
		}else {
			$('.selected_list').append('<input type="button" class="i_list btn btn-info" value="'+str+'" onclick="btnRemove(this)">')

		}
	
});

