package com.proj.beans.purchase;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class RecipeProductAjaxList {
	int count;
	String status;
	String message;
	
	@JsonProperty("data")
	private List<RecipeProductDTO> list;
}
