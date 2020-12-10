package com.proj.beans.purchase;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.proj.beans.member.MemberDTO;

import lombok.Data;

@Data
public class RecipeUserinfoAjaxList {
	int count;
	String status;
	String message;
	
	@JsonProperty("data")
	private List<MemberDTO> list;
}
