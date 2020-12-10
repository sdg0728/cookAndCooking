package com.proj.beans.admin;

import lombok.Data;

@Data
public class AdminTotalPrice {
	private String price;
	private int count;
	
	public int total() {
		String str = "";
		for (String num : price.split(",")) {
			str += num;
		}
		return Integer.parseInt(str) * count;
	}
}
