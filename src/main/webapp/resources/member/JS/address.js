/**
 * 
 */
//var token = $("input[name='_csrf']").val();
//var header = $("input[name='_csrf_header']").val();
//
//$(function() {
//    $(document).ajaxSend(function(e, xhr, options) {
//    	xhr.setRequestHeader(header, token);
//    });
//});

function getAddr(){
	// 적용예 (api 호출 전에 검색어 체크) 	
	if (!checkSearchedWord(document.userInfo.keyword)) {
		return ;
	}

	$.ajax({
		 url :"https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#userInfo").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			$("#list").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					makeListJson(jsonStr);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table class='table' id='addr-table'><thead class='thead-dark'>" +
			   "<tr><th scope='col'>지번</th><th scope='col'>도로명주소</th></tr></thead><tbody>";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td class='zipNo' onclick='selectAddr()'>"+this.zipNo+"</td>";
		htmlStr += "<td class='roadAddr' onclick='selectAddr()'>"+this.roadAddr+"</td>";
		htmlStr += "</tr>";
	});
	htmlStr += "</tbody></table>";
	
	$("#list").html(htmlStr);
}

function selectAddr(){
	$("input:text[name=address]").val($(event.target).parent().children(".roadAddr").text());
	$("input:hidden[name=zip]").val($(event.target).parent().children(".zipNo").text());
	var str = "<div class='form-group'>" +
			"<label id='addrLabel' for='detail-addr'>상세주소</label>" +
			"<input type='text' name='detail-addr' id='detail-addr' class='form-control' placeholder='상세 주소 입력'>" +
			"<input type='button' name='set-datail' class='btn btn-dark btn-full' value='상세 주소 입력' onclick='setDetail()'>" +
			"</div>"
	$("#list").html(str);
	
	
	
}

function setDetail(){
	var addr = $("input:text[name=address]").val();
	var datailAddr = $("input:text[name=detail-addr]").val();
	
	$("input:text[name=address]").val(addr + " " + datailAddr);
	$("#list").html("");
	$("input:text[name=keyword]").val("");
}

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp( sqlArray[i] ,"gi") ;
			
			if (regex.test(obj.value) ) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
		}
	}
	return true ;
}

function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		getAddr(); //jsonp사용시 enter검색 
	} 
}