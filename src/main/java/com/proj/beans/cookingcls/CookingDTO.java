package com.proj.beans.cookingcls;




import java.sql.Date;

import lombok.Data;

@Data
public class CookingDTO {

	
	
	private int cno;
	private String name;
	private int people;
	private int kind;
	private Date enddate;
	private Date dday;
	private String c_content;
	private String c_address;
	private int c_price;
	private int user_id;
	private int chk;
	private String img;
	//private String username;
//	
//	
//    "CNO" NUMBER, 
//	"NAME" VARCHAR2(30 BYTE), 
//	"PEOPLE" NUMBER, 
//	"KIND" NUMBER, 
//	"ENDDATE" TIMESTAMP (6), 
//	"DDAY" DATE, 
//	"C_CONTENT" VARCHAR2(3000 BYTE), 
//	"C_ADDRESS" VARCHAR2(100 BYTE), 
//	"C_PRICE" NUMBER, 
//	"USER_ID" NUMBER
}
