package com.proj.beans.admin;

import lombok.Data;

@Data
public class AdminRecipeProductDTO {
	private String[] category = {"", "한식", "중식", "일식", "양식", "퓨전", "기타"}; 
	private int pid;
	private int p_price;
	private String p_content;
	private int p_count;
	private String p_name;
	private String p_img;
	private String p_kind;
	private int p_taste;
	private double r_score;
	
	public void setR_score(double r_score) {
		this.r_score = (double)((int)(r_score * 10)) / 10;
	}
	
	public void setP_kind(int p_kind) {
		this.p_kind = category[p_kind];
	}
}
