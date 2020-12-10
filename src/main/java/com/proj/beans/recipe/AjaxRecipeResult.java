package com.proj.beans.recipe;

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
public class AjaxRecipeResult extends AjaxResult {
	
	@JsonProperty("data")
	List<RecipeDTO> result;

}
