var chk = [true,true,true];


function getName(){
	
	$.ajax({
    	url : "./name/",
    	type : 'GET',
    	cache : false,
    	data: {name : $('#input_name').val() },
    	success : function(data,status) {
    		
    		if(status=="success") {
    			if(data.status == "OK")
    				parseJSON(data)
    		}
    		
    	}
  
    });
	
}

function parseJSON(jsonObj){	
	
	var data = jsonObj.data;
	
	var result = data
	
	var currentVal = $("#input_name").val()
	var regex = /^[가-힝a-zA-Z]{2,}$/;
		
	if(currentVal == $('#nameId').val()) {
		 $('#name_check').text('현재 회원의 닉네임 명과 일치합니다.')
	     $('#name_check').css('color','#43aa32')
		chk[0] = true
	}else{
		if(result==0) {
			if(currentVal == '') {
		        $('#name_check').text('이름을 입력하세요.')
		        $('#name_check').css('color','#ee1100')
		        chk[0] = false
		    }
		    else if (!regex.test(currentVal)) {
		        $('#name_check').text('이름의 형식이 잘못 되었습니다.')
		        $('#name_check').css('color','#ee1100')
		        chk[0] = false
		    }
		    else {
		        $('#name_check').text('사용가능한 이름입니다.')
		        $('#name_check').css('color','#43aa32')
		        $('#nameId').val($('#input_name').val())
		        chk[0] = true
		    }
		}else {
			$('#name_check').text('사용중인 닉네임입니다.')
	        $('#name_check').css('color','#ee1100')
	        chk[0] = false
		}
	}
	
}


$("#input_phone").blur(function() {
	var currentVal = $(this).val();
    var regex = /^01[0-9]{1}[0-9]{3,4}[0-9]{4}$/g;

    if(currentVal == '') {
        $('#phone_check').text('전화번호를 입력하세요.')
        $('#phone_check').css('color','#ee1100')
        chk[2] = false
    }
    else if (!regex.test(currentVal)) {
        $('#phone_check').text('전화번호는 -없이 입력하세요.')
        $('#phone_check').css('color','#ee1100')
        chk[2] = false
    }
    else {
        $('#phone_check').text('사용가능한 전화번호입니다.')
        $('#phone_check').css('color','#43aa32')
        chk[2] = true
    }

});


function checkSign(check,chk) {
	for(idx in chk) {
		if(chk[idx] == check)
			return true;
	}
	return false;
}


function onAccount(){
	
	$('#kindId').val('')
	$('#tasteId').val('')
	
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
	
	if($('#address').val() != '') {
		chk[1] = true
	}
	
	if($('#input_name').val() == $('#nameId').val()) {
		chk[0] = true
	}
	
	if(checkSign(false,chk)) {
		console.log(checkSign(false,chk))
		alert("회원가입 조건을 모두 알맞게 입력해야 합니다.")
		return false;
	}else {
		return true;
	}
	        
}

$(document).ready(function(){
	
	$("#name_load").click(function(){
		getName();
	});

	var kind = $('#kindId').val();
	var taste = $('#tasteId').val();
	
	var arr1 = kind.split(',')
	var arr2 = taste.split(',')
	
	 $('input:checkbox[name="kind_info"]').each(function() {

		 for (var i = 0; i < arr1.length; i++) {
			 if(this.value == arr1[i]) {
				 
				 this.checked = true
			}
		}
	
	 });
	
	 $('input:checkbox[name="taste_info"]').each(function() {

		 for (var i = 0; i < arr2.length; i++) {
			 if(this.value == arr2[i]) {
				 
				 this.checked = true
			}
		}
	
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
    
    $('#imgId').val("")
    $('#img_box').append("<img id='uploadImg' />")
    reader.onload = function (e) {
            $('#uploadImg').attr('src', e.target.result);
        }
    	console.log(input.files[0])
      reader.readAsDataURL(input.files[0]);
    
    }
}

function deleteFiles(){
	$('#imgId').val("noimg.png")
	$("#up-file").val("");
	$('#img_box').empty();
	
}

window.onload  = function() {
	

	
}
