package com.proj.beans.userRecipe;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserRecipeDTO {
	
	private int user_rid;
	private String name;
	private int kind;
	private int taste;
	private String img;
	private String ingredient;
	private String regdate;
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
}
