
var _csrf = $("input:hidden[name=_csrf]").val();

function check() {
	
	if($('#input_nickName').val() == '') {

	    alert("이름을 입력해 주세요.");
	
	    $('#input_nickName').focus();
	
	    return false;
	} else if($('#input_phone').val() == '') {

	    alert("전화번호를 입력해 주세요.");
	
	    $('#input_phone').focus();
	
	    return false;
	}
	else  {
		window.open("search_popup?&_csrf=" + _csrf+"&name="+$('#input_nickName').val()+"&tel="+$('#input_phone').val(), "a", "width=400, height=300, left=500, top=200");
		return true;
	}

}