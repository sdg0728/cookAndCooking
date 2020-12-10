package com.proj.beans.purchase;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class PurchaseDTO {
	private int purchaseno;
	private int user_id;
	private int pid;
	private String p_name;
	private String price;
	private String name;
	private String deliver;
	private String phone;
	private String buydate;
	private int deliverchk;
	private int pchk;
	private int count;
	
	public void setBuydate(Timestamp buydate) {
		this.buydate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(buydate);
	}
}
