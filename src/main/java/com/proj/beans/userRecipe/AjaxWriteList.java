package com.proj.beans.userRecipe;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AjaxWriteList extends AjaxWriteResult {
	
	
	@JsonProperty("data")
	List<RecipeWriteDTO> list;  
	
	@JsonProperty("data1")
	List<RecipeWriteDTO> list1;  // 데이터 목록
	
	@JsonProperty("data2")
	List<String> list2;
	
	@JsonProperty("isChk")
	List<PreferenceDTO> isChk;

	
	
}













