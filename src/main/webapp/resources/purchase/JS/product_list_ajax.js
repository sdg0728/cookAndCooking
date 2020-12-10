/**
 * 
 */
let $tbody = $("tbody[class=prod_tbody]");
let api_key = "e2634638-5046-4d61-9755-5d440aa564c4";
let p_cert_id = "1334";

$("document").ready(function() {
	$.ajax({
		crossOrigin: true,
		url : "http://www.kamis.or.kr/service/price/xml.do?action=dailySalesList&p_cert_key="+api_key+"&p_cert_id="+p_cert_id+"&p_returntype=xml",
		type: "GET",
		cache: false,
		success: function(data, status){
			if(status == "success"){
				setList(data);
			}
		}
	});
});

function setList(jsonObj){
    result = "";  // 최종 결과물

    if(jsonObj.status == "OK"){
        var count = jsonObj.price.length;
        console.log(count);
        
        window.page = jsonObj.page;
        window.pageRows = jsonObj.pagerows;  // <-- fixed by '리정민' 

        var items = jsonObj.data;  // 글 배열
        var i;
        for(i = 0; i < count; i++){
        	var date = new Date(items[i].regdate);
        	
            result += "<tr>\n";
            result += "<td><input type='checkbox' name='uid' value='" + items[i].uid + "'>" + "</td>\n";
            result += "<td>" + items[i].uid + "</td>\n";
            result += "<td><span class='subject' data-uid='" + items[i].uid + "'>" + items[i].subject + "</span></td>\n";
            result += "<td>" + items[i].name + "</td>\n";
            result += "<td><span data-viewcnt='" + items[i].uid + "'>" + items[i].viewcnt + "</span></td>\n";
            result += "<td>" + date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + "</td>\n";
            result += "</tr>\n";
        }
        $("#list tbody").html(result);   // 글 목록 업데이트

        // 페이지 정보 업데이트
        $("#pageinfo").text(jsonObj.page + "/" + jsonObj.totalpage + "페이지, " + jsonObj.totalcnt +"개의 글");

        // pageRows
        var txt = "<select id='rows' onchange='changePageRows()'>\n";
        txt += "<option " + ((window.pageRows == 10) ? "selected" : "") + " value='10'>10개씩</option>\n";
        txt += "<option " + ((window.pageRows == 20) ? "selected" : "") + " value='20'>20개씩</option>\n";
        txt += "<option " + ((window.pageRows == 50) ? "selected" : "") + " value='50'>50개씩</option>\n";
        txt += "<option " + ((window.pageRows == 100) ? "selected" : "") + " value='100'>100개씩</option>\n";
        txt += "</select>\n";
        $("#pageRows").html(txt);

        // 페이징 정보 업데이트
        var pagination = buildPagination(jsonObj.writepages, jsonObj.totalpage, jsonObj.page, jsonObj.pagerows);
        $("#pagination").html(pagination);

        return true;
    } else {
        alert("내용이 없습니다");
        return false;
    }
}

// 페이징 생성
// 한페이징에 표시될 페이지수 --> writePages
// 총 페이지수 --> totalPage
// 현재 페이지 --> curPage

function buildPagination(writePages, totalPage, curPage, pageRows){
	var str = "";   // 최종적으로 페이징에 나타날 HTML 문자열 <li> 태그로 구성
	
	// 페이징에 보여질 숫자들 (시작숫자 start_page ~ 끝숫자 end_page)
    var start_page = ( (parseInt( (curPage - 1 ) / writePages ) ) * writePages ) + 1;
    var end_page = start_page + writePages - 1;

    if (end_page >= totalPage){
    	end_page = totalPage;
    }
    
  //■ << 표시 여부
	if(curPage > 1){
		str += "<li><a onclick='loadPage(" + 1 + ")' class='tooltip-top' title='처음'><i class='fas fa-angle-double-left'></i></a></li>\n";
	}
	
  	//■  < 표시 여부
    if (start_page > 1) 
    	str += "<li><a onclick='loadPage(" + (start_page - 1) + ")' class='tooltip-top' title='이전'><i class='fas fa-angle-left'></i></a></li>\n";
    
    //■  페이징 안의 '숫자' 표시	
	if (totalPage > 1) {
	    for (var k = start_page; k <= end_page; k++) {
	        if (curPage != k)
	            str += "<li><a onclick='loadPage(" + k + ")'>" + k + "</a></li>\n";
	        else
	            str += "<li><a class='active tooltip-top' title='현재페이지'>" + k + "</a></li>\n";
	    }
	}
	
	//■ > 표시
    if (totalPage > end_page){
    	str += "<li><a onclick='loadPage(" + (end_page + 1) + ")' class='tooltip-top' title='다음'><i class='fas fa-angle-right'></i></a></li>\n";
    }

	//■ >> 표시
    if (curPage < totalPage) {
        str += "<li><a onclick='loadPage(" + totalPage + ")' class='tooltip-top' title='맨끝'><i class='fas fa-angle-double-right'></i></a></li>\n";
    }

    return str;
}