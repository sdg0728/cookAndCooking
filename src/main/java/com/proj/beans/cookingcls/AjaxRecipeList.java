package com.proj.beans.cookingcls;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AjaxRecipeList extends AjaxRecipeResult{

	
	
	@JsonProperty("data")
	List<RecipeDTO> list;  // 데이터 목록
	
	
	@JsonProperty("pref")
	List<PreferenceDTO> pref;
	

}
