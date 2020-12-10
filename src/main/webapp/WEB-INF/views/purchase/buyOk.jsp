<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="username" value='<%=session.getAttribute("username") %>' />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAY</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<input type="hidden" name="email" value="${email }" />
	<input type="hidden" name="address" value="${address }" />
	<input type="hidden" name="name" value="${name }" />
	<input type="hidden" name="phone" value="${phone }" />
	<input type="hidden" name="zip" value="${zip }" />
	<input type="hidden" name="purchaseno" value="${purchaseno }" />
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	
	<script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '요리조리 상품 결제',
            amount : '100',
            buyer_email : $("input:hidden[name=email]").val(),
            buyer_name : $("input:hidden[name=name]").val(),
            buyer_tel : $("input:hidden[name=phone]").val(),
            buyer_addr : $("input:hidden[name=address]").val(),
            buyer_postcode : $("input:hidden[name=zip]").val(),
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                    	msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                        //실패시 이동할 페이지
                        alert(msg);
                        history.back();
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                var param = "";
                var params = "&name="+$("input:hidden[name=name]").val()+
                			 "&phone="+$("input:hidden[name=phone]").val()+
                			 "&address="+$("input:hidden[name=address]").val();
                
                $($("input:hidden[name=purchaseno]").val().split(",")).each(function(index, item){
                	if(index == 0){
	                	param += "purchaseno=" + item;
                	} else {
	                	param += "&" + "purchaseno=" + item;
                	}
                });
                
                $.ajax({
                	url: "./buySuccess?"+param + params +"&_csrf="+$("input:hidden[name=_csrf]").val(),
                	type:"PUT",
                	cache: false,
                	success: function(data, status){
                		if(status == "success"){
                			if(data.status == "OK"){
                				alert("결제가 완료되었습니다.");
                				location.href="./orders";
                			} else {
                				alert("결제에 실패하였습니다.");
                			}
                		} else {
                			alert("결제에 실패하였습니다.");
                		}
                	}
                });
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert(msg);
                location.href="./cart";
            }
        });
        
    });
    </script>
</body>
</html>