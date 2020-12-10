package com.command.ajax.cookingcls;

import java.util.List;

import com.proj.beans.cookingcls.CookRegDTO;

public interface CookRegDAO {
	
	public int cookRegInsert(CookRegDTO dto);
	public List<CookRegDTO> cookRegSel(int cno);
}
