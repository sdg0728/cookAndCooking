package com.proj.beans.userRecipe;


import java.util.Date;

import lombok.Data;

// DTO : Data Transfer Object
@Data
public class Ur_commentDTO {
	private int cid;
	private String content;
	private int user_rid;
	private int user_id;
	private Date regdate;
	private String email;
	private String name;
	}
		

// end DTO

