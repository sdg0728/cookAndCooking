package com.proj.beans.admin;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.proj.beans.purchase.PurchaseDTO;

import lombok.Data;

@Data
public class AdminPurchaseAjaxtList {
	int count;
	String status;
	String message;
	
	@JsonProperty("data")
	private List<PurchaseDTO> list;
}
