package com.proj.beans.userRecipe;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

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
public class AjaxUserRecipeResult extends UserRecipeAjaxResult {
	
	@JsonProperty("data")
	List<UserRecipeDTO> result;

}
