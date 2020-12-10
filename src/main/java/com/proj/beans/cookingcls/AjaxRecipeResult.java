package com.proj.beans.cookingcls;

import lombok.Data;

@Data
public class AjaxRecipeResult {
	
	   int count;  //  데이터 개수
	   String status;  // 처리 결과
	   String message;  // 결과 메세지
	   
}
