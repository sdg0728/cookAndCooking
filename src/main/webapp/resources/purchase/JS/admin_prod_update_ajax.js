/**
 * 
 */
var kinds = ["","한식","중식","일식","양식","퓨전","기타"];
var tastes = ["","밥/죽/떡","면/만두","국물","구이/찜/조림","볶음/튀김/부침","나물/샐러드","베이킹/디저트","양념","음료"];

$("button[name=update]").click(function() {
	if($("button[name=update]").attr("data-status") == "0"){
		//div값 가져오기
		var price = $(".price").text();
		var kind = $(".kind").text();
		var taste = $(".taste").text();
		var content = $(".a-content").text();
		var count = $(".count").text();
		var str = "";
		
		//값이 담긴 div 삭제
		$(".price").remove();
		$(".kind").remove();
		$(".taste").remove();
		$(".a-content").remove();
		$(".count").remove();
		
		//삭제된 div 자리에 input넣기
		$(".add-prod-price").append("<input type='text' name='price' class='price form-control' value='" + price + "' />");
		
		str = "<select name='kind' class='form-control'>"
		for (var i = 1; i <= 6; i++) {
			if(kinds[i] == kind){
				str += "<option value='" + i + "' selected>" + kinds[i] + "</option>"
			} else {
				str += "<option value='" + i + "'>" + kinds[i] + "</option>"
			}
		}
		str += "</select>";
		$(".add-prod-kind").append(str);
		
		str = "<select name='taste' class='form-control'>"
			for (var i = 1; i <= 6; i++) {
				if(tastes[i] == taste){
					str += "<option value='" + i + "' selected>" + tastes[i] + "</option>"
				} else {
					str += "<option value='" + i + "'>" + tastes[i] + "</option>"
				}
			}
		str += "</select>";
		$(".add-prod-taste").append(str);
		
		$(".a-prod-content").append("<textarea name='content' class='content form-control'>" + content + "</textarea>");
		$(".add-prod-count").append("<input type='text' name='count' class='count form-control' value='" + count + "' />");
		$("input:file[name=upload]").removeClass("hidden");
		
		//버튼 수정하기
		$("button[name=update]").text("수정완료");
		$("button[name=update]").attr("data-status", "1");
	} else {
		var price = $("input:text[name=price]").val().trim();
	      var count = $("input:text[name=count]").val().trim();
	      var content = $("textarea[name=content]").val().trim();
	      var upload = $("input:file[name=upload]")[0].files[0];
	      
	      var regNum = /^[0-9]*$/;
	      
	      if(price == "" ||  count == "" || content == "") {
	         alert("공백없이 입력해 주세요.");
	         return false;
	      }
	      
	      if(!regNum.test(price)) {
	         alert("숫자만 입력해 주세요.");
	         $("input:text[name=p_price]").focus();
	         return false;
	      }
	      
	      if(!regNum.test(count)) {
	         alert("숫자만 입력해 주세요.");
	         $("input:text[name=p_count]").focus();
	         return false;
	      }
	      
	      if(upload == undefined){
	         alert("이미지를 첨부해 주세요.");
	         return false;
	      }
		
		$("form[name=updateFrom]").submit();
	}
});