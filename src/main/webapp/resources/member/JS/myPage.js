$("document").ready(function() {
	
	var kind = $('#textKind').val()
	var taste = $('#textTaste').val()
	
	var arr1 = kind.split(',')
	var arr2 = taste.split(',')
	
	var kindText = ""
	var tasteText = ""
	
	for (var i = 0; i < arr1.length; i++) {
		switch(arr1[i]) {
		case '1':
			kindText += '한식, ';
			break;
		case '2':
			kindText += '중식, ';
			break;
		case '3':
			kindText += '일식, ';
			break;
		case '4':
			kindText += '양식, '	;
			break;
		case '5':
			kindText += '퓨전, ';
			break;
		case '6':
			kindText += '기타, ';
			break;
		}	
				
	}
	
	for (var i = 0; i < arr2.length; i++) {
		switch(arr2[i]) {
		case '1':
			tasteText += '밥/죽/떡, ';
			break;
		case '2':
			tasteText += '면/만두, ';
			break;
		case '3':
			tasteText += '국물, ';
			break;
		case '4':
			tasteText += '구이/찜/조림, '	;
			break;
		case '5':
			tasteText += '볶음/튀김/부침, ';
			break;
		case '6':
			tasteText += '나물/샐러드, ';
			break;
		case '7':
			tasteText += '베이킹/디저트, ';
			break;
		case '8':
			tasteText += '양념, ';
			break;
		case '9':
			tasteText += '음료, ';
			break;
		}	
		
				
	}
	
	
	$('#myKind_box').append('<h2>취향1: '+kindText.slice(0,-2)+'</h2>')
	$('#myTaste_box').append('<h2>취향2: '+tasteText.slice(0,-2)+'</h2>')
	
	
});