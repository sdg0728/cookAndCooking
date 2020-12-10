package com.proj.beans.admin;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.proj.beans.purchase.ApplyRecipeDTO;

import lombok.Data;

@Data
public class AdminApplyAjaxList {
	int count;
	String status;
	String message;
	
	@JsonProperty("data")
	private List<ApplyRecipeDTO> list;
}
