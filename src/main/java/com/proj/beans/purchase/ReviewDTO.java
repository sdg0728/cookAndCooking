package com.proj.beans.purchase;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int prid;
	private String r_comment;
	private String r_img;
	private double r_score;
	private int user_id;
	private int pid;
	private String r_regdate;
	
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = new SimpleDateFormat("yyyy-MM-dd").format(r_regdate);
	}
}
