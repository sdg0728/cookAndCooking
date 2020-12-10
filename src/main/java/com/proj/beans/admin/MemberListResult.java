package com.proj.beans.admin;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.proj.beans.member.MemberDTO;

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
public class MemberListResult extends AjaxAdminWriteResult {

	@JsonProperty("data")
	List<MemberDTO> list;	
	
}
