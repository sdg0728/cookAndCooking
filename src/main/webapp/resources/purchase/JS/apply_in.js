/**
 * 
 */

function check(){
   var name = $("input:text[name=a_name]").val().trim();
   var price = $("input:text[name=a_price]").val().trim();
   var content = $("#a_content").val().trim();
   var count = $("input:text[name=a_count]").val().trim();
   var upload = $("input:file[name=upload]")[0].files[0];
   
   console.log(name + " " + price + " " + content + " " + count + " " + upload + " ")
   
   var regName = /^[가-힣]*$/;
   var regNum = /^[0-9]*$/;

   if(!regName.test(name) ||  name == "") {
      alert("한글만 입력하세요.");
      return false;
   }
   
   if(!regNum.test(price) ||  price == "" || !regNum.test(count) ||  count == "") {
      alert("숫자만 입력하세요.");
      return false;
   }
   
   if(upload == undefined){
      alert("이미지를 첨부해 주세요.");
      return false;
   }
   
   if(content == ""){
      alert("상세설명을 적어주세요.");
      return false;
   }
   
   return true;
}

$(".apply").click(function(){
	var email = $(".username").text();
	
	$.ajax({
		url: "./checkScore?email=" + email,
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				if(data.status == "OK"){
					if(data.data[0].score >= 1000){
						location.href="./aprecipe";
					} else {
						alert("1000점 이상만 신청할 수 있습니다.");
					}
				} else {
					alert("다시 눌러 주세요.");
				}
			} else {
				alert("다시 눌러 주세요.");
			}
		}
	});
});