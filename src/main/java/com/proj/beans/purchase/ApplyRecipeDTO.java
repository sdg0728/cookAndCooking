package com.proj.beans.purchase;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class ApplyRecipeDTO {
	private int applyno;
	private int a_price;
	private String a_content;
	private int a_count;
	private String a_name;
	private String a_img;
	private int a_kind;
	private int a_taste;
	private String u_name;
	private int a_sell;
	private int a_check;
	private String regdate;
	
	public void setRegdate(Timestamp regdate) {
		this.regdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(regdate);
	}
}
