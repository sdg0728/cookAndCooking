package com.proj.beans.cookingcls;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RecipeCommentDTO {
	
	private int cid;
	private String content;
	private Timestamp regdate;
	private int rid;
	private int user_id;
	private String username;
	private String email;
	private String name;
//	
//	 "CID" NUMBER, 
//		"CONTENT" VARCHAR2(200 BYTE), 
//		"REGDATE" TIMESTAMP (6) DEFAULT sysdate, 
//		"USER_RID" NUMBER, 
//		"USER_ID" NUMBER
}
