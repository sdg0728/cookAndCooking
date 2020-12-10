package com.proj.beans.userRecipe;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

// DTO : Data Transfer Object
@Data
public class RecipeWriteDTO {
	private int user_rid;    // user_RID
	private String name;  // name
	private int kind;  // kind
	private String taste;  // kind
	private String img;   // img
	private String ingredient; // INGREDIENT
	private String regdate;   // regdate
	private String recipe_1; 
	private String recipe_2; 
	private String recipe_3; 
	private String recipe_4; 
	private String recipe_5; 
	private String recipe_6; 
	private String recipe_7; 
	private String recipe_8; 
	private String recipe_9; 
	private String recipe_10; 
	private int user_id; //ID
	private String email; //  
	
	
	public void setRegdate(Date regdate) {
		this.regdate = new SimpleDateFormat("yyyy-MM-dd").format(regdate);
	}
		
} // end DTO

