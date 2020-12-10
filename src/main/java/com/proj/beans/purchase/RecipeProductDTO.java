package com.proj.beans.purchase;

import lombok.Data;

@Data
public class RecipeProductDTO {
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
}
