/**
 * 
 */
$("form[name=add-prod-frm]").submit(function() {
	var name = $("input:text[name=p_name]").val().trim();
	var price = $("input:text[name=p_price]").val().trim();
	var count = $("input:text[name=p_count]").val().trim();
	var content = $("textarea[name=p_content]").val().trim();
	var upload = $("input:file[name=upload]")[0].files[0];

	var regName = /^[가-힣]*$/;
	var regNum = /^[0-9]*$/;

	if (name == "" || price == "" || count == "" || content == "") {
		alert("공백없이 입력해 주세요.");
		return false;
	}

	if (!regName.test(name)) {
		alert("한글만 입력해 주세요.");
		$("input:text[name=p_name]").focus();
		return false;
	}

	if (!regNum.test(price)) {
		alert("숫자만 입력해 주세요.");
		$("input:text[name=p_price]").focus();
		return false;
	}

	if (!regNum.test(count)) {
		alert("숫자만 입력해 주세요.");
		$("input:text[name=p_count]").focus();
		return false;
	}

	if (upload == undefined) {
		alert("이미지를 첨부해 주세요.");
		return false;
	}

	return true;
});