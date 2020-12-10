package com.proj.beans.admin;

import lombok.Data;

@Data
public class RecipeProductDTO {
	String[] kinds = { "", "한식", "중식", "일식", "양식", "퓨전", "기타" };
	String[] tastes = { "", "밥/죽/떡", "면/만두", "국물", "구이/찜/조림", "볶음/튀김/부침", "나물/샐러드", "베이킹/디저트", "양념", "음료" };
	
	private int pid;
	private int p_price;
	private String p_content;
	private int p_count;
	private String p_name;
	private String p_img;
	private String p_kind;
	private int kind;
	private String p_taste;
	private int taste;

	public void setP_kind(int p_kind) {
		this.p_kind = kinds[p_kind];
	}

	public void setP_taste(int p_taste) {
		this.p_taste = tastes[p_taste];
	}
	
	public void setKind() {
		for (int i = 0; i < kinds.length; i++) {
			if(kinds[i].equals(p_kind)) {
				this.kind = i;
				return;
			}
		}
	}
	
	public void setTaste() {
		for (int i = 0; i < tastes.length; i++) {
			if(tastes[i].equals(p_taste)) {
				this.taste = i;
				return;
			}
		}
	}
}
