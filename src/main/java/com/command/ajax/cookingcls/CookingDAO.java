package com.command.ajax.cookingcls;

import java.util.List;

import com.proj.beans.cookingcls.CookingDTO;

public interface CookingDAO {

	public List<CookingDTO> selectAll();
	public int insert(CookingDTO dto);
	public List<CookingDTO> myCls(String email);
	public List<CookingDTO> signCls(String email);
}
