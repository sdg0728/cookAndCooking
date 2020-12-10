package com.proj.beans.member;

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
public class MemberDTO {
	private int user_id;
	private String email;
	private String pw;
	private String name;
	private String address;
	private String tel;
	private String taste;
	private String kind;
	private String img;
	private double score;
	private int u_check;
	
}
