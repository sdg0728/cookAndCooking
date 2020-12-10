/**
 * 
 */

$(window).load(function() {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp48894347'); // 가맹점 식별 코드
});

function pay(){
	
	IMP.request_pay({
		pg : 'kakaopay', // 결제방식
		pay_method : 'card', // 결제 수단
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '주문명: 결제 테스트', // order 테이블에 들어갈 주문명 혹은 주문 번호
		amount : '100', // 결제 금액
		buyer_email : email, // 구매자 email
		buyer_name : $("input:text[name=name]").val(), // 구매자 이름
		buyer_tel : $("input:text[name=phone]").val(), // 구매자 전화번호
		buyer_addr : $("input:text[name=address]").val(), // 구매자 주소
		buyer_postcode : $("input:hidden[name=zip]").val(), // 구매자 우편번호
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
	    			merchant_uid : rsp.merchant_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	});
}