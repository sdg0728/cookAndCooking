package com.proj.beans.userRecipe;


import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AjaxNotifyList extends AjaxWriteResult {
	
	@JsonProperty("notifydata")
	int notifydata;  
	
	
	
}













