package com.proj.beans.admin;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AdminProducAjaxtList {
	int count;
	String status;
	String message;
	
	@JsonProperty("data")
	private List<AdminRecipeProductDTO> list;
}
