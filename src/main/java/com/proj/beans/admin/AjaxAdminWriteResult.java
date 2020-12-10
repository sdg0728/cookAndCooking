package com.proj.beans.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AjaxAdminWriteResult {
	int count;	// 데이터 개수
	String status; // 처리 결과
	String message; // 결과 메세지
}
