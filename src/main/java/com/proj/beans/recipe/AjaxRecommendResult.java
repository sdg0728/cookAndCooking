package com.proj.beans.recipe;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.proj.beans.userRecipe.UserRecipeDTO;

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
public class AjaxRecommendResult extends AjaxResult {
	
	@JsonProperty("data1")
	List<RecipeDTO> result1;	// 데이터 값
	@JsonProperty("data2")
	List<UserRecipeDTO> result2;
	
}
