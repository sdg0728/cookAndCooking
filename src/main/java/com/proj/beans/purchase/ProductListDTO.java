package com.proj.beans.purchase;

import lombok.Data;

@Data
public class ProductListDTO {
	private String productno;
	private String category_code;
	private String category_name;
	private String productName;
	private String unit;
	private String dpr1;
	private String direction;
	private String value;
}
