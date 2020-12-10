package com.proj.beans.cookingcls;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AjaxCookList extends AjaxRecipeResult{

	@JsonProperty("data")
	List<CookingDTO> list;
	
	@JsonProperty("dataNum")
	UserInfoDTO user;
	
}
