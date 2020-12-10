package com.proj.beans.member;

import com.fasterxml.jackson.annotation.JsonProperty;

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
public class SignCheckResult extends AjaxWriteResult {
	
	@JsonProperty("data")
	int result;	// 중복확인 데이터 값

}
