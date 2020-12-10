var chk = [false,false,false,false,false,false];

function getEmail(){
	$.ajax({
    	url : "./email/",
    	type : 'GET',
    	cache : false,
    	data: {email : $('#input_email').val() },
    	success : function(data,status) {
    		
    		if(status=="success") {
    			if(data.status == "OK") {
    				
    				console.log("???????")
    				parseJSON(data)
    				
    			}
    		}
    		
    	}
  
    });
	
}

function parseJSON(jsonObj){	
	
	var data = jsonObj.data;

	console.log($("#input_email").val())
	
	console.log(data)
	
	var result = data
	
	var currentVal = $("#input_email").val()
	var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if(result==0) {
		if(currentVal == '') {
	        $('#email_check').text('Email를 입력하세요.')
	        $('#email_check').css('color','#ee1100')
	        chk[0] = false
	    }
	    else if (!regex.test(currentVal)) {
	        $('#email_check').text('Email 형식이 잘못 되었습니다.')
	        $('#email_check').css('color','#ee1100')
	        chk[0] = false
	    }
	    else {
	        $('#email_check').text('사용가능한 email입니다.')
	        $('#email_check').css('color','#43aa32')
	        chk[0] = true
	    }
	}else {
		$('#email_check').text('사용중인 email입니다.')
        $('#email_check').css('color','#ee1100')
        chk[0] = false
	}

}

function getName(){
	
	$.ajax({
    	url : "./name/",
    	type : 'GET',
    	cache : false,
    	data: {name : $('#input_name').val() },
    	success : function(data,status) {
    		
    		if(status=="success") {
    			if(data.status == "OK")
    				parseJSON2(data)
    		}
    		
    	}
  
    });
	
}

function parseJSON2(jsonObj){	
	
	var data = jsonObj.data;
	
	var result = data
	
	var currentVal = $("#input_name").val()
	var regex = /^[가-힝a-zA-Z]{2,}$/;
		
	if(result==0) {
		if(currentVal == '') {
	        $('#name_check').text('이름을 입력하세요.')
	        $('#name_check').css('color','#ee1100')
	        chk[3] = false
	    }
	    else if (!regex.test(currentVal)) {
	        $('#name_check').text('이름의 형식이 잘못 되었습니다.')
	        $('#name_check').css('color','#ee1100')
	        chk[3] = false
	    }
	    else {
	        $('#name_check').text('사용가능한 이름입니다.')
	        $('#name_check').css('color','#43aa32')
	        chk[3] = true
	    }
	}else {
		$('#name_check').text('사용중인 닉네임입니다.')
        $('#name_check').css('color','#ee1100')
        chk[3] = false
	}

}

$("#input_pwd").blur(function() {
	var currentVal = $(this).val();
    var regex= /^[a-zA-Z0-9]{4,12}$/;

    if(currentVal == '') {
        $('#pwd_check').text('Password를 입력하세요.')
        $('#pwd_check').css('color','#ee1100')
        chk[1] = false
        
        if ($("#input_pwd_chk").val() != $("#input_pwd").val()) {
            $('#pwd_chk_check').text('Password가 일치하지 않습니다.')
            $('#pwd_chk_check').css('color','#ee1100')
            
            chk[2] = false
        }
 
    }
    else if (!regex.test(currentVal)) {
        $('#pwd_check').text('Password 영문 또는 숫자 4~12 입니다.')
        $('#pwd_check').css('color','#ee1100')
        chk[1] = false
        
        if ($("#input_pwd_chk").val() != $("#input_pwd").val()) {
            $('#pwd_chk_check').text('Password가 일치하지 않습니다.')
            $('#pwd_chk_check').css('color','#ee1100')
            chk[2] = false
        }
        
    }
    else {
        $('#pwd_check').text('사용가능한 Password입니다.')
        $('#pwd_check').css('color','#43aa32')
        chk[1] = true
        
        if ($("#input_pwd_chk").val() != $("#input_pwd").val()) {
            $('#pwd_chk_check').text('Password가 일치하지 않습니다.')
            $('#pwd_chk_check').css('color','#ee1100')
            chk[2] = false
        }else {
            $('#pwd_chk_check').text('사용가능한 Password입니다.')
            $('#pwd_chk_check').css('color','#43aa32')
            chk[2] = true
        }
    }

});


$("#input_pwd_chk").blur(function() {
    var currentVal = $(this).val();
    
    if(currentVal == '') {
        $('#pwd_chk_check').text('Password를 한번 더 입력하세요.')
        $('#pwd_chk_check').css('color','#ee1100')
        chk[2] = false
    }
    else if (currentVal != $("#input_pwd").val()) {
        $('#pwd_chk_check').text('Password가 일치하지 않습니다.')
        $('#pwd_chk_check').css('color','#ee1100')
        chk[2] = false
    }
    else {
        $('#pwd_chk_check').text('사용가능한 Password입니다.')
        $('#pwd_chk_check').css('color','#43aa32')
        chk[2] = true
    }

});

$("#input_phone").blur(function() {
	var currentVal = $(this).val();
    var regex = /^01[0-9]{1}[0-9]{3,4}[0-9]{4}$/g;

    if(currentVal == '') {
        $('#phone_check').text('전화번호를 입력하세요.')
        $('#phone_check').css('color','#ee1100')
        chk[5] = false
    }
    else if (!regex.test(currentVal)) {
        $('#phone_check').text('전화번호는 -없이 입력하세요.')
        $('#phone_check').css('color','#ee1100')
        chk[5] = false
    }
    else {
        $('#phone_check').text('사용가능한 전화번호입니다.')
        $('#phone_check').css('color','#43aa32')
        chk[5] = true
    }

});

function checkSign(check,chk) {
	for(idx in chk) {
		if(chk[idx] == check)
			return true;
	}
	return false;
}


function onSign(){
	
	if($('#address').val() != '') {
		chk[4] = true
		$('#addr').val($('#roadFullAddr').val())
	}
	
	var kind = "";
	
	$('input:checkbox[name="kind_info"]').each(function() {

		if(this.checked) {
			kind += this.value + ","
		}

	});
 
	 var taste = "";
		
	 $('input:checkbox[name="taste_info"]').each(function() {

		 if(this.checked) {
			 taste += this.value + ","
			}

	 });
	 
	 $('#kindId').val(kind)
	 $('#tasteId').val(taste)
	 
	
	if(checkSign(false,chk)) {
		console.log(checkSign(false,chk))
		alert("회원가입 조건을 모두 알맞게 입력해야 합니다.")
		return false;
	}else {
		return true;
	}
	        
}

$(document).ready(function(){
	
	$("#email_load").click(function(){
		 getEmail();
	 });
	
	$("#name_load").click(function(){
		getName();
	});
	
});

$(function() {
    $("#up-file").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    $('#img_box').append("<img id='uploadImg' />")

    reader.onload = function (e) {
            $('#uploadImg').attr('src', e.target.result);
        }
    	console.log(input.files[0])
      reader.readAsDataURL(input.files[0]);
    
    }
}

function deleteFiles(){
	
	$("#up-file").val("");
	$('#img_box').empty();
	
}